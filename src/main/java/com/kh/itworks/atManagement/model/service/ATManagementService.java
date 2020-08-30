package com.kh.itworks.atManagement.model.service;

import java.util.ArrayList;

import com.kh.itworks.atManagement.model.exception.SelectATManagementFailedException;
import com.kh.itworks.atManagement.model.vo.ATManagement;

public interface ATManagementService {

	ATManagement selectAtBt(ATManagement at) throws SelectATManagementFailedException ;

	ArrayList<ATManagement> selectWorkingStatus(ATManagement at) throws SelectATManagementFailedException ;

	ArrayList<ATManagement> selectWorkTimeSet(ATManagement at) throws SelectATManagementFailedException ;

}
