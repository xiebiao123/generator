package ${rootName}.${tableName}.${package};

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ${rootName}.base.BaseController;

import ${rootName}.${tableName}.dto.${TableName};
import ${rootName}.${tableName}.dto.${TableName}Condition;
import ${rootName}.${tableName}.service.${TableName}Service;
import ${rootName}.enums.CommStatusEnum;
import ${rootName}.enums.CommErrorEnum;
import ${rootName}.util.MyResponse;

/**
 * ${tableComment}controller
 * @author xieb
 * @version 1.00
 * ${date}
 */
@Controller
@RequestMapping(value = "${tableName}")
public class ${classdef} extends BaseController{

    private final Logger logger = Logger.getLogger(${classdef}.class);
	
	@Resource
	private ${TableName}Service ${tableName}Service;
	
	/**
	 *通过id查找${tableComment}
	 */
	@ResponseBody
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public MyResponse<${TableName}> findCityById(@PathVariable Integer id) {
		MyResponse<${TableName}> response = new MyResponse<${TableName}>();
		try {
			${TableName} ${tableName}= ${tableName}Service.findById(id);
			response.setData(${tableName});
			logger.info(${tableName});
			response.setStatusResponse(CommStatusEnum.FIND);
		} catch (Throwable t) {
			logger.error("系统错误", t);
			response.setErrorResponse(CommErrorEnum.Err03);
		}
		return response;
	}

	/**
	 *添加${tableComment}
	 */
	@ResponseBody
	@RequestMapping(method = RequestMethod.POST)
	public MyResponse<Void> addCity(@Valid @RequestBody ${TableName} ${tableName}) {
		MyResponse<Void> response = new MyResponse<Void>();
		try {
			Integer id = ${tableName}Service.add(${tableName});
			logger.info(id);
			response.setStatusResponse(CommStatusEnum.ADD);
		} catch (Throwable t) {
			logger.error("系统错误", t);
			response.setErrorResponse(CommErrorEnum.Err03);
		}
		return response;
	}

	/**
	 *删除${tableComment}
	 */
	@ResponseBody
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public MyResponse<Void> deleteCity(@PathVariable Integer id) {
		MyResponse<Void> response = new MyResponse<Void>();
		try {
			int count = ${tableName}Service.delete(id);
			logger.info(count);
			response.setStatusResponse(CommStatusEnum.DELETE);
		} catch (Throwable t) {
			logger.error("系统错误", t);
			response.setErrorResponse(CommErrorEnum.Err03);
		}
		return response;
	}

	/**
	 *修改${tableComment}
	 */
	@ResponseBody
	@RequestMapping(method = RequestMethod.PUT)
	public MyResponse<Void> updateCity(@Valid @RequestBody ${TableName} ${tableName}) {
		MyResponse<Void> response = new MyResponse<Void>();
		try {
			int count = ${tableName}Service.update(${tableName});
			logger.info(count);
			response.setStatusResponse(CommStatusEnum.UPDATE);
		} catch (Throwable t) {
			logger.error("系统错误", t);
			response.setErrorResponse(CommErrorEnum.Err03);
		}
		return response;
	}

	/**
	 *通过条件分页查询${tableComment}
	 */
	@ResponseBody
	@RequestMapping(method = RequestMethod.GET)
	public MyResponse<List<${TableName}>> findCityPageByCondition(${TableName}Condition condition) {
		MyResponse<List<${TableName}>> response = new MyResponse<List<${TableName}>>();
		try {
			/*初始化分页查询*/
			if(condition.getPageSize()>0){
				condition.init();
			}
			int count =  ${tableName}Service.countByCondition(condition);
			if(count==0){
				response.setStatusResponse(CommStatusEnum.NOFIND);
				return response;
			}
			response.setToken(count);
			List<${TableName}> ${tableName}List = ${tableName}Service.findPageByCondition(condition);
			logger.info(${tableName}List);
			response.setData(${tableName}List);
			response.setStatusResponse(CommStatusEnum.FIND);
		} catch (Throwable t) {
			logger.error("系统错误", t);
			response.setErrorResponse(CommErrorEnum.Err03);
		}
		return response;
	}
}
