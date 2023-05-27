package net.javaguides.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.javaguides.springboot.exception.ResourceNotFoundException;
import net.javaguides.springboot.model.Employee;
import net.javaguides.springboot.repository.EmployeeRepository;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1/employees")
public class EmployeeController {
	
	@Autowired
	private EmployeeRepository employeeRepository;
	
	@GetMapping
	public List<Employee> getAllEmployees()
	{
		return employeeRepository.findAll();
	}
	
	//Build create employee REST API
	@PostMapping
	public Employee createEmployee(@RequestBody Employee employee)
	{
		return employeeRepository.save(employee);
	}
	
	//Build get employee by id REST API
	@GetMapping("{id}")
	public ResponseEntity<Employee> getEmployeeById(@PathVariable long id)
	{
		Employee employee = employeeRepository.findById(id)
		         .orElseThrow(() -> new ResourceNotFoundException("Employee not exist with id:"+ id));
		return ResponseEntity.ok(employee);	
	}
	
	//Build get employee by id REST API
	@PutMapping("{id}")
	public ResponseEntity<Employee> updateEmployee(@PathVariable long id, @RequestBody Employee employeeDetails)
	{
		Employee updateEmployee = employeeRepository.findById(id)
				 .orElseThrow(() -> new ResourceNotFoundException("Employee not exist with id:"+ id));
		updateEmployee.setFirstName(employeeDetails.getFirstName());
		updateEmployee.setLastName(employeeDetails.getLastName());
		updateEmployee.setEmailId(employeeDetails.getEmailId());
		
		employeeRepository.save(updateEmployee);
		
		return ResponseEntity.ok(updateEmployee);
	}
	
	//Build get employee by id REST API
	@DeleteMapping("{id}")
	public ResponseEntity<Employee> deleteEmployee(@PathVariable long id)
	{
		Employee employee = employeeRepository.findById(id)
				 .orElseThrow(() -> new ResourceNotFoundException("Employee not exist with id:"+ id));
		
		employeeRepository.delete(employee);
		
		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
		
}
