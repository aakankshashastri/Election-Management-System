package com.amazon.beans;

import java.io.InputStream;

import com.mysql.jdbc.Blob;

public class createCandidate {
	private InputStream photo;
	private String Candidate_Id,Age,Election_Id,Party_Name,Agenda;
	public InputStream getPhoto() {
		return photo;
	}
	public void setPhoto(InputStream photo) {
		this.photo = photo;
	}
	public String getCandidate_Id() {
		return Candidate_Id;
	}
	public void setCandidate_Id(String candidate_Id) {
		Candidate_Id = candidate_Id;
	}
	public String getAge() {
		return Age;
	}
	public void setAge(String age) {
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
