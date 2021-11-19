package com.iei.greenlight.donationBoard.service.logic;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iei.greenlight.donationBoard.domain.Donation;
import com.iei.greenlight.donationBoard.domain.DonationBoard;
import com.iei.greenlight.donationBoard.domain.DtFile;
import com.iei.greenlight.donationBoard.domain.PageInfo;
import com.iei.greenlight.donationBoard.service.DonationBoardService;
import com.iei.greenlight.donationBoard.store.DonationBoardStore;

@Service
public class DonationBoardServiceImpl implements DonationBoardService{

	@Autowired
	private DonationBoardStore store;
	
	@Override
	public int registerdonationBoard(DonationBoard db) {
		return store.insertDonationBoard(db);
	}

	@Override
	public int registerDtFile(List<DtFile> dFile) {
		return store.insertDtFile(dFile);
	}

	@Override
	public int getListCount() {
		return store.getListCount();
	}

	@Override
	public List<DonationBoard> printAll(PageInfo pi) {
		return store.selectDonationBoardAllList(pi);
	}

	@Override
	public DonationBoard printDonationBoardOne(int boardNo) {
		return store.selectDonationBoardOne(boardNo);
	}

	@Override
	public List<DtFile> printAllDonationBoardImageOneByNo(int boardNo) {
		return store.selectAllDonationBoardImageOneByNo(boardNo);
	}

	@Override
	public int donationUserPoint(HashMap<String, Object> map) {
		return store.donationUserPoint(map);
	}

	@Override
	public void registerDonation(Donation donation) {
		store.insertDonationUser(donation);
	}

	@Override
	public void updateDonationBoardDonationAmount(DonationBoard db) {
		store.updateDonationBoardDonationAmount(db);
	}

}
