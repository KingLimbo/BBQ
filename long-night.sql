SET FOREIGN_KEY_CHECKS=0;

-- ---------ϵͳ�û���-----------

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE sys_user (
    id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '����ID ˵����������ID', 
    login_account VARCHAR(20) NOT NULL COMMENT '��¼�˺�', 
    login_pass VARCHAR(32) NOT NULL COMMENT '��¼����', 
    login_salt VARCHAR(32) NOT NULL COMMENT '������', 
    user_name VARCHAR(20) NOT NULL COMMENT '�ǳ�', 
    user_head VARCHAR(64) NULL COMMENT 'ͷ��', 
    user_phone VARCHAR(20) NULL COMMENT '�ֻ�', 
    user_email VARCHAR(30) NULL COMMENT '����', 
    user_sex TINYINT(1) UNSIGNED NULL COMMENT '�Ա� ˵����1 ��ʾ�У�0 ��ʾŮ', 
    login_status TINYINT(1) UNSIGNED NULL DEFAULT '0' COMMENT '��¼״̬ ˵����0 ��ʾδ��¼��1 ��ʾ�ѵ�¼', 
    last_login_time DATETIME NULL COMMENT '����¼ʱ��', 
    last_login_ip VARCHAR(50) NULL COMMENT '����¼IP', 
    is_locked TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '�Ƿ������� ˵����1 ��ʾ��������0 ��ʾδ����', 
    is_deleted TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '�Ƿ���ɾ�� ˵����1 ��ʾɾ����0 ��ʾδɾ��', 
    gmt_create DATETIME NOT NULL COMMENT '����ʱ��', 
    gmt_modified DATETIME NULL COMMENT '�޸�ʱ��', 
    CONSTRAINT PK_sys_user PRIMARY KEY (id)
)COMMENT  'ϵͳ�û���'; 

ALTER TABLE sys_user Add UNIQUE INDEX uk_login_account(login_account);


-- ---------ϵͳ��ɫ��-----------

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE sys_role (
    id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '����ID ˵��������ID', 
    role_code VARCHAR(20) NOT NULL COMMENT '��ɫ���', 
    role_name VARCHAR(20) NOT NULL COMMENT '��ɫ����', 
    role_description VARCHAR(100) NULL COMMENT '��ɫ����', 
    is_deleted TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '�Ƿ���ɾ�� ˵����1 ��ʾɾ����0 ��ʾδɾ��', 
    gmt_create DATETIME NULL COMMENT '����ʱ��', 
    gmt_modified DATETIME NULL COMMENT '�޸�ʱ��', 
    CONSTRAINT PK_sys_role PRIMARY KEY (id)
)COMMENT  'ϵͳ��ɫ��'; 

ALTER TABLE sys_role Add UNIQUE INDEX uk_role_code(role_code);


-- ---------ϵͳȨ�ޱ�-----------

DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE sys_permission (
    id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '����ID ˵��������ID', 
    permission_name VARCHAR(20) NOT NULL COMMENT 'Ȩ������', 
    permission_description VARCHAR(100) NULL COMMENT 'Ȩ������', 
    permission_url VARCHAR(50) NULL COMMENT 'Ȩ�޷���·��', 
    permission_type TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'Ȩ������ ˵����0 ��ʾҳ�棬1 ��ʾ��ť', 
    is_deleted TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '�Ƿ���ɾ�� ˵����1 ��ʾɾ����0 ��ʾδɾ��', 
    gmt_create DATETIME NOT NULL COMMENT '����ʱ��', 
    gmt_modified DATETIME NULL COMMENT '�޸�ʱ��', 
    CONSTRAINT PK_sys_permission PRIMARY KEY (id)
)COMMENT  'ϵͳȨ�ޱ�'; 


-- ---------ϵͳ��ɫ�û�������-----------

DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE sys_role_user (
    id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '����ID ˵��������ID', 
    role_id BIGINT(20) NOT NULL COMMENT '��ɫID', 
    user_id BIGINT(20) NOT NULL COMMENT '�û�ID', 
    is_deleted TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '�Ƿ���ɾ�� ˵����1 ��ʾɾ����0 ��ʾδɾ��', 
    gmt_create DATETIME NULL COMMENT '����ʱ��', 
    gmt_modified DATETIME NULL COMMENT '�޸�ʱ��', 
    CONSTRAINT PK_sys_role_user PRIMARY KEY (id)
)COMMENT  'ϵͳ��ɫ�û�������'; 

ALTER TABLE sys_role_user Add UNIQUE INDEX uk_role_user(role_id);


-- ---------ϵͳ��ɫȨ�޹�����-----------

DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE sys_role_permission (
    id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '����ID ˵��������ID', 
    role_id BIGINT(20) NOT NULL COMMENT '��ɫID', 
    permission_id BIGINT(20) NOT NULL COMMENT 'Ȩ��ID', 
    is_deleted TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '�Ƿ���ɾ�� ˵����1 ��ʾɾ����0 ��ʾδɾ��', 
    gmt_create DATETIME NULL COMMENT '����ʱ��', 
    gmt_modified DATETIME NULL COMMENT '�޸�ʱ��', 
    CONSTRAINT PK_sys_role_permission PRIMARY KEY (id)
)COMMENT  'ϵͳ��ɫȨ�޹�����'; 

ALTER TABLE sys_role_permission Add UNIQUE INDEX uk_role_permission(role_id, permission_id);


-- ---------ϵͳ�˵���-----------

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE sys_menu (
    id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '����ID ˵��������ID', 
    menu_name VARCHAR(20) NOT NULL COMMENT '�˵�����', 
    menu_url VARCHAR(50) NULL COMMENT '�˵�����·��', 
    menu_description VARCHAR(100) NULL COMMENT '��ɫ����', 
    parent_id BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '���ڵ�ID ˵�������ڵ�Ϊ0', 
    parents_id VARCHAR(100) NOT NULL COMMENT 'ȫ�ڵ�ID ˵�����÷ֺŷָ�  0;100', 
    menu_level TINYINT(1) UNSIGNED NOT NULL COMMENT '���� ˵�������ڵ�Ϊ0', 
    menu_sort TINYINT(1) UNSIGNED NOT NULL COMMENT '���� ˵����ͬ��Ŀ¼�´�1��ʼ����', 
    is_deleted TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '�Ƿ���ɾ�� ˵����1 ��ʾɾ����0 ��ʾδɾ��', 
    gmt_create DATETIME NULL COMMENT '����ʱ��', 
    gmt_modified DATETIME NULL COMMENT '�޸�ʱ��', 
    CONSTRAINT PK_sys_menu PRIMARY KEY (id)
)COMMENT  'ϵͳ�˵���'; 


-- ---------ϵͳ��ɫ�˵�������-----------

DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE sys_role_menu (
    id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '����ID ˵��������ID', 
    role_id BIGINT(20) NOT NULL COMMENT '��ɫID', 
    menu_id BIGINT(20) NOT NULL COMMENT '�û�ID', 
    is_deleted TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '�Ƿ���ɾ�� ˵����1 ��ʾɾ����0 ��ʾδɾ��', 
    gmt_create DATETIME NULL COMMENT '����ʱ��', 
    gmt_modified DATETIME NULL COMMENT '�޸�ʱ��', 
    CONSTRAINT PK_sys_role_menu PRIMARY KEY (id)
)COMMENT  'ϵͳ��ɫ�˵�������'; 

ALTER TABLE sys_role_menu Add UNIQUE INDEX uk_role_menu(role_id, menu_id);


