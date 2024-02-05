// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract add {

    mapping(string => uint) public nameToStudentRollNo;

    struct Student {
        string stu_name;
        uint roll_no; 
    }

    Student[] students;
    
    function addStudent(string memory _student_name , uint _roll_No) public {
          students.push(Student(_student_name , _roll_No));  
          nameToStudentRollNo[_student_name] =  _roll_No;
    } 

    function retrieveStudent(uint index) public view returns (Student memory){
        return students[index];
    }    
}
