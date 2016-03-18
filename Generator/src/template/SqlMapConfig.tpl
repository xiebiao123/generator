<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE sqlMapConfig PUBLIC
  "-//iBATIS.com//DTD SQL Map Config 2.0//EN" "http://www.ibatis.com/dtd/sql-map-config-2.dtd">

<sqlMapConfig>
    <properties resource="conf/sqlmap/sqlmap.properties"></properties>
	<settings cacheModelsEnabled="true" 
		enhancementEnabled="true"
		lazyLoadingEnabled="true"
		errorTracingEnabled="true" 
		maxRequests="320"
		maxSessions="100" 
		maxTransactions="50" 
		useStatementNamespaces="true" />
		
	<typeHandler jdbcType="BLOB" javaType="[B" callback="org.springframework.orm.ibatis.support.BlobByteArrayTypeHandler" />
	<typeHandler jdbcType="CLOB" javaType="java.lang.String" callback="org.springframework.orm.ibatis.support.ClobStringTypeHandler" />

	<#list xmlPathList as xmlPath>
<sqlMap resource="${xmlPath}" />
	</#list>

</sqlMapConfig>