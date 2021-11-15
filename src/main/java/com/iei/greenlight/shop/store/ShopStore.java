package com.iei.greenlight.shop.store;

import java.util.List;

import com.iei.greenlight.shop.domain.OfflineShop;

public interface ShopStore {
	
	public List<OfflineShop> selectOfflineShopList();
	public List<OfflineShop> selectOfflineSearchList(String searchKeyWord);
	public OfflineShop selectOfflineOneByNo(int shopNo);

}
