package org.smartplatforms.oauth2;

import java.io.Serializable;
import java.util.Map;
import java.util.Set;

import org.smartplatforms.oauth2.LaunchContextEntity;

public interface LaunchContextResolver {
	public Serializable resolve(String launchId, Map<String,String> needs) throws NeedUnmetException;
	public String getServiceURL();
}
