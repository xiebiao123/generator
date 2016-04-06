<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE sqlMap PUBLIC "-//ibatis.apache.org//DTD SQL Map 2.0//EN" "http://ibatis.apache.org/dtd/sql-map-2.dtd">

<sqlMap namespace="${tableName?cap_first}">
	<!--引入pojo-->
	<typeAlias alias="${tableName}" type="${rootName}.${tableName}.${dtoPackage}.${tableName?cap_first}" />
	<typeAlias alias="${tableName}Condition" type="${rootName}.${tableName}.${dtoPackage}.${tableName?cap_first}Condition" />

	<!-- search resultMap -->
	<resultMap id="${tableName}Result" class="${tableName}">
	<#list rsltSetColumList as rsltSetColum>
		<result property="${rsltSetColum.value}" column="${rsltSetColum.key}" />
	</#list>
	</resultMap>

	<sql id="queryCondition">
		${ColumbSql}
	</sql>
	
	<!--插入语句-->
	<insert id="add">
		INSERT INTO
			${insertKeySql}
		values
			${insertValueSql}
		<selectKey resultClass="java.lang.Integer" keyProperty="id">  
        	select last_insert_id() as ID from ${tableName} limit 1  
    	</selectKey>
	</insert>

	<!--删除语句 -->
    <delete id="delete" parameterClass="java.lang.Integer">  
        DELETE FROM 
        	${tableNameSql} 
        WHERE 
        	id = #id#  
    </delete>
    
    <!--修改语句 -->
    <update id="update" parameterClass="${tableName}">  
        UPDATE 
        	${tableNameSql} 
        SET <!-- updateTime = sysdate  -->
		<dynamic>
			${updateSql}
		</dynamic>
        WHERE 
        	id = #id# 
    </update>
    
    <!--通过id查找 -->
	<select id="findById" resultMap="${tableName}Result">
		SELECT  
			<include refid="queryCondition"/> 
		FROM 
			${tableNameSql} 
		WHERE
			id = #id#
	</select>
	
	
	<sql id="queryConditionSql">
		SELECT 
			<include refid="queryCondition"/> 
		FROM  
			${tableNameSql} 
	    <dynamic prepend="WHERE">
${conditionSql}
	    </dynamic>
	</sql>
	
	<!--分页查询-->
	<select id="findPageByCondition" resultMap="${tableName}Result" parameterClass="${tableName}Condition">
		<include refid="queryConditionSql"/>
		limit 
			#startRow#,#endRow# 
	</select>
	
	<select id="countByCondition" parameterClass="${tableName}Condition" resultClass="java.lang.Integer">
		select 
			count(*) 
		from 
			(<include refid="queryConditionSql"/>) as da
	</select>
	
</sqlMap>
