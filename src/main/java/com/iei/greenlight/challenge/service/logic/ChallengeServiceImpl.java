package com.iei.greenlight.challenge.service.logic;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iei.greenlight.challenge.domain.CFile;
import com.iei.greenlight.challenge.domain.Category;
import com.iei.greenlight.challenge.domain.ChLike;
import com.iei.greenlight.challenge.domain.PageInfo;
import com.iei.greenlight.challenge.domain.Challenge;
import com.iei.greenlight.challenge.domain.Reply;
import com.iei.greenlight.challenge.service.ChallengeService;
import com.iei.greenlight.challenge.store.ChallengeStore;

@Service
public class ChallengeServiceImpl implements ChallengeService{
	
	@Autowired
	private ChallengeStore store;
	
	@Override
	public int registerChallenge(Challenge challenge) {
		int result = store.insertChallenge(challenge);
		return result;
	}
	
	@Override
	public int registerChImage(List<CFile> cList) {
		int result = store.insertChImage(cList);
		return result;
	}
	
	@Override
	public int selectCategory() {
		int cNo = store.selectCategory();
		return cNo;
	}

	@Override
	public int modifyChallenge(Challenge challenge) {
		int result = store.updateChallenge(challenge);
		return result;
	}

	@Override
	public int removeModifyImg(int chNo) {
		return store.deleteModifyImg(chNo);
	}

	@Override
	public int removeChallenge(int chNo) {
		int result = store.deleteChallenge(chNo);
		return result;
	}

	@Override
	public int getListCount(HashMap<String, Object> hashmap) {
		int totalCount = store.selectListCount(hashmap);
		return totalCount;
	}

	@Override
	public List<Challenge> printAll(HashMap<String, Object> hashmap) {
		return store.selectAll(hashmap);
	}

	@Override
	public int getSearchListCount(HashMap<String, Object> hashmap) {
		return store.selectSearchListCount(hashmap);
	}

	@Override
	public List<Challenge> printSearchList(HashMap<String, Object> hashmap) {
		return store.selectSearchList(hashmap);
	}
	
	@Override
	public Challenge printOne(int chNo) {
		Challenge challenge = store.selectOne(chNo);
		return challenge;
	}
	@Override
	public List<CFile> printOneImg(int chNo) {
		List<CFile> cList = store.selectOneImg(chNo);
		return cList;
	}
	
	@Override
	public List<CFile> printImgDel(int chNo) {
		List<CFile> cList = store.selectImgDel(chNo);
		return cList;
	}
	
	@Override
	public ChLike LikeCk(HashMap<String, Object> hashMap) {
		ChLike chlike = store.selectLike(hashMap);
		return chlike;
	}
	
	@Override
	public int addLike(HashMap<String, Object> hashMap) {
		int result = store.insertLike(hashMap);
		return result;
	}
	
	@Override
	public int updateLike(ChLike chlike) {
		int result = store.updateLike(chlike);
		return result;
	}

	@Override
	public int removeLike(ChLike chlike) {
		int result = store.deleteLike(chlike);
		return result;
	}
	
	@Override
	public int updateLikeCount(Challenge challenge) {
		return store.updateLikeCount(challenge);
	}

	@Override
	public int removeLikeCount(Challenge challenge) {
		return store.deleteLikeCount(challenge);
	}

	@Override
	public List<Reply> printAll(int chNo) {
		return store.selectAll(chNo);
	}

	@Override
	public int registerReply(Reply reply) {
		int result = store.insertReply(reply);
		return result;
	}

	@Override
	public int modifyReply(Reply reply) {
		int result = store.updateReply(reply);
		return result;
	}

	@Override
	public int removeReply(Reply reply) {
		int result = store.deleteReply(reply);
		return result;
	}

	@Override
	public List<Challenge> printAllCh(PageInfo api) {
		List<Challenge> cList = store.printAllCh(api);
		return cList;
	}

	@Override
	public int registerCategory(Category category) {
		int result = store.insertCategory(category);
		return result;
	}
	
	@Override
	public int confirmChallenge(HashMap<String, Object> hashmap) {
		return store.updateChallengeCf(hashmap);
	}
	
	@Override
	public int modifyChPoint(HashMap<String, Object> hashmap) {
		return store.updatePoint(hashmap);
	}

	//마이페이지
	@Override
	public int getMyListCount(String userId) {
	    return store.selectMyListCount(userId);
	}

	@Override
	public List<Challenge> printChallList(HashMap<String, Object> hashMap) {
	    return store.selectMyChall(hashMap);
	 }

	@Override
	public List<Challenge> printRecentList(int chNo) {
		return store.selectRecentList(chNo);
	}

	@Override
	public int getAdminListCount() {
		return store.selectAdminListCount();
	}

	@Override
	public Category printCategoryTitle(int categoryNo) {
		return store.selectCategoryTitle(categoryNo);
	}
	
	@Override
	public Category printRecentCategory() {
		return store.selectRecentCategory();
	}

	@Override
	public List<CFile> printDeleteImg(int chNo) {
		return store.selectDeleteImg(chNo);
	}

	@Override
	public List<Challenge> printMainChallenge() {
		return store.selectMainChallenge();
	}

	@Override
	public CFile getMainCFileList(int chNo) {
		return store.selectChallengMainList(chNo);
	}
}
