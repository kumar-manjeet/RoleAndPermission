package com.roleandpermission.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.roleandpermission.services.PermissionService;

@RestController
public class PermissionController {

	@Autowired
	private PermissionService permissionService;

	@GetMapping("/roleInheritance")
	public ResponseEntity<Object> getPermissionsWithInheritance(@RequestParam(required = false) String productName, @RequestParam(required = false) List<String> roleList) {
	    try {
	    	Map<String, String> map = new HashMap<String, String>();
	    	map.put("tms", "permits_tms.ftl");
	    	map.put("hrtools", "permits_hr_tools.ftl");
	    	map.put("data", "data.ftl");
	    	String fileName = map.get(productName);
	    	String path="src/main/resources/";
	    	String fullPath = path+fileName;
	    	if(!map.containsKey(productName)) {
	    		return ResponseEntity.status(500).body("Send Product Name from Request param!!");
	    	}
	        Path filePath = Paths.get(fullPath);
	        List<String> lines = Files.readAllLines(filePath);
	        Object permissions;

	        if (roleList != null && !roleList.isEmpty()) {
	            permissions = permissionService.getPermissionsForRole(lines, roleList);
	        } else {
	            permissions = permissionService.getPermissionsWithInheritance(lines);
	        }
	        return ResponseEntity.ok(permissions);
	    } catch (IOException e) {
	        e.printStackTrace();
	        return ResponseEntity.status(500).body(null);
	    }
	}
}
