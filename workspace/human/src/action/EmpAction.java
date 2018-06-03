package action;

import java.util.ArrayList;
import java.util.List;

import dao.EmpDao;
import doman.Emp;

public class EmpAction {
	private int page=1;
	private int pageSize = 3;
	private int pageSum;
	private Emp emp;
	private List<Emp> list = new ArrayList<Emp>();
	private int id;
	private String empName;
	private String empBirthday;
	private String empSex; //性别
	private String empAddress;
	private String empTel;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSum() {
		return pageSum;
	}
	public void setPageSum(int pageSum) {
		this.pageSum = pageSum;
	}
	public Emp getEmp() {
		return emp;
	}
	public void setEmp(Emp emp) {
		this.emp = emp;
	}
	public List<Emp> getList() {
		return list;
	}
	public void setList(List<Emp> list) {
		this.list = list;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpBirthday() {
		return empBirthday;
	}
	public void setEmpBirthday(String empBirthday) {
		this.empBirthday = empBirthday;
	}

	public String getEmpSex() {
		return empSex;
	}
	public void setEmpSex(String empSex) {
		this.empSex = empSex;
	}
	public String getEmpAddress() {
		return empAddress;
	}
	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}
	public String getEmpTel() {
		return empTel;
	}
	public void setEmpTel(String empTel) {
		this.empTel = empTel;
	}
	/*************按页查询所有员工信息********************/
	public String findEmps() {
		EmpDao empdao = new EmpDao();
		list = empdao.findAll(page,pageSize);
		setList(list);
		pageSum = empdao.pageSum(pageSize);
		setPageSum(pageSum);
		return "success";
	}
	
	/**************打开员工添加页面*******************/
	public String addEmp() {
		return "success";
	}
	
	/******************添加员工信息**********************/
	public String insertEmp() {
		Emp emp = new Emp();
		emp.setEmpName(empName);
		emp.setEmpBirthday(empBirthday);
		emp.setEmpSex(empSex);
		emp.setEmpAddress(empAddress);
		emp.setEmpTel(empTel);
		EmpDao empdao = new EmpDao();
		empdao.addEmp(emp);
		return "success";
	}
	
	/*******************删除员工信息***********************/
	public String delEmp() {
		EmpDao empdao = new EmpDao();
		empdao.delEmp(id);
		return "success";
	}
	
	/*****************打开更新页面信息********************************/
	public String updateEmp() {
		EmpDao empdao = new EmpDao();
		Emp emp = empdao.findById(id);
		setId(emp.getId());
		setEmpName(emp.getEmpName());
		setEmpSex(emp.getEmpSex());
		setEmpBirthday(emp.getEmpBirthday());
		setEmpAddress(emp.getEmpAddress());
		setEmpTel(emp.getEmpTel());
		return "success";
	}
	
	/*******************更新员工页面*****************************/
	public String modifyEmp() {
		Emp emp = new Emp();
		emp.setId(id);
		emp.setEmpName(empName);
		emp.setEmpBirthday(empBirthday);
		emp.setEmpSex(empSex);
		emp.setEmpAddress(empAddress);
		emp.setEmpTel(empTel);
		EmpDao empdao = new EmpDao();
		empdao.modifyEmp(emp);
		return "success";
	}
	
}
