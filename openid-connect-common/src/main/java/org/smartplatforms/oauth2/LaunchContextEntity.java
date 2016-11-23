package org.smartplatforms.oauth2;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.SequenceGenerator;

@Entity
@Table(name = "launch_context")
public class LaunchContextEntity {
	public static String ID_TOKEN_FIELD_NAME = "id_token";
	public static final String MY_SEQUENCE_GENERATOR_NAME = "launch_context_seq";

	private Long id;
	private String name;
	private String value;

	/**
	 * @return the id
	 */
	@Id
	@GeneratedValue(generator = MY_SEQUENCE_GENERATOR_NAME, strategy = GenerationType.SEQUENCE)
	@SequenceGenerator(name = MY_SEQUENCE_GENERATOR_NAME, sequenceName = MY_SEQUENCE_GENERATOR_NAME, allocationSize = 1)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the name
	 */
	@Basic
	@Column(name = "name")
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}


	/**
	 * @return the value
	 */
	@Basic
	@Column(name = "value")
	public String getValue() {
		return value;
	}

	/**
	 * @param value the value to set
	 */
	public void setValue(String value) {
		this.value = value;
	}

}
