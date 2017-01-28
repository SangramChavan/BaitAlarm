package com.helper;

public class SpamModel {
	public boolean multipleTo=false;
	public int ipAddressURLs=0;
	public int shortenedURLS=0;
	public int anchorHrefURLDiffs=0;
	public int whitelistURLs=0;
	public boolean inputTypes=false;
	public boolean hasSpamKeywords=false;
	public boolean isMultipleTo() {
		return multipleTo;
	}
	public void setMultipleTo(boolean multipleTo) {
		this.multipleTo = multipleTo;
	}
	public int getIpAddressURLs() {
		return ipAddressURLs;
	}
	public void setIpAddressURLs(int ipAddressURLs) {
		this.ipAddressURLs = ipAddressURLs;
	}
	public int getShortenedURLS() {
		return shortenedURLS;
	}
	public void setShortenedURLS(int shortenedURLS) {
		this.shortenedURLS = shortenedURLS;
	}
	public int getAnchorHrefURLDiffs() {
		return anchorHrefURLDiffs;
	}
	public void setAnchorHrefURLDiffs(int anchorHrefURLDiffs) {
		this.anchorHrefURLDiffs = anchorHrefURLDiffs;
	}
	public int getWhitelistURLs() {
		return whitelistURLs;
	}
	public void setWhitelistURLs(int whitelistURLs) {
		this.whitelistURLs = whitelistURLs;
	}
	public boolean isInputTypes() {
		return inputTypes;
	}
	public void setInputTypes(boolean inputTypes) {
		this.inputTypes = inputTypes;
	}
	public boolean isHasSpamKeywords() {
		return hasSpamKeywords;
	}
	public void setHasSpamKeywords(boolean hasSpamKeywords) {
		this.hasSpamKeywords = hasSpamKeywords;
	}
	
}
