/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     17/12/2020 11:56:08                          */
/*==============================================================*/


drop index CATEGORIA_PK;

drop table CATEGORIA;

drop index CLIENTE_PK;

drop table CLIENTE;

drop index PRODUCTO_DETALLE_FK;

drop index FACTURA_DETALLE_FK;

drop index DETALLE_PK;

drop table DETALLE;

drop index CLIENTE_FACTURA_FK;

drop index FACTURA_PK;

drop table FACTURA;

drop index PAGO_TPAGO_FK;

drop index FACTURA_PAGO_FK;

drop index CLIENTE_PAGO_FK;

drop index PAGO_PK;

drop table PAGO;

drop index CATEGORIA_PRODUCTO_FK;

drop index PRODUCTO_PK;

drop table PRODUCTO;

drop index TIPO_DE_PAGO_PK;

drop table TIPO_DE_PAGO;

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA (
   ID_CATEGORIA         INT4                 not null,
   DESCRIPCION          VARCHAR(100)         null,
   constraint PK_CATEGORIA primary key (ID_CATEGORIA)
);

/*==============================================================*/
/* Index: CATEGORIA_PK                                          */
/*==============================================================*/
create unique index CATEGORIA_PK on CATEGORIA (
ID_CATEGORIA
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           INT4                 not null,
   NOMBRE_CL            VARCHAR(50)          null,
   DIRECCION            VARCHAR(50)          null,
   TELEFONO             INT4                 null,
   EMAIL                VARCHAR(50)          null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Table: DETALLE                                               */
/*==============================================================*/
create table DETALLE (
   ID_DETALLE           INT4                 not null,
   ID_FACTURA           INT4                 not null,
   ID_PRODUCTO          INT4                 not null,
   CANTIDAD             INT4                 null,
   VALOR_TOTAL          FLOAT2               null,
   constraint PK_DETALLE primary key (ID_DETALLE)
);

/*==============================================================*/
/* Index: DETALLE_PK                                            */
/*==============================================================*/
create unique index DETALLE_PK on DETALLE (
ID_DETALLE
);

/*==============================================================*/
/* Index: FACTURA_DETALLE_FK                                    */
/*==============================================================*/
create  index FACTURA_DETALLE_FK on DETALLE (
ID_FACTURA
);

/*==============================================================*/
/* Index: PRODUCTO_DETALLE_FK                                   */
/*==============================================================*/
create  index PRODUCTO_DETALLE_FK on DETALLE (
ID_PRODUCTO
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID_FACTURA           INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   FECHA                DATE                 null,
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Index: FACTURA_PK                                            */
/*==============================================================*/
create unique index FACTURA_PK on FACTURA (
ID_FACTURA
);

/*==============================================================*/
/* Index: CLIENTE_FACTURA_FK                                    */
/*==============================================================*/
create  index CLIENTE_FACTURA_FK on FACTURA (
ID_CLIENTE
);

/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
create table PAGO (
   ID_PAGO              INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   ID_FACTURA           INT4                 not null,
   ID_TIPOPAGO          INT4                 not null,
   FECHA_PAGO           DATE                 null,
   MONTO_PAGO           FLOAT2               null,
   constraint PK_PAGO primary key (ID_PAGO)
);

/*==============================================================*/
/* Index: PAGO_PK                                               */
/*==============================================================*/
create unique index PAGO_PK on PAGO (
ID_PAGO
);

/*==============================================================*/
/* Index: CLIENTE_PAGO_FK                                       */
/*==============================================================*/
create  index CLIENTE_PAGO_FK on PAGO (
ID_CLIENTE
);

/*==============================================================*/
/* Index: FACTURA_PAGO_FK                                       */
/*==============================================================*/
create  index FACTURA_PAGO_FK on PAGO (
ID_FACTURA
);

/*==============================================================*/
/* Index: PAGO_TPAGO_FK                                         */
/*==============================================================*/
create  index PAGO_TPAGO_FK on PAGO (
ID_TIPOPAGO
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTO          INT4                 not null,
   ID_CATEGORIA         INT4                 not null,
   NOMBRE_PRO           VARCHAR(30)          null,
   PRECIO               FLOAT2               null,
   STOCK                INT4                 null,
   constraint PK_PRODUCTO primary key (ID_PRODUCTO)
);

/*==============================================================*/
/* Index: PRODUCTO_PK                                           */
/*==============================================================*/
create unique index PRODUCTO_PK on PRODUCTO (
ID_PRODUCTO
);

/*==============================================================*/
/* Index: CATEGORIA_PRODUCTO_FK                                 */
/*==============================================================*/
create  index CATEGORIA_PRODUCTO_FK on PRODUCTO (
ID_CATEGORIA
);

/*==============================================================*/
/* Table: TIPO_DE_PAGO                                          */
/*==============================================================*/
create table TIPO_DE_PAGO (
   ID_TIPOPAGO          INT4                 not null,
   NOMBRE_TP            VARCHAR(20)          null,
   constraint PK_TIPO_DE_PAGO primary key (ID_TIPOPAGO)
);

/*==============================================================*/
/* Index: TIPO_DE_PAGO_PK                                       */
/*==============================================================*/
create unique index TIPO_DE_PAGO_PK on TIPO_DE_PAGO (
ID_TIPOPAGO
);

alter table DETALLE
   add constraint FK_DETALLE_FACTURA_D_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA)
      on delete restrict on update restrict;

alter table DETALLE
   add constraint FK_DETALLE_PRODUCTO__PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_CLIENTE_F_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_CLIENTE_P_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_FACTURA_P_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_PAGO_TPAG_TIPO_DE_ foreign key (ID_TIPOPAGO)
      references TIPO_DE_PAGO (ID_TIPOPAGO)
      on delete restrict on update restrict;

alter table PRODUCTO
   add constraint FK_PRODUCTO_CATEGORIA_CATEGORI foreign key (ID_CATEGORIA)
      references CATEGORIA (ID_CATEGORIA)
      on delete restrict on update restrict;

