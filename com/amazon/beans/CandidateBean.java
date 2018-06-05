package com.amazon.beans;



public class CandidateBean {
	private String Candidate_Id,Election_Id,Party_Name,Agenda,ImagePath,EmailId,Candidate_Name;
	public String getCandidate_Name() {
		return Candidate_Name;
	}
	public void setCandidate_Name(String candidate_Name) {
		Candidate_Name = candidate_Name;
	}
	private int Age;
	
	public String getEmailId() {
		return EmailId;
	}
	public void setEmailId(String emailId) {
		EmailId = emailId;
	}
	public String getImagePath() {
		return ImagePath;
	}
	public void setImagePath(String imagePath) {
		ImagePath = imagePath;
	}
	public String getCandidate_Id() {
		return Candidate_Id;
	}
	public void setCandidate_Id(String candidate_Id) {
		Candidate_Id = candidate_Id;
	}
	
	public int getAge() {
		return Age;
	}
	public void setAge(int age) {
		Age = age;
	}
	public String getElection_Id() {
		return Election_Id;
	}
	public void setElection_Id(String election_Id) {
		Election_Id = election_Id;
	}
	public String getParty_Name() {
		return Party_Name;
	}
	public void setParty_Name(String party_Name) {
		Party_Name = party_Name;
	}
	public String getAgenda() {
		return Agenda;
	}
	public void setAgenda(String agenda) {
		Agenda = agenda;
	}
	
}
