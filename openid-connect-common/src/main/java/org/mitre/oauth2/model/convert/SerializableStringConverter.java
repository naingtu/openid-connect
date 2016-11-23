/*******************************************************************************
 * Copyright 2016 The MITRE Corporation
 *   and the MIT Internet Trust Consortium
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *******************************************************************************/

package org.mitre.oauth2.model.convert;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nimbusds.jose.util.Base64;

/**
 * Translates a Serializable object of certain primitive types into a String for
 * storage in the database, for use with the OAuth2Request extensions map.
 * 
 * This class does allow some extension data to be lost.
 * 
 * @author jricher
 * 
 */
@Converter
public class SerializableStringConverter implements
		AttributeConverter<Serializable, String> {

	private static Logger logger = LoggerFactory
			.getLogger(SerializableStringConverter.class);

	@Override
	public String convertToDatabaseColumn(Serializable attribute) {
		String str = null;
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ObjectOutputStream oos = null;
		try {
			try {
				oos = new ObjectOutputStream(baos);
				oos.writeObject(attribute);
				str = Base64.encode(baos.toByteArray()).toString();
			} finally {
				try {
					baos.close();
				} finally {
					if (oos != null) {
						oos.close();
					}
				}
			}
		} catch (IOException ioe) {
			logger.warn("Dropping data from request: " + attribute + " :: "
					+ attribute.getClass());
		}

		return str;
	}

	@Override
	public Serializable convertToEntityAttribute(String dbData) {
		byte[] bytes = new Base64(dbData).decode();
		Serializable obj = null;
		ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
		ObjectInputStream ois = null;
		try {
			try {
				ois = new ObjectInputStream(bais);
				obj = (Serializable) ois.readObject();
			} finally {
				try {
					bais.close();
				} finally {
					if (ois != null) {
						ois.close();
					}
				}
			}
		} catch (Exception e) {
			logger.warn("Error deserialising " + dbData,e);
		}
		return obj;
	}

}
