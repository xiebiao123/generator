package ${rootName}.${tableName}.${package};

import java.util.List;

import ${rootName}.${tableName}.dto.${TableName};
import ${rootName}.${tableName}.dto.${TableName}Condition;

/**
 * ${tableComment}Service
 * @version 1.0
 * @author xieb
 * @date 2014年12月9日 下午2:08:06
 *
 */
public interface ${TableName}Service {

	/**
	 * 新增${tableComment}
	 */
	public Integer add(${TableName} po);
	/**
	 * 删除${tableComment}
	 */
	public int delete(Integer id);
	/**
	 * 修改${tableComment}
	 */
	public int update(${TableName} po);
	/**
	 * 根据id获取${tableComment}
	 */
	public ${TableName} findById(Integer id);
	/**
	 * 分页查询${tableComment}
	 */
	public List<${TableName}> findPageByCondition(${TableName}Condition pc);
	
	/**
	 * 统计查询数据的条数
	 */
	public Integer countByCondition(${TableName}Condition pc);
	
}
