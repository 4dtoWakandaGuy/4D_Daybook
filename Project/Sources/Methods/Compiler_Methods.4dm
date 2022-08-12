//%attributes = {"invisible":true}
If (False:C215)
	
	
	// ----------------------------------------------------
	// Creator: Nigel Greenlee
	//Date & time: 23/11/2009`Method: Compiler_Methods
	//Description
	
	//Parameters
	// ----------------------------------------------------
	//Project method Amendments
	
	
	//Nigel Greenlee11/12/2009 17:09
	
	//Nigel Greenlee14/03/2010 17:57
	
	//Nigel Greenlee15/03/2010 07:11
	
	//Nigel Greenlee15/03/2010 13:51
	
	//Nigel Greenlee16/03/2010 13:42
	
	//Nigel Greenlee17/03/2010 12:47
	
	//Nigel Greenlee05/04/2010 13:39
	
	//Nigel Greenlee29/04/2010 09:59
	
	//Nigel Greenlee29/04/2010 10:02
	
	//Nigel Greenlee09/06/2010 09:28
	
	//Nigel Greenlee19/09/2010 16:59
	
	//Nigel Greenlee18/10/2010 10:11
	
	//Nigel Greenlee 30/10/2010 15:09
	
	//Nigel Greenlee02/11/2010 23:19
	
	//Nigel Greenlee11/11/2010 19:21
	
	//Nigel Greenlee16/11/2010 20:19
	
	//Nigel Greenlee 08/12/2010 21:53
	
	//Nigel Greenlee    28/02/2011 19:27 v7.0.0/B45
	//Added
	
	//Block of lines added from line 1431to line 16340
	//Edited
	//(321)C_STRING(ACC_BatchItemSendtoBatch ;$1)(Changed to)C_LONGINT(ACC_BatchItemSendtoBatch ;$1)
	//(1150)C_TEXT(Companies_InLPA ;$1) (Changed to) C_LONGINT(Companies_InLPA ;$1)
	//(1154)C_TEXT(Companies_InLPß ;$2) (Changed to) C_LONGINT(Companies_InLPß ;$2)
	//(1427)C_DATE( (Changed to) C_DATE(Date_Format ;$1)
	
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("Compiler_Methods")


//SD_TEMP_SEARCHVIASERVER
C_TEXT:C284(SD_Temp_SearchViaServer; $1)
C_DATE:C307(SD_Temp_SearchViaServer; $2)
C_DATE:C307(SD_Temp_SearchViaServer; $3)
C_LONGINT:C283(SD_Temp_SearchViaServer; $4)
C_TEXT:C284(SD_Temp_SearchViaServer; $5)

//CCM_TEMPEXPORTRECORD
C_POINTER:C301(CCM_TempExportRecord; $1)

//ACC_LAYERMATCH
C_BOOLEAN:C305(ACC_LayerMatch; $0)
C_TEXT:C284(ACC_LayerMatch; $1)

//LBI_LOADARRBLOB
C_POINTER:C301(LBI_LoadArrBlob; $1)

//SD_WORKFLOWBUTTONHANDLER
C_LONGINT:C283(SD_WorkflowButtonHandler; $1)

//Accounts_Mod
C_TEXT:C284(Accounts_Mod; $1)
C_TEXT:C284(Accounts_Mod; $2)

//Actions_Mod
C_TEXT:C284(Actions_Mod; $1)
C_TEXT:C284(Actions_Mod; $2)

//Analyses_Mod
C_TEXT:C284(Analyses_Mod; $1)
C_TEXT:C284(Analyses_Mod; $2)

//Areas_Mod
C_TEXT:C284(Areas_Mod; $1)
C_TEXT:C284(Areas_Mod; $2)




//BDL_CLEAR
C_POINTER:C301(BDL_Clear; $1)

//BDL_DELVAR
C_TEXT:C284(BDL_DelVar; $0)
C_TEXT:C284(BDL_DelVar; ${2})
C_POINTER:C301(BDL_DelVar; $1)

//BDL_GETBLOB
C_TEXT:C284(BDL_GetBLOB; $0)
C_POINTER:C301(BDL_GetBLOB; $1)
C_TEXT:C284(BDL_GetBLOB; $2)
C_POINTER:C301(BDL_GetBLOB; $3)

//BDL_GETVAR
C_TEXT:C284(BDL_GetVar; $0)
C_POINTER:C301(BDL_GetVar; $1)
C_TEXT:C284(BDL_GetVar; $2)
C_POINTER:C301(BDL_GetVar; $3)

//BDL_INITBDL
C_POINTER:C301(BDL_InitBdl; $1)

//BDL_PUTVAR
C_TEXT:C284(BDL_PutVar; $0)
C_POINTER:C301(BDL_PutVar; $1)
C_TEXT:C284(BDL_PutVar; $2)
C_POINTER:C301(BDL_PutVar; $3)


//Brands_Mod
C_TEXT:C284(Brands_Mod; $1)
C_TEXT:C284(Brands_Mod; $2)

//Calls_List
C_TEXT:C284(Calls_List; $1)
C_TEXT:C284(Calls_List; $2)
C_TEXT:C284(Calls_List; $3)

//Calls_Mod
C_TEXT:C284(Calls_Mod; $1)
C_TEXT:C284(Calls_Mod; $2)

//Calls_ModO
C_TEXT:C284(Calls_ModO; $1)
C_TEXT:C284(Calls_ModO; $2)

//Calls_Sel
C_BOOLEAN:C305(Calls_Sel; $2)

//Calls_Sheets
C_TEXT:C284(Calls_Sheets; $1)
C_TEXT:C284(Calls_Sheets; $2)
C_TEXT:C284(Calls_Sheets; $3)

//Categories_Mod
C_TEXT:C284(Categories_Mod; $1)
C_TEXT:C284(Categories_Mod; $2)

//Check_Letter
C_LONGINT:C283(Check_Letter; ${3})
C_LONGINT:C283(Check_Letter; $3)

//Check_MinorNC
C_LONGINT:C283(Check_MinorNC; $9)

//Comp_Sel
C_TEXT:C284(Comp_Sel; $1)
C_BOOLEAN:C305(Comp_Sel; $2)

//Companies_Mod
C_TEXT:C284(Companies_Mod; $1)
C_TEXT:C284(Companies_Mod; $2)

//Cont_Sel
C_TEXT:C284(Cont_Sel; $1)
C_BOOLEAN:C305(Cont_Sel; $2)

//Contracts_List
C_TEXT:C284(Contracts_List; $1)
C_TEXT:C284(Contracts_List; $2)
C_TEXT:C284(Contracts_List; $3)

//Contracts_Mod
C_TEXT:C284(Contracts_Mod; $1)
C_TEXT:C284(Contracts_Mod; $2)

//Contracts_Sel
C_TEXT:C284(Contracts_Sel; $1)
C_BOOLEAN:C305(Contracts_Sel; $2)

//ContactTypes_Mod
C_TEXT:C284(ContactTypes_Mod; $1)
C_TEXT:C284(ContactTypes_Mod; $2)

//Countries_Mod
C_TEXT:C284(Countries_Mod; $1)
C_TEXT:C284(Countries_Mod; $2)

//Currencies_Mod
C_TEXT:C284(Currencies_Mod; $1)
C_TEXT:C284(Currencies_Mod; $2)

//Diary_List
C_TEXT:C284(Diary_List; $1)
C_TEXT:C284(Diary_List; $2)
C_TEXT:C284(Diary_List; $3)

//Diary_Mod
C_TEXT:C284(Diary_Mod; $1)
C_TEXT:C284(Diary_Mod; $2)

//Diary_ModL
C_TEXT:C284(Diary_ModL; $1)
C_TEXT:C284(Diary_ModL; $2)

//Diary_Sel
C_BOOLEAN:C305(Diary_Sel; $3)

//DIARY_MOD_SELECTION
C_TEXT:C284(Diary_Mod_Selection; $1)
C_TEXT:C284(Diary_Mod_Selection; $2)



//Gen_CreditCheck
C_BOOLEAN:C305(Gen_CreditCheck; $4)

//Gen_CULPB
//C_STRING(Gen_CULPB ;${3})

//Gen_ListGraph
C_POINTER:C301(Gen_ListGraph; $1)

//Gen_ListSR
C_BOOLEAN:C305(Gen_ListSR; $11)
C_TEXT:C284(Gen_ListSR; $12)

//Gen_Mod
C_BOOLEAN:C305(Gen_Mod; $8)
C_TEXT:C284(Gen_Mod; $9)

//Gen_ModLay
C_TEXT:C284(Gen_ModLay; $9)
C_BOOLEAN:C305(Gen_ModLay; $10)

//GEN_PPSINGLE_2
C_BOOLEAN:C305(Gen_PPSingle_2; $0)

//Groups_Mod
C_TEXT:C284(Groups_Mod; $1)
C_TEXT:C284(Groups_Mod; $2)

//Headings_Mod
C_TEXT:C284(Headings_Mod; $1)
C_TEXT:C284(Headings_Mod; $2)

//Inv_No
C_BOOLEAN:C305(Inv_No; $1)

//Invoices_Mod
C_TEXT:C284(Invoices_Mod; $1)
C_TEXT:C284(Invoices_Mod; $2)

//Invoices_Sel
C_TEXT:C284(Invoices_Sel; $1)
C_BOOLEAN:C305(Invoices_Sel; $2)

//InvStages_Mod
C_TEXT:C284(InvStages_Mod; $1)
C_TEXT:C284(InvStages_Mod; $2)

//JobPers_Mod
C_TEXT:C284(JobPers_Mod; $1)
C_TEXT:C284(JobPers_Mod; $2)

//JobPers_Sel
C_TEXT:C284(JobPers_Sel; $1)
C_BOOLEAN:C305(JobPers_Sel; $2)

//Jobs_Mod
C_TEXT:C284(Jobs_Mod; $1)
C_TEXT:C284(Jobs_Mod; $2)

//Jobs_Sel
C_TEXT:C284(Jobs_Sel; $1)
C_BOOLEAN:C305(Jobs_Sel; $2)


//JobStages_Mod
C_TEXT:C284(JobStages_Mod; $1)
C_TEXT:C284(JobStages_Mod; $2)

//JobStages_Sel
C_TEXT:C284(JobStages_Sel; $1)
C_BOOLEAN:C305(JobStages_Sel; $2)

//Layers_Mod
C_TEXT:C284(Layers_Mod; $1)
C_TEXT:C284(Layers_Mod; $2)

//Letters_Mod
C_TEXT:C284(Letters_Mod; $2)
C_TEXT:C284(Letters_Mod; $3)

//Letters_Sel
C_TEXT:C284(Letters_Sel; $1)
C_BOOLEAN:C305(Letters_Sel; $2)

//Minor_Mod
C_TEXT:C284(Minor_Mod; $5)
C_BOOLEAN:C305(Minor_Mod; $6)

//Minor_ModName
C_BOOLEAN:C305(Minor_ModName; $5)
C_TEXT:C284(Minor_ModName; $6)

//OrderI_Mod
C_TEXT:C284(OrderI_Mod; $1)
C_TEXT:C284(OrderI_Mod; $2)

//OrderI_Sel
C_TEXT:C284(OrderI_Sel; $1)
C_BOOLEAN:C305(OrderI_Sel; $2)

//Orders_Sel
C_BOOLEAN:C305(Orders_Sel; $2)

//Orders_View
C_TEXT:C284(Orders_View; $1)
C_TEXT:C284(Orders_View; $2)

//Personnel_Mod
C_TEXT:C284(Personnel_Mod; $1)
C_TEXT:C284(Personnel_Mod; $2)

//Pictures_Mod
C_TEXT:C284(Pictures_Mod; $1)
C_TEXT:C284(Pictures_Mod; $2)

//PriceT_Mod
C_TEXT:C284(PriceT_Mod; $1)
C_TEXT:C284(PriceT_Mod; $2)
C_TEXT:C284(PriceT_Mod; $3)

//PriceT_Sel
C_TEXT:C284(PriceT_Sel; $1)
C_BOOLEAN:C305(PriceT_Sel; $2)

//Problems_Mod
C_TEXT:C284(Problems_Mod; $1)
C_TEXT:C284(Problems_Mod; $2)

//Prod_Sel
C_TEXT:C284(Prod_Sel; $1)
C_BOOLEAN:C305(Prod_Sel; $2)

//Products_Mod
C_TEXT:C284(Products_Mod; $2)

//Projects_Mod
C_TEXT:C284(Projects_Mod; $1)
C_TEXT:C284(Projects_Mod; $2)

//Projects_Sel
C_TEXT:C284(Projects_Sel; $1)
C_BOOLEAN:C305(Projects_Sel; $2)

//Purchases_Mod
C_TEXT:C284(Purchases_Mod; $1)
C_TEXT:C284(Purchases_Mod; $2)

//Purchases_Sel
C_TEXT:C284(Purchases_Sel; $1)
C_BOOLEAN:C305(Purchases_Sel; $2)

//PurchOrd_Mod
C_TEXT:C284(PurchOrd_Mod; $1)
C_TEXT:C284(PurchOrd_Mod; $2)

//PurchOrd_Sel
C_TEXT:C284(PurchOrd_Sel; $1)
C_BOOLEAN:C305(PurchOrd_Sel; $2)

//Results_Mod
C_TEXT:C284(Results_Mod; $1)
C_TEXT:C284(Results_Mod; $2)

//Roles_Mod
C_TEXT:C284(Roles_Mod; $1)
C_TEXT:C284(Roles_Mod; $2)

//SD_GETOTHERDIARIES
C_POINTER:C301(SD_GetOtherDiaries; $2)
C_POINTER:C301(SD_GetOtherDiaries; $3)
C_POINTER:C301(SD_GetOtherDiaries; $4)

//SD_MULTIOWNERLIST
C_LONGINT:C283(SD_MultiOwnerList; $2)
C_BOOLEAN:C305(SD_MultiOwnerList; $3)

//Sequences_Mod
C_TEXT:C284(Sequences_Mod; $1)
C_TEXT:C284(Sequences_Mod; $2)

//Solutions_Mod
C_TEXT:C284(Solutions_Mod; $1)
C_TEXT:C284(Solutions_Mod; $2)

//Status_Mod
C_TEXT:C284(Status_Mod; $1)
C_TEXT:C284(Status_Mod; $2)

//Stock_Mod
C_TEXT:C284(Stock_Mod; $1)
C_TEXT:C284(Stock_Mod; $2)

//Stock_Sel
C_TEXT:C284(Stock_Sel; $1)
C_BOOLEAN:C305(Stock_Sel; $2)

//StockCurr_Mod
C_TEXT:C284(StockCurr_Mod; $1)
C_TEXT:C284(StockCurr_Mod; $2)

//StockCurr_Sel
C_TEXT:C284(StockCurr_Sel; $1)
C_BOOLEAN:C305(StockCurr_Sel; $2)

//TYPES MOD
C_TEXT:C284(Types_Mod; $1)
C_TEXT:C284(Types_Mod; $2)

//ZAccounts_Mod
C_POINTER:C301(ZAccounts_Mod; $3)
C_TEXT:C284(ZAccounts_Mod; $1)
C_TEXT:C284(ZAccounts_Mod; $2)

//ZActions_Mod
C_POINTER:C301(ZActions_Mod; $3)
C_TEXT:C284(ZActions_Mod; $1)
C_TEXT:C284(ZActions_Mod; $2)

//ZAnalyses_Mod
C_POINTER:C301(ZAnalyses_Mod; $3)
C_TEXT:C284(ZAnalyses_Mod; $1)
C_TEXT:C284(ZAnalyses_Mod; $2)

//LBI_LOADARRAYS
C_POINTER:C301(LBi_LoadArrays; $4)

//INT_GETDOCK
C_POINTER:C301(INT_GetDock; $2)
C_POINTER:C301(INT_GetDock; $3)
C_POINTER:C301(INT_GetDock; $4)

//SD2_DIARY_MOD
C_TEXT:C284(SD2_Diary_Mod; $1)

//SRCH_SETSEARCHPARAMETERS
C_REAL:C285(SRCH_SetSearchParameters; $1)

//SRCH_MORECHOICES
C_LONGINT:C283(SRCH_MoreChoices; $1)

//SRCH_STANDARDSEARCH
C_LONGINT:C283(SRCH_StandardSearch; $1)
C_BOOLEAN:C305(AAJunk; $1)
C_REAL:C285(AAJunk; $2)
C_REAL:C285(AAJunk; $3)

//AA_BUILDLISTFROMDATA
C_TEXT:C284(AA_BUILDLISTFROMDATA; $1)
C_POINTER:C301(AA_BUILDLISTFROMDATA; $2)

//AA_CHECKFILEID
C_BOOLEAN:C305(AA_CheckFileID; $0)
C_LONGINT:C283(AA_CheckFileID; $1)

//AA_CHECKFILEUNLOCKED
C_POINTER:C301(AA_CheckFileUnlocked; $1)

//AA_CHECKFILEUNLOCKEDBYTABLENUM
C_LONGINT:C283(AA_CheckFileUnlockedByTableNUM; $1)

//AA_DISPLAYLISTPROPERTIES
C_BOOLEAN:C305(AA_DisplayListProperties; $0)
C_POINTER:C301(AA_DisplayListProperties; $1)
C_POINTER:C301(AA_DisplayListProperties; $2)

//AA_DISPLAYRELATEDFIELDS
C_BOOLEAN:C305(AA_DisplayRelatedFields; $0)
C_POINTER:C301(AA_DisplayRelatedFields; $1)
C_POINTER:C301(AA_DisplayRelatedFields; $2)
C_POINTER:C301(AA_DisplayRelatedFields; $3)

//AA_FIXLISTITEMS
C_BOOLEAN:C305(AA_FixListItems; $1)
C_LONGINT:C283(AA_FixListItems; $2)
C_LONGINT:C283(AA_FixListItems; $3)

//AA_GETLISTBYNAME
C_LONGINT:C283(AA_GetListbyName; $0)
C_TEXT:C284(AA_GetListbyName; $1)
C_BOOLEAN:C305(AA_GetListbyName; $2)

//AA_GETLISTID
C_LONGINT:C283(AA_GetListID; $0)
C_LONGINT:C283(AA_GetListID; $1)
C_LONGINT:C283(AA_GetListID; $2)
C_TEXT:C284(AA_GetListID; $3)
C_TEXT:C284(AA_GetListID; $4)

//AA_GETNEXTID
C_LONGINT:C283(AA_GetNextID; $0)
C_POINTER:C301(AA_GetNextID; $1)
C_LONGINT:C283(AA_GetNextID; $2)
C_BOOLEAN:C305(AA_GetNextID; $3)

//AA_GETNEXTIDINMETHOD
C_LONGINT:C283(AA_GetNextIDinMethod; $0)
C_POINTER:C301(AA_GetNextIDinMethod; $1)
C_LONGINT:C283(AA_GetNextIDinMethod; $2)
C_BOOLEAN:C305(AA_GetNextIDinMethod; $3)

//AA_GETNEXTIDINPROCESS
C_LONGINT:C283(AA_GetNextIDINPROCESS; $0)
C_LONGINT:C283(AA_GetNextIDINPROCESS; $1)
C_TEXT:C284(AA_GetNextIDINPROCESS; $2)
C_TEXT:C284(AA_GetNextIDINPROCESS; $3)
C_LONGINT:C283(AA_GetNextIDINPROCESS; $4)
C_LONGINT:C283(AA_GetNextIDINPROCESS; $5)
C_LONGINT:C283(AA_GetNextIDINPROCESS; $6)
C_BOOLEAN:C305(AA_GetNextIDINPROCESS; $7)

//AA_GETPROPERTY
C_TEXT:C284(AA_GetProperty; $0)
C_TEXT:C284(AA_GetProperty; $1)
C_TEXT:C284(AA_GetProperty; $2)
C_TEXT:C284(AA_GetProperty; $3)

//AA_GETPROPERTYNUM
C_LONGINT:C283(AA_GetPRopertyNUM; $0)
C_LONGINT:C283(AA_GetPRopertyNUM; $1)
C_TEXT:C284(AA_GetPRopertyNUM; $2)
C_TEXT:C284(AA_GetPRopertyNUM; $3)

//AA_INDEXONEFIELD
C_LONGINT:C283(AA_IndexoneField; $1)
C_LONGINT:C283(AA_IndexoneField; $2)

//AA_LISTADDITEM
C_LONGINT:C283(AA_ListAddItem; $0)
C_TEXT:C284(AA_ListAddItem; ${-1})
C_POINTER:C301(AA_ListAddItem; $1)
C_TEXT:C284(AA_ListAddItem; $2)
C_TEXT:C284(AA_ListAddItem; $3)
C_TEXT:C284(AA_ListAddItem; $4)

//AA_LISTADDITEMBYID
C_LONGINT:C283(AA_ListAddItembyID; $0)
C_TEXT:C284(AA_ListAddItembyID; ${-1})
C_LONGINT:C283(AA_ListAddItembyID; $1)
C_TEXT:C284(AA_ListAddItembyID; $2)
C_TEXT:C284(AA_ListAddItembyID; $3)
C_TEXT:C284(AA_ListAddItembyID; $4)
C_TEXT:C284(AA_ListAddItembyID; $5)
C_TEXT:C284(AA_ListAddItembyID; $6)
C_TEXT:C284(AA_ListAddItembyID; $7)
C_TEXT:C284(AA_ListAddItembyID; $8)
C_TEXT:C284(AA_ListAddItembyID; $9)

//AA_LISTADDITEMINPROCESS
C_TEXT:C284(AA_ListAddIteminProcess; $1)
C_LONGINT:C283(AA_ListAddIteminProcess; $2)

//AA_LISTGETPROPERTYCODE
C_LONGINT:C283(AA_ListGetPropertyCode; $0)
C_LONGINT:C283(AA_ListGetPropertyCode; $1)

//AA_LISTITEMADDPROPERTY
C_LONGINT:C283(AA_ListItemAddProperty; $1)
C_LONGINT:C283(AA_ListItemAddProperty; $2)
C_LONGINT:C283(AA_ListItemAddProperty; $3)

//AA_LISTMANAGER_IMPLEMENTEDCALLS
C_POINTER:C301(AA_Listmanager_ImplementedCalls; $1)
C_POINTER:C301(AA_Listmanager_ImplementedCalls; $2)
C_POINTER:C301(AA_Listmanager_ImplementedCalls; $3)

///here 2020
//AA_at_ListPropertiesUPDATE
C_BOOLEAN:C305(AA_ListPropertiesUpdate; $0)
C_LONGINT:C283(AA_ListPropertiesUpdate; $1)
C_TEXT:C284(AA_ListPropertiesUpdate; $2)

C_BOOLEAN:C305(AA_ListPropertiesUpdate; $3)

//AA_LISTSELECTOR
C_LONGINT:C283(AA_ListSelector; $0)
C_POINTER:C301(AA_ListSelector; $1)
C_TEXT:C284(AA_ListSelector; $2)

//AA_LOADLIST
C_LONGINT:C283(AA_LoadList; $0)
C_POINTER:C301(AA_LoadList; $1)
C_POINTER:C301(AA_LoadList; $2)
C_POINTER:C301(AA_LoadList; $3)
C_BOOLEAN:C305(AA_LoadList; $4)
C_POINTER:C301(AA_LoadList; $5)

//AA_LOADLISTBYID
C_LONGINT:C283(AA_LoadListbyID; $1)
C_POINTER:C301(AA_LoadListbyID; $2)
C_POINTER:C301(AA_LoadListbyID; $3)
C_BOOLEAN:C305(AA_LoadListbyID; $4)
C_POINTER:C301(AA_LoadListbyID; $5)

//AA_LOADLISTBYNAME
C_LONGINT:C283(AA_LoadListByName; $0)
C_TEXT:C284(AA_LoadListByName; $1)
C_POINTER:C301(AA_LoadListByName; $2)
C_POINTER:C301(AA_LoadListByName; $3)
C_BOOLEAN:C305(AA_LoadListByName; $4)
C_POINTER:C301(AA_LoadListByName; $5)

//AA_LOADLISTINSERTNEW
C_POINTER:C301(AA_Loadlistinsertnew; $1)
C_POINTER:C301(AA_Loadlistinsertnew; $2)

//AA_LOADLISTITEMPROPERTY
C_LONGINT:C283(AA_LoadListItemProperty; $1)

//AA_LOADLISTITEMTOMANAGER
C_LONGINT:C283(AA_LoadListItemtoManager; $1)

//AA_LOADLISTNAME
C_LONGINT:C283(AA_LoadListName; $0)
C_LONGINT:C283(AA_LoadListName; $1)
C_TEXT:C284(AA_LoadListName; $2)

//AA_LOADLISTOFLISTS
C_POINTER:C301(AA_LoadListofLists; $1)
C_POINTER:C301(AA_LoadListofLists; $2)
C_POINTER:C301(AA_LoadListofLists; $3)
C_POINTER:C301(AA_LoadListofLists; $4)
C_POINTER:C301(AA_LoadListofLists; $5)

//AA_LOADLISTTOMANAGER
C_LONGINT:C283(AA_LoadListtoManager; $1)
C_TEXT:C284(AA_LoadListtoManager; $2)
C_BOOLEAN:C305(AA_LoadListtoManager; $3)

//AA_PARSENAME
C_TEXT:C284(AA_ParseName; $1)
C_LONGINT:C283(AA_ParseName; $2)
C_POINTER:C301(AA_ParseName; $3)
C_POINTER:C301(AA_ParseName; $4)
C_POINTER:C301(AA_ParseName; $5)
C_POINTER:C301(AA_ParseName; $6)
C_POINTER:C301(AA_ParseName; $7)
C_POINTER:C301(AA_ParseName; $8)
C_POINTER:C301(AA_ParseName; $9)

//AA_SAVELISTITEM
C_LONGINT:C283(AA_SaveListItem; $1)
C_REAL:C285(AA_SaveListItem; $2)

//AA_SAVELISTITEMPROPERTY
C_LONGINT:C283(AA_SaveListItemProperty; $1)

//AA_SAVEUPDATEDLIST
C_LONGINT:C283(AA_SaveUpdatedList; $0)
C_LONGINT:C283(AA_SaveUpdatedList; $1)
C_TEXT:C284(AA_SaveUpdatedList; $2)

//AA_SETIDBYTABLENUM
C_LONGINT:C283(AA_SetIDbyTableNum; $1)

//AA_SETNEXTID
C_LONGINT:C283(AA_SetNextID; $1)
C_LONGINT:C283(AA_SetNextID; $2)
C_LONGINT:C283(AA_SetNextID; $3)
C_LONGINT:C283(AA_SetNextID; $4)

//AA_UPDATELISTVERSION
C_LONGINT:C283(AA_UpdateListVersion; $1)

//About_Daybook
C_BOOLEAN:C305(About_Daybook; $1)

//ACC_CalculateBalance
C_TEXT:C284(ACC_CalculateBalance; $1)

//Acc_BalPage
C_LONGINT:C283(Acc_BalPage; $1)
C_LONGINT:C283(Acc_BalPage; $2)
C_TEXT:C284(Acc_BalPage; $3)

//Acc_BalPage12
C_LONGINT:C283(Acc_BalPage12; $1)
C_LONGINT:C283(Acc_BalPage12; $2)
C_TEXT:C284(Acc_BalPage12; $3)

//Acc_BalPL2
C_LONGINT:C283(Acc_BalPL2; $1)

//Acc_BalRepHdg

C_TEXT:C284(Acc_BalRepHdg; $1)

//Acc_BalRepPS
C_TEXT:C284(Acc_BalRepPS; $1)

//Acc_BalRepTit
C_TEXT:C284(Acc_BalRepTit; $1)
C_POINTER:C301(Acc_BalRepTit; $2)

//ACC_BalSelect
C_LONGINT:C283(ACC_BalSelect; $1)
C_POINTER:C301(ACC_BalSelect; $2)
C_POINTER:C301(ACC_BalSelect; $3)

//Acc_BalSelLP
C_LONGINT:C283(ACC_BalSelLP; $0)
C_LONGINT:C283(ACC_BalSelLP; $1)
C_LONGINT:C283(ACC_BalSelLP; $2)
C_LONGINT:C283(ACC_BalSelLP; $3)
C_POINTER:C301(ACC_BalSelLP; $4)
C_POINTER:C301(ACC_BalSelLP; $5)

//Accounts_CheckPref
C_BOOLEAN:C305(Accounts_CheckPref; $0)
C_TEXT:C284(Accounts_CheckPref; $1)
C_BOOLEAN:C305(Accounts_CheckPref; $2)

//Accounts_LaySrc
C_TEXT:C284(Accounts_LaySrc; $1)

//Accounts_ZeroS2
C_BOOLEAN:C305(Accounts_ZeroS2; $0)

//ACC_11UPDATE
C_BOOLEAN:C305(ACC_11Update; $1)
C_LONGINT:C283(ACC_11Update; $2)
C_LONGINT:C283(ACC_11Update; $3)

//ACC_BATCHADDSUBITEM
C_BOOLEAN:C305(ACC_BatchAddSubItem; $1)

//ACC_BATCHFINDTRANSACTION
C_LONGINT:C283(ACC_BatchFindTransaction; $1)
C_TEXT:C284(ACC_BatchFindTransaction; $2)
C_TEXT:C284(ACC_BatchFindTransaction; $3)
C_TEXT:C284(ACC_BatchFindTransaction; $4)
C_TEXT:C284(ACC_BatchFindTransaction; $5)
C_REAL:C285(ACC_BatchFindTransaction; $6)
C_REAL:C285(ACC_BatchFindTransaction; $7)
C_BOOLEAN:C305(ACC_BatchFindTransaction; $8)

//ACC_BATCHITEMCHECKIO
C_TEXT:C284(ACC_BatchItemCheckIO; $0)
C_TEXT:C284(ACC_BatchItemCheckIO; $1)
C_TEXT:C284(ACC_BatchItemCheckIO; $2)
C_TEXT:C284(ACC_BatchItemCheckIO; $3)

//ACC_BATCHITEMENTRY
C_LONGINT:C283(ACC_BatchItemEntry; $1)
C_LONGINT:C283(ACC_BatchItemEntry; $2)
C_LONGINT:C283(ACC_BatchItemEntry; $3)
C_LONGINT:C283(ACC_BatchItemEntry; $4)
C_TEXT:C284(ACC_BatchItemEntry; $5)
C_TEXT:C284(ACC_BatchItemEntry; $6)
C_TEXT:C284(ACC_BatchItemEntry; $7)
C_LONGINT:C283(ACC_BatchItemEntry; $8)
C_DATE:C307(ACC_BatchItemEntry; $9)
C_TEXT:C284(ACC_BatchItemEntry; $10)
C_LONGINT:C283(ACC_BatchItemEntry; $11)
C_LONGINT:C283(ACC_BatchItemEntry; $12)

//ACC_BATCHITEMOVERRIDEIO
C_POINTER:C301(ACC_BatchItemoverrideIO; $1)
C_POINTER:C301(ACC_BatchItemoverrideIO; $2)

//ACC_BATCHITEMSENDTOBATCH
C_LONGINT:C283(ACC_BatchItemSendtoBatch; $1)

//ACC_BATCHREPORTERROR
C_LONGINT:C283(ACC_BATCHREPORTERROR; $1)
C_LONGINT:C283(ACC_BATCHREPORTERROR; $2)
C_LONGINT:C283(ACC_BATCHREPORTERROR; $3)
C_LONGINT:C283(ACC_BATCHREPORTERROR; $4)
C_LONGINT:C283(ACC_BATCHREPORTERROR; $5)
C_REAL:C285(ACC_BATCHREPORTERROR; $6)




//ACC_BUILDUNIQUE
C_TEXT:C284(ACC_Buildunique; $0)
C_TEXT:C284(ACC_Buildunique; $1)
C_TEXT:C284(ACC_Buildunique; $2)
C_TEXT:C284(ACC_Buildunique; $3)
C_TEXT:C284(ACC_Buildunique; $4)
C_TEXT:C284(ACC_Buildunique; $5)

//ACC_CHECKBALANCE
C_REAL:C285(ACC_CheckBalance; $0)
C_LONGINT:C283(ACC_CheckBalance; $1)
C_BOOLEAN:C305(ACC_CheckBalance; $2)

//ACC_CHECKCREDITSIDE
C_LONGINT:C283(ACC_CheckCreditSide; $0)
C_LONGINT:C283(ACC_CheckCreditSide; $1)
C_LONGINT:C283(ACC_CheckCreditSide; $2)
C_REAL:C285(ACC_CheckCreditSide; $3)
C_REAL:C285(ACC_CheckCreditSide; $4)
C_BOOLEAN:C305(ACC_CheckCreditSide; $5)
C_BOOLEAN:C305(ACC_CheckCreditSide; $6)
C_POINTER:C301(ACC_CheckCreditSide; $7)

//ACC_CHECKDEBITSIDE
C_LONGINT:C283(ACC_CheckDebitSide; $0)
C_LONGINT:C283(ACC_CheckDebitSide; $1)
C_LONGINT:C283(ACC_CheckDebitSide; $2)
C_REAL:C285(ACC_CheckDebitSide; $3)
C_REAL:C285(ACC_CheckDebitSide; $4)
C_BOOLEAN:C305(ACC_CheckDebitSide; $5)
C_BOOLEAN:C305(ACC_CheckDebitSide; $6)
C_POINTER:C301(ACC_CheckDebitSide; $7)

//ACC_CHECKPLENTRIES
C_TEXT:C284(ACC_CheckPLentries; $1)

//ACC_CONVERTFORPROFIT
C_REAL:C285(ACC_ConvertForProfit; $0)
C_TEXT:C284(ACC_ConvertForProfit; $1)
C_TEXT:C284(ACC_ConvertForProfit; $2)
C_TEXT:C284(ACC_ConvertForProfit; $3)
C_TEXT:C284(ACC_ConvertForProfit; $4)
C_REAL:C285(ACC_ConvertForProfit; $5)
C_REAL:C285(ACC_ConvertForProfit; $6)
C_TEXT:C284(ACC_ConvertForProfit; $7)
C_LONGINT:C283(ACC_ConvertForProfit; $8)
C_TEXT:C284(ACC_ConvertForProfit; $9)
C_DATE:C307(ACC_ConvertForProfit; $10)

//ACC_FULLVALIDATION
C_LONGINT:C283(ACC_FullValidation; $1)

//ACC_FULLVALIDATION_P
C_LONGINT:C283(ACC_FullValidation_p; $1)

//ACC_GETYEARSTART
C_TEXT:C284(ACC_GetYearStart; $0)
C_DATE:C307(ACC_GetYearStart; $1)

//ACC_LOADFINANCIALYEARS
C_BOOLEAN:C305(ACC_LoadFinancialYears; $1)

//ACC_LOADTOARRAYS
C_TEXT:C284(ACC_LoadToArrays; $1)
C_BOOLEAN:C305(ACC_LoadToArrays; $2)
C_TEXT:C284(ACC_LoadToArrays; $3)
C_TEXT:C284(ACC_LoadToArrays; $4)

//ACC_LOADTRANSTOARRAYS
C_LONGINT:C283(ACC_LoadTransToArrays; $1)
C_TEXT:C284(ACC_LoadTransToArrays; $2)
C_POINTER:C301(ACC_LoadTransToArrays; $3)
C_TEXT:C284(ACC_LoadTransToArrays; $4)
C_TEXT:C284(ACC_LoadTransToArrays; $5)

//ACC_MODIFYTRANSACTION
C_LONGINT:C283(ACC_ModifyTransaction; $1)
C_LONGINT:C283(ACC_ModifyTransaction; $2)
C_TEXT:C284(ACC_ModifyTransaction; $3)
C_TEXT:C284(ACC_ModifyTransaction; $4)
C_TEXT:C284(ACC_ModifyTransaction; $5)
C_TEXT:C284(ACC_ModifyTransaction; $6)
C_TEXT:C284(ACC_ModifyTransaction; $7)
C_REAL:C285(ACC_ModifyTransaction; $8)
C_REAL:C285(ACC_ModifyTransaction; $9)
C_BOOLEAN:C305(ACC_ModifyTransaction; $10)
C_POINTER:C301(ACC_ModifyTransaction; $11)

//ACC_PROFITCALCULATOR
C_TEXT:C284(ACC_ProfitCalculator; $1)

//ACC_PUTOTHERSIDE
C_LONGINT:C283(ACC_PutOtherSide; $1)
C_LONGINT:C283(ACC_PutOtherSide; $2)
C_LONGINT:C283(ACC_PutOtherSide; $3)

//ACC_PVENTRY
C_LONGINT:C283(ACC_PvEntry; $1)
C_LONGINT:C283(ACC_PvEntry; $2)
C_LONGINT:C283(ACC_PvEntry; $3)


//ACC_REPORTBALANCEERROR
C_TEXT:C284(ACC_REPORTBALANCEERROR; $1)
C_REAL:C285(ACC_REPORTBALANCEERROR; $2)
C_REAL:C285(ACC_REPORTBALANCEERROR; $3)
C_LONGINT:C283(ACC_REPORTBALANCEERROR; $4)

//ACC_REPORTCHECKBATCH
C_REAL:C285(ACC_ReportCheckBatch; $0)
C_LONGINT:C283(ACC_ReportCheckBatch; $1)
C_LONGINT:C283(ACC_ReportCheckBatch; $2)
C_REAL:C285(ACC_ReportCheckBatch; $3)

//ACC_REVERSEUNIQUE
C_TEXT:C284(ACC_ReverseUnique; $1)
C_POINTER:C301(ACC_ReverseUnique; $2)
C_POINTER:C301(ACC_ReverseUnique; $3)
C_POINTER:C301(ACC_ReverseUnique; $4)
C_POINTER:C301(ACC_ReverseUnique; $5)
C_POINTER:C301(ACC_ReverseUnique; $6)

//ACC_SETTRANSACTIONBATCHITEM
C_LONGINT:C283(ACC_SetTransactionBatchItem; $1)

//ACC_TESTONEID
C_LONGINT:C283(ACC_testOneID; $1)

//ACC_TRANSDOUBLECHECK
C_LONGINT:C283(ACC_TransDoubleCheck; $1)
C_LONGINT:C283(ACC_TransDoubleCheck; $2)

//ACC_TRANSLOADSUBITEMS
C_BOOLEAN:C305(ACC_TransLoadSubitems; $1)

//ACC_TRANSMATCHBATCH
C_BOOLEAN:C305(ACC_TransMatchBatch; $0)
C_BOOLEAN:C305(ACC_TransMatchBatch; $1)
C_REAL:C285(ACC_TransMatchBatch; $2)
C_REAL:C285(ACC_TransMatchBatch; $3)
C_BOOLEAN:C305(ACC_TransMatchBatch; $4)

//ACC_TRANSSETDISPLAY
C_TEXT:C284(ACC_TransSetDisplay; $1)
C_REAL:C285(ACC_TransSetDisplay; $2)

//ACC_TRANSVALIDATEALL
C_LONGINT:C283(ACC_TransValidateALL; $1)
C_BOOLEAN:C305(ACC_TransValidateALL; $2)

//ACC_TRANSVALIDATEBATCH
C_BOOLEAN:C305(ACC_TransValidateBatch; $0)
C_LONGINT:C283(ACC_TransValidateBatch; $1)
C_LONGINT:C283(ACC_TransValidateBatch; $2)
C_BOOLEAN:C305(ACC_TransValidateBatch; $3)
C_BOOLEAN:C305(ACC_TransValidateBatch; $4)
C_POINTER:C301(ACC_TransValidateBatch; $5)

//ACC_TRANSVALLDATESUBCALLS
C_LONGINT:C283(ACC_TransvalldateSubCalls; $1)
C_LONGINT:C283(ACC_TransvalldateSubCalls; $2)
C_TEXT:C284(ACC_TransvalldateSubCalls; $3)
C_TEXT:C284(ACC_TransvalldateSubCalls; $4)
C_TEXT:C284(ACC_TransvalldateSubCalls; $5)
C_TEXT:C284(ACC_TransvalldateSubCalls; $6)
C_REAL:C285(ACC_TransvalldateSubCalls; $7)
C_REAL:C285(ACC_TransvalldateSubCalls; $8)

//ACC_TRRELATIONENTRY
C_BOOLEAN:C305(ACC_trRelationEntry; $0)
C_LONGINT:C283(ACC_trRelationEntry; $1)
C_LONGINT:C283(ACC_trRelationEntry; $2)

//ACC_TRRELATIONEXIT

//ACC_VALIDATESUBITEMS
C_POINTER:C301(ACC_ValidateSubitems; $1)
C_POINTER:C301(ACC_ValidateSubitems; $2)
C_BOOLEAN:C305(ACC_ValidateSubitems; $3)

//Address_ContactName
C_TEXT:C284(Address_ContactName; $0)

//Address_DetailsConstruct
C_TEXT:C284(Address_DetailsConstruct; $0)
C_TEXT:C284(Address_DetailsConstruct; $1)
C_TEXT:C284(Address_DetailsConstruct; $2)
C_TEXT:C284(Address_DetailsConstruct; $3)

//Address_Lines
C_TEXT:C284(Address_Lines; $1)






//Are_You_SureM
C_TEXT:C284(Are_You_SureM; $1)


//Array_LCx
C_LONGINT:C283(Array_LCx; $1)





//AUDITLOGDOCUMENTMODIFY
C_TEXT:C284(AuditLogDocumentModify; $1)

//AUTO_AUDIT
C_POINTER:C301(AUTO_AUDIT; $1)
C_LONGINT:C283(AUTO_AUDIT; $2)
C_TEXT:C284(AUTO_AUDIT; $3)
C_TEXT:C284(AUTO_AUDIT; $4)

//AUTO_AUDIT_DEL
C_POINTER:C301(AUTO_AUDIT_DEL; $1)
C_LONGINT:C283(AUTO_AUDIT_DEL; $2)
C_TEXT:C284(AUTO_AUDIT_DEL; $3)
C_TEXT:C284(AUTO_AUDIT_DEL; $4)

//AUTO_AUDIT_EXPORT
C_LONGINT:C283(AUTO_AUDIT_EXPORT; $1)
C_TEXT:C284(AUTO_AUDIT_EXPORT; $2)

//BACKGROUNDERSETDELAY
C_LONGINT:C283(BackgrounderSetDelay; $1)




//BIG ONE
C_POINTER:C301(Big_One; $1)

//BK_EDITCONNECTION
C_REAL:C285(BK_EditConnection; $1)
C_REAL:C285(BK_EditConnection; $2)

//BK_EDITDATAMODEL
C_REAL:C285(BK_EditDataModel; $0)
C_REAL:C285(BK_EditDataModel; $1)
C_REAL:C285(BK_EditDataModel; $2)
C_REAL:C285(BK_EditDataModel; $3)
C_TEXT:C284(BK_EditDataModel; $4)
C_REAL:C285(BK_EditDataModel; $5)

//BK_EDITDATAOPTIONS
C_REAL:C285(BK_EditDataOptions; $0)
C_REAL:C285(BK_EditDataOptions; $1)
C_REAL:C285(BK_EditDataOptions; $2)
C_REAL:C285(BK_EditDataOptions; $3)

//BK_EDITSERVER
C_REAL:C285(BK_EditServer; $0)
C_REAL:C285(BK_EditServer; $1)
C_REAL:C285(BK_EditServer; $2)
C_REAL:C285(BK_EditServer; $3)

//BK_EDITSTORE
C_REAL:C285(BK_EditStore; $0)
C_LONGINT:C283(BK_EditStore; $1)
C_LONGINT:C283(BK_EditStore; $2)
C_REAL:C285(BK_EditStore; $3)
C_REAL:C285(BK_EditStore; $4)

//BLD_FIXEDLENGTH
C_TEXT:C284(BLD_FIXEDLENGTH; $0)
C_TEXT:C284(BLD_FIXEDLENGTH; ${-1})
C_LONGINT:C283(BLD_FIXEDLENGTH; $1)
C_TEXT:C284(BLD_FIXEDLENGTH; $2)
C_TEXT:C284(BLD_FIXEDLENGTH; $3)



//BP_DIRSYMBOL
C_TEXT:C284(BP_DirSymbol; $0)

//BP_ISUSERAUTHORIZED
C_BOOLEAN:C305(BP_IsUserAuthorized; $0)

//BP_SENDEMAIL
C_BOOLEAN:C305(BP_SendEmail; $0)
C_TEXT:C284(BP_SendEmail; $1)
C_TEXT:C284(BP_SendEmail; $2)
C_TEXT:C284(BP_SendEmail; $3)
C_TEXT:C284(BP_SendEmail; $4)

//BP_TIMESTAMP
C_LONGINT:C283(BP_Timestamp; $0)
C_DATE:C307(BP_Timestamp; $1)
C_TIME:C306(BP_Timestamp; $2)

//BP_TIMESTAMP2DATE
C_DATE:C307(BP_Timestamp2Date; $0)
C_LONGINT:C283(BP_Timestamp2Date; $1)

//BP_TIMESTAMP2TIME
C_TIME:C306(BP_Timestamp2Time; $0)
C_LONGINT:C283(BP_Timestamp2Time; $1)

//BUILDINDEXASYNCH
C_LONGINT:C283(BuildIndexAsynch; $1)
C_LONGINT:C283(BuildIndexAsynch; $2)
C_TEXT:C284(BuildIndexAsynch; $3)

//CACHE_INITIALISE
C_TEXT:C284(Cache_Initialise; $1)

//CACHE_UPDATE
C_LONGINT:C283(Cache_Update; $1)
C_DATE:C307(Cache_Update; $2)
C_DATE:C307(Cache_Update; $3)
C_TEXT:C284(Cache_Update; $4)
C_POINTER:C301(Cache_Update; $5)
C_POINTER:C301(Cache_Update; $6)
C_POINTER:C301(Cache_Update; $7)
C_POINTER:C301(Cache_Update; $8)

//CAC_BLOBTORECORD
C_LONGINT:C283(CAC_BlobToRecord; $0)
C_BLOB:C604(CAC_BlobToRecord; $1)
C_POINTER:C301(CAC_BlobToRecord; $2)

//CAC_DELETERECORD
C_TEXT:C284(CAC_DeleteRecord; $0)
C_POINTER:C301(CAC_DeleteRecord; $1)
C_TEXT:C284(CAC_DeleteRecord; $2)
C_TEXT:C284(CAC_DeleteRecord; $3)
C_LONGINT:C283(CAC_DeleteRecord; $4)

//CAC_DELETESELECTION
C_TEXT:C284(CAC_DeleteSelection; $0)
C_POINTER:C301(CAC_DeleteSelection; $1)
C_TEXT:C284(CAC_DeleteSelection; $2)

//CAC_QUERY
C_TEXT:C284(CAC_Query; $0)
C_POINTER:C301(CAC_Query; $1)
C_TEXT:C284(CAC_Query; $2)
C_TEXT:C284(CAC_Query; $3)
C_TEXT:C284(CAC_Query; $4)
C_TEXT:C284(CAC_Query; $5)

//CAC_RECORDTOBLOB
C_BLOB:C604(CAC_RecordToBlob; $0)
C_POINTER:C301(CAC_RecordToBlob; $1)

//CAC_SAVEEXPIRATION
C_TEXT:C284(CAC_SaveExpiration; $0)
C_POINTER:C301(CAC_SaveExpiration; $1)
C_TEXT:C284(CAC_SaveExpiration; $2)
C_REAL:C285(CAC_SaveExpiration; $3)
C_TEXT:C284(CAC_SaveExpiration; $4)

//CAC_SAVERECORD
C_TEXT:C284(CAC_SaveRecord; $0)
C_POINTER:C301(CAC_SaveRecord; $1)
C_TEXT:C284(CAC_SaveRecord; $2)
C_REAL:C285(CAC_SaveRecord; $3)
C_TEXT:C284(CAC_SaveRecord; $4)
C_TEXT:C284(CAC_SaveRecord; $5)
C_TEXT:C284(CAC_SaveRecord; $6)

//CAC_SECONDS
C_LONGINT:C283(CAC_Seconds; $0)

//Calc_Balance2
C_TEXT:C284(Calc_Balance2; $1)
C_POINTER:C301(Calc_Balance2; $2)



//Calc_Percent
C_REAL:C285(Calc_Percent; $0)
C_REAL:C285(Calc_Percent; $1)
C_REAL:C285(Calc_Percent; $2)
C_REAL:C285(Calc_Percent; $3)

//Calc_Year
C_LONGINT:C283(Calc_Year; $0)
C_LONGINT:C283(Calc_Year; $1)

//Calls_File
C_BOOLEAN:C305(Calls_File; $0)

//Calls_FormSR
C_TEXT:C284(Calls_FormSR; $1)
C_LONGINT:C283(Calls_FormSR; $2)

//Calls_In
C_TEXT:C284(Calls_In; $1)
C_TEXT:C284(Calls_In; $2)
C_TEXT:C284(Calls_In; $3)
C_TEXT:C284(Calls_In; $4)

//Calls_RespCalc
C_TEXT:C284(Calls_RespCalc; $0)
C_DATE:C307(Calls_RespCalc; $1)

//Calls_Sel
C_TEXT:C284(Calls_Sel; $1)

//Calls_SelLP
C_LONGINT:C283(Calls_SelLP; $0)
C_LONGINT:C283(Calls_SelLP; $1)
C_LONGINT:C283(Calls_SelLP; $2)
C_LONGINT:C283(Calls_SelLP; $3)
C_POINTER:C301(Calls_SelLP; $4)
C_POINTER:C301(Calls_SelLP; $5)

//Calls_SelP
C_LONGINT:C283(Calls_SelP; $1)
C_POINTER:C301(Calls_SelP; $2)
C_POINTER:C301(Calls_SelP; $3)

//CALL_SALESYEARONYEAR
C_TEXT:C284(CALL_SalesYearonYEar; $0)
C_TEXT:C284(CALL_SalesYearonYEar; $1)
C_LONGINT:C283(CALL_SalesYearonYEar; $2)
C_TIME:C306(CALL_SalesYearonYEar; $3)

//CAL_BUTTONHANDLER
C_POINTER:C301(CAL_ButtonHandler; $1)

//CATALOGUE_FLAGLINKFORDELETION
C_LONGINT:C283(Catalogue_FlagLinkfordeletion; $1)

//CAT_CONVERTVALUE
C_REAL:C285(Cat_ConvertValue; $0)
C_REAL:C285(Cat_ConvertValue; $1)
C_TEXT:C284(Cat_ConvertValue; $2)
C_TEXT:C284(Cat_ConvertValue; $3)

//CAT_GETPRODUCTPRICE
C_REAL:C285(CAT_GetProductPrice; $0)
C_TEXT:C284(CAT_GetProductPrice; $1)
C_LONGINT:C283(CAT_GetProductPrice; $2)
C_LONGINT:C283(CAT_GetProductPrice; $3)
C_REAL:C285(CAT_GetProductPrice; $4)

//CAT_LOADCATS
C_REAL:C285(CAT_LoadCats; $1)
C_BOOLEAN:C305(CAT_LoadCats; $2)

//CAT_LOADPRODSTOCK
C_REAL:C285(CAT_LoadProdStock; $1)
C_TEXT:C284(CAT_LoadProdStock; $2)

//CAT_LOADPRODUCTS
C_LONGINT:C283(CAT_LoadProducts; $1)
C_TEXT:C284(CAT_LoadProducts; $2)
C_BOOLEAN:C305(CAT_LoadProducts; $3)

//CAT_PRODADD
C_LONGINT:C283(CAT_ProdAdd; $1)
C_LONGINT:C283(CAT_ProdAdd; $2)

//CAT_PRODUPDATECATS
C_POINTER:C301(CAT_ProdUpdateCats; $1)
C_REAL:C285(CAT_ProdUpdateCats; $2)

//Check_AnalAcc
C_BOOLEAN:C305(Check_AnalAcc; $0)
C_POINTER:C301(Check_AnalAcc; $1)
C_POINTER:C301(Check_AnalAcc; $2)
C_LONGINT:C283(Check_AnalAcc; $3)
C_BOOLEAN:C305(Check_AnalAcc; $4)
C_POINTER:C301(Check_AnalAcc; $5)

//Check_Analysis
C_POINTER:C301(Check_Analysis; $1)
C_TEXT:C284(Check_Analysis; $2)
C_POINTER:C301(Check_Analysis; $3)
C_POINTER:C301(Check_Analysis; $4)

//Check_CCExp
C_BOOLEAN:C305(Check_CCExp; $0)
C_POINTER:C301(Check_CCExp; $1)

//Check_CCExp2
C_BOOLEAN:C305(Check_CCExp2; $0)
C_POINTER:C301(Check_CCExp2; $1)

//Check_CCIssuer
C_BOOLEAN:C305(Check_CCIssuer; $0)
C_POINTER:C301(Check_CCIssuer; $1)

//Check_CCIssuer2
C_BOOLEAN:C305(Check_CCIssuer2; $0)
C_POINTER:C301(Check_CCIssuer2; $1)

//Check_CCNo
C_BOOLEAN:C305(Check_CCNo; $0)
C_POINTER:C301(Check_CCNo; $1)

//Check_CCNo2
C_BOOLEAN:C305(Check_CCNo2; $0)
C_POINTER:C301(Check_CCNo2; $1)

//Check_CCValFr
C_BOOLEAN:C305(Check_CCValFr; $0)
C_POINTER:C301(Check_CCValFr; $1)

//Check_CCValFr2
C_BOOLEAN:C305(Check_CCValFr2; $0)
C_POINTER:C301(Check_CCValFr2; $1)

//Check_Company
C_POINTER:C301(Check_Company; $1)
C_POINTER:C301(Check_Company; $2)
C_POINTER:C301(Check_Company; $3)
C_BOOLEAN:C305(Check_Company; $4)
C_BOOLEAN:C305(Check_Company; $5)

//Check_CompanyIS
C_POINTER:C301(Check_CompanyIS; $1)
C_POINTER:C301(Check_CompanyIS; $2)
C_POINTER:C301(Check_CompanyIS; $3)

//Check_CompanyNC
C_POINTER:C301(Check_CompanyNC; $1)
C_POINTER:C301(Check_CompanyNC; $2)
C_POINTER:C301(Check_CompanyNC; $3)
C_BOOLEAN:C305(Check_CompanyNC; $4)

//Check_CompanySu
C_TEXT:C284(Check_CompanySu; $1)

//Check_Cont
C_POINTER:C301(Check_Cont; $1)
C_POINTER:C301(Check_Cont; $2)
C_POINTER:C301(Check_Cont; $3)

//Check_Contact
C_POINTER:C301(Check_Contact; $1)
C_POINTER:C301(Check_Contact; $2)
C_POINTER:C301(Check_Contact; $3)
C_TEXT:C284(Check_Contact; $4)

//Check_ContactNC
C_POINTER:C301(Check_ContactNC; $1)
C_POINTER:C301(Check_ContactNC; $2)
C_POINTER:C301(Check_ContactNC; $3)

//Check_ContCorr
C_BOOLEAN:C305(Check_ContCorr; $0)
C_POINTER:C301(Check_ContCorr; $1)
C_POINTER:C301(Check_ContCorr; $2)

//Check_ContDef
C_POINTER:C301(Check_ContDef; $1)
C_POINTER:C301(Check_ContDef; $2)
C_REAL:C285(Check_ContDef; $3)

//Check_ContSrch
C_POINTER:C301(Check_ContSrch; $1)

//Check_Date
C_DATE:C307(Check_Date; $0)
C_DATE:C307(Check_Date; $1)

//Check_DispNum
C_POINTER:C301(Check_DispNum; $1)
C_TEXT:C284(Check_DispNum; $2)

//Check_Labels
C_LONGINT:C283(Check_Labels; $1)

//Check_Letter
C_POINTER:C301(Check_Letter; $1)
C_TEXT:C284(Check_Letter; $2)

//Check_List
C_POINTER:C301(Check_List; $1)
C_POINTER:C301(Check_List; $2)
C_TEXT:C284(Check_List; $3)

//Check_Lists
C_POINTER:C301(Check_Lists; $1)
C_TEXT:C284(Check_Lists; $2)
C_TEXT:C284(Check_Lists; $3)
C_REAL:C285(Check_Lists; $4)

//Check_Locked
C_BOOLEAN:C305(Check_Locked; $0)
C_POINTER:C301(Check_Locked; $1)
C_REAL:C285(Check_Locked; $2)

//Check_LockMess
C_BOOLEAN:C305(Check_LockMess; $0)
C_POINTER:C301(Check_LockMess; $1)
C_TEXT:C284(Check_LockMess; $2)

//Check_Minor
C_POINTER:C301(Check_Minor; $1)
C_TEXT:C284(Check_Minor; $2)
C_POINTER:C301(Check_Minor; $3)
C_POINTER:C301(Check_Minor; $4)
C_POINTER:C301(Check_Minor; $5)
C_TEXT:C284(Check_Minor; $6)
C_TEXT:C284(Check_Minor; $7)
C_TEXT:C284(Check_Minor; $8)

//Check_Minor_IL
C_POINTER:C301(Check_Minor_IL; $1)
C_TEXT:C284(Check_Minor_IL; $2)
C_POINTER:C301(Check_Minor_IL; $3)
C_POINTER:C301(Check_Minor_IL; $4)
C_POINTER:C301(Check_Minor_IL; $5)

//Check_MinorFS
C_TEXT:C284(Check_MinorFS; $1)
C_POINTER:C301(Check_MinorFS; $2)
C_POINTER:C301(Check_MinorFS; $3)
C_POINTER:C301(Check_MinorFS; $4)

//Check_MinorNC
C_POINTER:C301(Check_MinorNC; $1)
C_TEXT:C284(Check_MinorNC; $2)
C_POINTER:C301(Check_MinorNC; $3)
C_POINTER:C301(Check_MinorNC; $4)
C_POINTER:C301(Check_MinorNC; $5)
C_TEXT:C284(Check_MinorNC; $6)
C_TEXT:C284(Check_MinorNC; $7)
C_BOOLEAN:C305(Check_MinorNC; $8)

//Check_Mod
C_LONGINT:C283(Check_Mod; $1)
C_TEXT:C284(Check_Mod; $2)

//Check_ModMess
C_BOOLEAN:C305(Check_ModMess; $0)
C_LONGINT:C283(Check_ModMess; $1)
C_LONGINT:C283(Check_ModMess; $2)

//Check_Modules
C_LONGINT:C283(Check_Modules; $1)

//Check_MultiCo
C_POINTER:C301(Check_MultiCo; $1)
C_POINTER:C301(Check_MultiCo; $2)
C_POINTER:C301(Check_MultiCo; $3)
C_TEXT:C284(Check_MultiCo; $4)

//Check_PC_AN
C_TEXT:C284(Check_PC_AN; $0)
C_TEXT:C284(Check_PC_AN; $1)

//Check_PerClose
C_POINTER:C301(Check_PerClose; $1)
C_POINTER:C301(Check_PerClose; $2)

//Check_Period
C_LONGINT:C283(Check_Period; $0)
C_DATE:C307(Check_Period; $1)

//Check_PersAnal
C_POINTER:C301(Check_PersAnal; $1)
C_POINTER:C301(Check_PersAnal; $2)

//Check_Postcode
C_BOOLEAN:C305(Check_Postcode; $0)
C_TEXT:C284(Check_Postcode; $1)
C_POINTER:C301(Check_Postcode; $2)

//Check_ProdSu
C_TEXT:C284(Check_ProdSu; $1)
C_BOOLEAN:C305(Check_ProdSu; $2)

//Check_Product
C_POINTER:C301(Check_Product; $1)
C_TEXT:C284(Check_Product; $2)
C_POINTER:C301(Check_Product; $3)



//Check_ProductNC
C_POINTER:C301(Check_ProductNC; $1)
C_TEXT:C284(Check_ProductNC; $2)

//Check_QM
C_TEXT:C284(Check_QM; $0)
C_TEXT:C284(Check_QM; $1)

//Check_Sec
C_POINTER:C301(Check_Sec; $1)
C_POINTER:C301(Check_Sec; $2)
C_LONGINT:C283(Check_Sec; $3)


//Check_SecInv
C_POINTER:C301(Check_SecInv; $1)
C_LONGINT:C283(Check_SecInv; $2)

//Check_SecPInv
C_POINTER:C301(Check_SecPInv; $1)

//Check_SecRO
C_POINTER:C301(Check_SecRO; $1)

//Check_SecTrB
C_POINTER:C301(Check_SecTrB; $1)

//Check_SSC
C_BOOLEAN:C305(Check_SSC; $0)
C_TEXT:C284(Check_SSC; $1)
C_POINTER:C301(Check_SSC; $2)
C_POINTER:C301(Check_SSC; $3)

//Check_VATReg
C_POINTER:C301(Check_VATReg; $1)
C_POINTER:C301(Check_VATReg; $2)

//CHECKFILEUNLOCKED
C_LONGINT:C283(CheckFileUnlocked; $1)
C_LONGINT:C283(CheckFileUnlocked; $2)
C_BOOLEAN:C305(CheckFileUnlocked; $3)

//CHECK_COMPANYID
C_LONGINT:C283(Check_CompanyID; $0)
C_POINTER:C301(Check_CompanyID; $1)
C_POINTER:C301(Check_CompanyID; $2)
C_POINTER:C301(Check_CompanyID; $3)

//CHECK_CONTACTID
C_LONGINT:C283(Check_ContactID; $0)
C_POINTER:C301(Check_ContactID; $1)
C_POINTER:C301(Check_ContactID; $2)
C_POINTER:C301(Check_ContactID; $3)

//CHECK_PRODUCT_ORDER
C_POINTER:C301(Check_Product_Order; $1)
C_TEXT:C284(Check_Product_Order; $2)
C_REAL:C285(Check_Product_Order; $3)
C_BOOLEAN:C305(Check_Product_Order; $4)
C_TEXT:C284(Check_Product_Order; $5)
C_TEXT:C284(Check_Product_Order; $6)




//CLEAN_UP_ARRAY
C_POINTER:C301(CLEAN_UP_ARRAY; $1)

//Close_ProWin
C_TEXT:C284(Close_ProWin; $1)

//Comp_DrySrch
C_BOOLEAN:C305(Comp_DrySrch; $0)

//Comp_Ph1Update
C_TEXT:C284(Comp_Ph1Update; $0)
C_TEXT:C284(Comp_Ph1Update; $1)

//Comp_ProdSupp
C_TEXT:C284(Comp_ProdSupp; $1)

//Comp_Proj
C_TEXT:C284(Comp_Proj; $1)
C_POINTER:C301(Comp_Proj; $2)

//Comp_RenumApp
C_TEXT:C284(Comp_RenumApp; $1)
C_TEXT:C284(Comp_RenumApp; $2)

//Comp_RenumAppCT
C_TEXT:C284(Comp_RenumAppCT; $1)
C_TEXT:C284(Comp_RenumAppCT; $2)

//Comp_RenumSrc
C_TEXT:C284(Comp_RenumSrc; $1)

//Comp_Sel2
C_TEXT:C284(Comp_Sel2; $1)
C_TEXT:C284(Comp_Sel2; $2)

//Comp_Sel3
C_TEXT:C284(Comp_Sel3; $1)

//Comp_Sel4
C_TEXT:C284(Comp_Sel4; $1)


//Comp_SelLP
C_LONGINT:C283(Comp_SelLP; $0)
C_LONGINT:C283(Comp_SelLP; $1)
C_LONGINT:C283(Comp_SelLP; $2)
C_REAL:C285(Comp_SelLP; $3)
C_POINTER:C301(Comp_SelLP; $4)
C_POINTER:C301(Comp_SelLP; $5)

//Comp_SelP
C_LONGINT:C283(Comp_SelP; $1)
C_POINTER:C301(Comp_SelP; $2)
C_POINTER:C301(Comp_SelP; $3)

//Comp_SelPName
C_TEXT:C284(Comp_SelPName; $1)

//Comp_SelPOther
C_POINTER:C301(Comp_SelPOther; $1)
C_POINTER:C301(Comp_SelPOther; $2)
C_TEXT:C284(Comp_SelPOther; $3)
C_TEXT:C284(Comp_SelPOther; $4)

//Comp_SelQual
C_BOOLEAN:C305(Comp_SelQual; $0)

//Companies_Abbr
C_TEXT:C284(Companies_Abbr; $0)
C_TEXT:C284(Companies_Abbr; $1)

//Companies_Arr2
C_LONGINT:C283(Companies_Arr2; $1)
C_TEXT:C284(Companies_Arr2; $2)

//Companies_FurTx
C_TEXT:C284(Companies_FurTx; $0)

//Companies_InLPA
C_LONGINT:C283(Companies_InLPA; $1)

//Companies_InLPß
C_TEXT:C284(Companies_InLPß; $1)
C_LONGINT:C283(Companies_InLPß; $2)

//Companies_InLPX
C_POINTER:C301(Companies_InLPX; $1)

//Companies_InPCC
C_BOOLEAN:C305(Companies_InPCC; $0)

//Companies_InPCI
C_BOOLEAN:C305(Companies_InPCI; $0)

//Companies_Print
C_TEXT:C284(Companies_Print; $1)

//Company_Email
C_TEXT:C284(Company_Email; $0)

//CompCont_Proj
C_TEXT:C284(CompCont_Proj; $1)
C_POINTER:C301(CompCont_Proj; $2)
C_POINTER:C301(CompCont_Proj; $3)

//Cont_Check
C_BOOLEAN:C305(Cont_Check; $1)

//Cont_Dedup2Src
C_BOOLEAN:C305(Cont_Dedup2Src; $0)

//CONT NAME
C_TEXT:C284(Cont Name; $0)
C_TEXT:C284(Cont Name; $1)
C_TEXT:C284(Cont Name; $2)
C_TEXT:C284(Cont Name; $3)

//CONT NAMEJT
C_TEXT:C284(Cont NameJT; $0)

//Cont_Names
C_TEXT:C284(Cont_Names; $0)

//Cont_Proj
C_TEXT:C284(Cont_Proj; $1)
C_POINTER:C301(Cont_Proj; $2)

//Cont_RenumSrch
C_TEXT:C284(Cont_RenumSrch; $1)

//Cont_Sel2
C_TEXT:C284(Cont_Sel2; $1)


//Cont_SelFComp
C_TEXT:C284(Cont_SelFComp; $1)

//Cont_SelFS
C_TEXT:C284(Cont_SelFS; $1)

//Cont_SelLP
C_LONGINT:C283(Cont_SelLP; $0)
C_LONGINT:C283(Cont_SelLP; $1)
C_LONGINT:C283(Cont_SelLP; $2)
C_LONGINT:C283(Cont_SelLP; $3)
C_POINTER:C301(Cont_SelLP; $4)
C_POINTER:C301(Cont_SelLP; $5)

//Cont_SelP
C_LONGINT:C283(Cont_SelP; $1)
C_POINTER:C301(Cont_SelP; $2)
C_POINTER:C301(Cont_SelP; $3)

//Cont_SelPifs
C_TEXT:C284(Cont_SelPifs; $1)
C_TEXT:C284(Cont_SelPifs; $2)

//Cont_SelPOther
C_POINTER:C301(Cont_SelPOther; $1)
C_POINTER:C301(Cont_SelPOther; $2)
C_TEXT:C284(Cont_SelPOther; $3)
C_TEXT:C284(Cont_SelPOther; $4)
C_TEXT:C284(Cont_SelPOther; $5)

//Contact_Dets
C_TEXT:C284(Contact_Dets; $0)

//Contact_Email
C_TEXT:C284(Contact_Email; $0)


//Contacts_ImpNJT
C_TEXT:C284(Contacts_ImpNJT; $1)
C_TEXT:C284(Contacts_ImpNJT; $2)
C_TEXT:C284(Contacts_ImpNJT; $3)


//Contacts_InLP
C_BOOLEAN:C305(Contacts_InLP; $1)
C_BOOLEAN:C305(Contacts_InLP; $2)

//Contacts_InLPB
C_BOOLEAN:C305(Contacts_InLPB; $1)
C_BOOLEAN:C305(Contacts_InLPB; $2)

//Contacts_InLPX
C_POINTER:C301(Contacts_InLPX; $1)

//Contacts_Mod
C_TEXT:C284(Contacts_Mod; $1)
C_TEXT:C284(Contacts_Mod; $2)

//Contr_OIPTSrc
C_BOOLEAN:C305(Contr_OIPTSrc; $0)

//Contracts_File
C_BOOLEAN:C305(Contracts_File; $0)

//Contracts_In
C_TEXT:C284(Contracts_In; $1)
C_TEXT:C284(Contracts_In; $2)
C_TEXT:C284(Contracts_In; $3)
C_TEXT:C284(Contracts_In; $4)

//Contracts_SelLP
C_LONGINT:C283(Contracts_SelLP; $0)
C_LONGINT:C283(Contracts_SelLP; $1)
C_LONGINT:C283(Contracts_SelLP; $2)
C_LONGINT:C283(Contracts_SelLP; $3)
C_POINTER:C301(Contracts_SelLP; $4)
C_POINTER:C301(Contracts_SelLP; $5)

//Contracts_SelP
C_LONGINT:C283(Contracts_SelP; $1)
C_POINTER:C301(Contracts_SelP; $2)
C_POINTER:C301(Contracts_SelP; $3)

//CON_GETCHARGES
C_POINTER:C301(CON_GetCharges; $1)
C_POINTER:C301(CON_GetCharges; $2)
C_POINTER:C301(CON_GetCharges; $3)

//CON_JOBROLEMANAGER
C_LONGINT:C283(CON_JobroleManager; $1)

//CO_ADDRESSMANAGER
C_REAL:C285(CO_AddressManager; $1)
C_REAL:C285(CO_AddressManager; $2)
C_REAL:C285(CO_AddressManager; $3)

//CO_ADDRESSMANAGER2
C_LONGINT:C283(CO_addressManager2; $1)
C_LONGINT:C283(CO_addressManager2; $2)
C_LONGINT:C283(CO_addressManager2; $3)

//CREATEFILERECORD
C_LONGINT:C283(CreateFileRecord; $1)

//CREATEMOVERECORD
C_BOOLEAN:C305(CreateMoveRecord; $0)
C_TEXT:C284(CreateMoveRecord; $1)
C_BOOLEAN:C305(CreateMoveRecord; $2)

//CurrConv_Ask
C_LONGINT:C283(CurrConv_Ask; $1)

//CurrConv_Convert
C_REAL:C285(CurrConv_Convert; $0)
C_REAL:C285(CurrConv_Convert; $1)
C_DATE:C307(CurrConv_Convert; $2)
C_TEXT:C284(CurrConv_Convert; $3)

//CurrConv_Title
C_TEXT:C284(CurrConv_Title; $0)
C_TEXT:C284(CurrConv_Title; $1)
C_POINTER:C301(CurrConv_Title; $2)

//CURRENCY FILL
C_POINTER:C301(Currency_Fill; $1)

//Currency_InDDefault
C_POINTER:C301(Currency_InDDefault; $1)

//CurrItem_Convert
C_POINTER:C301(CurrItem_Convert; $1)
C_POINTER:C301(CurrItem_Convert; $2)
C_POINTER:C301(CurrItem_Convert; $3)

//CurrItem_Conv2
C_POINTER:C301(CurrItem_Convert2; $1)

//CurrRate_Convert
C_TEXT:C284(CurrRate_Convert; $1)
C_POINTER:C301(CurrRate_Convert; $2)

//CurrRate_MostRecent
C_TEXT:C284(CurrRate_MostRecent; $1)
C_TEXT:C284(CurrRate_MostRecent; $2)
C_DATE:C307(CurrRate_MostRecent; $3)
C_TEXT:C284(CurrRate_MostRecent; $4)

//CurrRates_File
C_BOOLEAN:C305(CurrRates_File; $0)
C_BOOLEAN:C305(CurrRates_File; $1)

//CUR_CALCBALCONV
C_REAL:C285(CUR_CalcBalConv; $0)
C_POINTER:C301(CUR_CalcBalConv; $1)
C_TEXT:C284(CUR_CalcBalConv; $2)

//CUR_CHECKRATE
C_BOOLEAN:C305(CUR_CheckRate; $0)
C_TEXT:C284(CUR_CheckRate; $1)
C_TEXT:C284(CUR_CheckRate; $2)
C_REAL:C285(CUR_CheckRate; $3)

//Cur_ConvAsk
C_TEXT:C284(Cur_ConvAsk; $0)
C_TEXT:C284(Cur_ConvAsk; $1)
C_TEXT:C284(Cur_ConvAsk; $2)
C_POINTER:C301(Cur_ConvAsk; $3)
C_LONGINT:C283(Cur_ConvAsk; $4)
C_TEXT:C284(Cur_ConvAsk; $5)

//CUR_CONVERTVALUE
C_REAL:C285(CUR_ConvertValue; $0)
C_REAL:C285(CUR_ConvertValue; $1)
C_TEXT:C284(CUR_ConvertValue; $2)
C_TEXT:C284(CUR_ConvertValue; $3)

//CUR_LOADCONVERSIONS
C_REAL:C285(CUR_LoadConversions; $1)
C_BOOLEAN:C305(CUR_LoadConversions; $2)

//CUR_LOADMULTICURRVALCODES
C_POINTER:C301(Cur_LoadMultiCurrValCodes; $1)

//CUR_SAVEEXISTING
C_REAL:C285(CUR_SaveExisting; $1)

//CUR_SAVERATECHANGES
C_TEXT:C284(CUR_SaveRateChanges; $1)
C_LONGINT:C283(CUR_SaveRateChanges; $2)

//CW_SELECTDAY
C_POINTER:C301(CW_SelectDay; $1)

//CW_SETCALENDAR
C_DATE:C307(CW_SetCalendar; $1)
C_REAL:C285(CW_SetCalendar; $2)

//CW_SETDATE
C_DATE:C307(CW_SetDate; $1)

//CW_SETPREFS
C_LONGINT:C283(CW_SetPrefs; $1)
C_LONGINT:C283(CW_SetPrefs; $2)
C_LONGINT:C283(CW_SetPrefs; $3)

//Date_Button
C_POINTER:C301(Date_Button; $1)
C_LONGINT:C283(Date_Button; $2)

//Date_DDMMMYY
C_TEXT:C284(Date_DDMMMYY; $0)
C_DATE:C307(Date_DDMMMYY; $1)

//Date_DDMMYYSl
C_TEXT:C284(Date_DDMMYYSl; $0)
C_DATE:C307(Date_DDMMYYSl; $1)

//Date_Divider
C_TEXT:C284(Date_Divider; $0)

//Date_Format
C_LONGINT:C283(Date_Format; $0)
C_DATE:C307(Date_Format; $1)

//Date_FromNums
C_DATE:C307(Date_FromNums; $0)
C_LONGINT:C283(Date_FromNums; $1)
C_LONGINT:C283(Date_FromNums; $2)
C_LONGINT:C283(Date_FromNums; $3)

//Date_FromStrs
C_DATE:C307(Date_FromStrs; $0)
C_TEXT:C284(Date_FromStrs; $1)
C_TEXT:C284(Date_FromStrs; $2)
C_TEXT:C284(Date_FromStrs; $3)

//Date_MthCount
C_LONGINT:C283(Date_MthCount; $0)
C_DATE:C307(Date_MthCount; $1)
C_DATE:C307(Date_MthCount; $2)

//Date_Proper
C_DATE:C307(Date_Proper; $0)
C_LONGINT:C283(Date_Proper; $1)
C_LONGINT:C283(Date_Proper; $2)
C_LONGINT:C283(Date_Proper; $3)

//Date_SameDayNo
C_DATE:C307(Date_SameDayNo; $0)
C_DATE:C307(Date_SameDayNo; $1)
C_DATE:C307(Date_SameDayNo; $2)

//Date_Test2
C_TEXT:C284(Date_Test2; $1)

//Date_vButton
C_POINTER:C301(Date_vButton; $1)
C_LONGINT:C283(Date_vButton; $2)

//Date_YYMMDD
C_TEXT:C284(Date_YYMMDD; $0)
C_DATE:C307(Date_YYMMDD; $1)

//DATE_YYYYMMDD
C_TEXT:C284(Date_YYYYMMDD; $0)
C_DATE:C307(Date_YYYYMMDD; $1)

//DAYEND
C_TEXT:C284(DayEnd; $0)
C_DATE:C307(DayEnd; $1)

//DAYENDNUM
C_TEXT:C284(DayEndNum; $0)
C_LONGINT:C283(DayEndNum; $1)

//DAYNAME
C_TEXT:C284(DayName; $0)
C_DATE:C307(DayName; $1)

//DAYNAMENUM
C_TEXT:C284(DayNameNum; $0)
C_LONGINT:C283(DayNameNum; $1)

//DB_SaveRecord
C_POINTER:C301(DB_SaveRecord; $1)

//DBGETOSVERSION
C_TEXT:C284(DBGetOSVersion; $0)

//DB_4DWRITEMENU
C_LONGINT:C283(DB_4DwriteMenu; $1)
C_LONGINT:C283(DB_4DwriteMenu; $2)

//DB_ARRAYCALCULATOR
C_LONGINT:C283(DB_ArrayCalculator; $0)
C_POINTER:C301(DB_ArrayCalculator; ${3})
C_LONGINT:C283(DB_ArrayCalculator; $1)
C_LONGINT:C283(DB_ArrayCalculator; $2)

//DB_BLOB_TO_DATA
C_REAL:C285(DB_Blob_to_Data; $0)
C_POINTER:C301(DB_Blob_to_Data; $1)
C_POINTER:C301(DB_Blob_to_Data; $2)
C_REAL:C285(DB_Blob_to_Data; $3)
C_BOOLEAN:C305(DB_Blob_to_Data; $4)
C_REAL:C285(DB_Blob_to_Data; $5)

//DB_BOOT_MODE
C_BOOLEAN:C305(DB_Boot_Mode; $0)

//DB_BUILDSOUNDEX
C_TEXT:C284(DB_BuildSoundex; $0)
C_TEXT:C284(DB_BuildSoundex; $1)

//DB_CHECKMYUNIQUE
C_POINTER:C301(db_CheckMyUnique; $1)
C_LONGINT:C283(db_CheckMyUnique; $2)



//DB_CLOSERELATEDPROCESSES
C_LONGINT:C283(DB_CloseRelatedProcesses; $1)
C_LONGINT:C283(DB_CloseRelatedProcesses; $2)

//DB_COMPANYNAMECLEAN
C_TEXT:C284(DB_CompanyNameClean; $0)
C_TEXT:C284(DB_CompanyNameClean; $1)

//DB_CONTACTNAMECLEAN
C_TEXT:C284(DB_ContactNameClean; $0)
C_TEXT:C284(DB_ContactNameClean; $1)


//DB_DATACHECKSUBTABLEUNIQUE
C_LONGINT:C283(DB_DataCheckSubtableUnique; $1)
//C_REAL(DB_DataCheckSubtableUnique ;$2)

//DB_DATACHECKUNIQUE
C_LONGINT:C283(DB_Datacheckunique; $1)
C_LONGINT:C283(DB_Datacheckunique; $2)
C_LONGINT:C283(DB_Datacheckunique; $3)
C_LONGINT:C283(DB_Datacheckunique; $4)
C_BOOLEAN:C305(DB_Datacheckunique; $5)
C_BOOLEAN:C305(DB_Datacheckunique; $6)

//DB_DATA_TO_BLOB
C_POINTER:C301(DB_Data_to_Blob; $1)
C_POINTER:C301(DB_Data_to_Blob; $2)
C_LONGINT:C283(DB_Data_to_Blob; $3)

//DB_DEBUGON
C_LONGINT:C283(DB_DebugOn; $1)

//DB_DEDUPCOMPANY
C_TEXT:C284(DB_DeDupCompany; $0)
C_TEXT:C284(DB_DeDupCompany; $1)
C_POINTER:C301(DB_DeDupCompany; $2)
C_REAL:C285(DB_DeDupCompany; $3)
C_REAL:C285(DB_DeDupCompany; $4)

//DB_DEDUPCONTACT
C_TEXT:C284(DB_DeDupContact; $0)
C_TEXT:C284(DB_DeDupContact; $1)
C_POINTER:C301(DB_DeDupContact; $2)
C_POINTER:C301(DB_DeDupContact; $3)
C_TEXT:C284(DB_DeDupContact; $4)
C_REAL:C285(DB_DeDupContact; $5)
C_REAL:C285(DB_DeDupContact; $6)

//DB_DEVELOPER
C_BOOLEAN:C305(DB_Developer; $0)

//DB_DIRSYMBOL
C_TEXT:C284(DB_DirSymbol; $0)

//DB_DISABLETABLETRIGGER
C_POINTER:C301(DB_DisableTableTrigger; $1)

//DB_ENABLETABLETRIGGER
C_POINTER:C301(DB_EnableTableTrigger; $1)

//DB_FINDINDEXKEY
C_LONGINT:C283(DB_FindIndexKey; $0)
C_POINTER:C301(DB_FindIndexKey; $1)
C_LONGINT:C283(DB_FindIndexKey; $2)
C_TEXT:C284(DB_FindIndexKey; $3)
C_LONGINT:C283(DB_FindIndexKey; $4)

//DB_FINDVOLUMEFORSPACE
C_TEXT:C284(DB_FindVolumeForSpace; $0)
C_REAL:C285(DB_FindVolumeForSpace; $1)

//DB_GETADDRESS
C_TEXT:C284(DB_Getaddress; $0)
C_TEXT:C284(DB_Getaddress; $1)

//DB_GETCLIENTVERSION
C_TEXT:C284(DB_GetClientVersion; $0)

//DB_GETDEBUGINFO
C_TEXT:C284(DB_GetDebugInfo; $0)
C_TEXT:C284(DB_GetDebugInfo; $1)

//DB_GETPATHFROMSERVER
C_TEXT:C284(DB_GetPathFromServer; $0)
C_TEXT:C284(DB_GetPathFromServer; $1)

//DB_GETVOLUMEFROMPATH
C_TEXT:C284(DB_GetVolumeFromPath; $0)
C_TEXT:C284(DB_GetVolumeFromPath; $1)

//DB_HIGHASCIIFORMULA
C_BOOLEAN:C305(DB_HighAsciiFormula; $0)
C_POINTER:C301(DB_HighAsciiFormula; $1)
C_POINTER:C301(DB_HighAsciiFormula; $2)

//DB_INDEXING
C_BOOLEAN:C305(DB_Indexing; $0)

//DB_LOADDATACHECKPREFS
C_BOOLEAN:C305(DB_LoadDatacheckPrefs; $1)
C_TEXT:C284(DB_LoadDatacheckPrefs; $2)

//DB_LOADERRORTRACKPREFS
C_BOOLEAN:C305(DB_LoadErrorTrackPrefs; $1)
C_TEXT:C284(DB_LoadErrorTrackPrefs; $2)

//DB_LOCKFILE
C_POINTER:C301(DB_lockFile; $1)

//DB_MACINTOSH
//C_BOOLEAN(Is macOS;$0)

//DB_MENUACTION
C_TEXT:C284(DB_MenuAction; $1)
C_TEXT:C284(DB_MenuAction; $2)
C_LONGINT:C283(DB_MenuAction; $3)
C_TEXT:C284(DB_MenuAction; $4)
C_LONGINT:C283(DB_MenuAction; $5)
C_BOOLEAN:C305(DB_MenuAction; $6)

//DB_Process_Number
C_REAL:C285(DB_Process_Number; $0)
C_TEXT:C284(DB_Process_Number; $1)

//DB_Process_Started
C_BOOLEAN:C305(DB_Process_Started; $0)
C_TEXT:C284(DB_Process_Started; $1)
C_LONGINT:C283(DB_Process_Started; $2)
C_TEXT:C284(DB_Process_Started; $3)

//DB_PSEUDOUNIQUE
C_BOOLEAN:C305(DB_PseudoUnique; $0)
C_LONGINT:C283(DB_PseudoUnique; $1)
C_LONGINT:C283(DB_PseudoUnique; $2)

//DB_RECOVERNUMBER
C_LONGINT:C283(DB_RecoverNumber; $1)
C_LONGINT:C283(DB_RecoverNumber; $2)

//DB_REINDEXSUBTABLE
C_REAL:C285(DB_ReIndexSubtable; $1)
C_REAL:C285(DB_ReIndexSubtable; $2)

//DB_RESAVESUBRECORDS
C_REAL:C285(DB_ResaveSubrecords; $1)
C_REAL:C285(DB_ResaveSubrecords; $2)

//DB_SERVERSELECTPATH
C_TEXT:C284(DB_ServerSelectPath; $1)

//DB_SETALLTRIGGERS
C_LONGINT:C283(DB_SetAlltriggers; $1)

//DB_SETINDEX_P
C_POINTER:C301(DB_SetIndex_p; $1)

//DB_SOUNDEX
C_TEXT:C284(DB_Soundex; $0)
C_TEXT:C284(DB_Soundex; $1)

//DB_STRUCTUREFOLDER
C_TEXT:C284(DB_StructureFolder; $0)

//DB_TABLETRIGGERENABLED
C_BOOLEAN:C305(DB_TableTriggerEnabled; $0)
C_POINTER:C301(DB_TableTriggerEnabled; $1)

//DB_TESTING
C_BOOLEAN:C305(Db_Testing; $0)

//DB_TRIGGERUNIQUE
C_POINTER:C301(DB_TriggerUnique; $1)

//is windows
//C_BOOLEAN(Is Windows; $0)

//DECODEREF
C_TEXT:C284(DecodeRef; $0)
C_LONGINT:C283(DecodeRef; $1)

//DEI_CENTERWINDOW
C_LONGINT:C283(DEI_CenterWIndow; $1)
C_LONGINT:C283(DEI_CenterWIndow; $2)
C_LONGINT:C283(DEI_CenterWIndow; $3)
C_TEXT:C284(DEI_CenterWIndow; $4)
C_TEXT:C284(DEI_CenterWIndow; $5)
C_LONGINT:C283(DEI_CenterWIndow; $6)

//DEI_RECOVERDATA
C_LONGINT:C283(DEI_RecoverData; $0)
C_POINTER:C301(DEI_RecoverData; $1)
C_POINTER:C301(DEI_RecoverData; $2)

//DEI_REPORTCONFLICT4TABLE
C_BOOLEAN:C305(DEI_ReportConflict4Table; $0)
C_POINTER:C301(DEI_ReportConflict4Table; $1)
C_LONGINT:C283(DEI_ReportConflict4Table; $2)

//DEI_REPORTCONFLICTS
C_LONGINT:C283(DEI_ReportConflicts; $1)

//DEI_RESCUEDATA
C_LONGINT:C283(DEI_RescueData; $0)
C_POINTER:C301(DEI_RescueData; $1)

//DEI_RESCUEDTABLES2ARRAY
C_POINTER:C301(DEI_RescuedTables2Array; $1)
C_LONGINT:C283(DEI_RescuedTables2Array; $2)
C_POINTER:C301(DEI_RescuedTables2Array; $3)

//DEI_TABLENUM
C_LONGINT:C283(DEI_TableNum; $0)
C_TEXT:C284(DEI_TableNum; $1)

//DEI_TABLES2ARRAY
C_POINTER:C301(DEI_Tables2Array; $1)
C_LONGINT:C283(DEI_Tables2Array; $2)
C_POINTER:C301(DEI_Tables2Array; $3)

//DEI_TOOLS
C_LONGINT:C283(DEI_Tools; $1)

//DEI_VALIDATEDATA
C_POINTER:C301(DEI_ValidateData; $1)

//DELAYIFPROCESSRUNNING
C_TEXT:C284(DelayIfProcessRunning; $1)

//DELAYTICKS
C_REAL:C285(DelayTicks; $1)

//DEVELOPER
C_BOOLEAN:C305(Developer; $0)

//Diary_CalAct
C_LONGINT:C283(Diary_CalAct; $1)

//Diary_CalPer
C_TEXT:C284(Diary_CalPer; $0)
C_DATE:C307(Diary_CalPer; $1)
C_DATE:C307(Diary_CalPer; $2)
C_POINTER:C301(Diary_CalPer; $3)
C_POINTER:C301(Diary_CalPer; $4)
C_POINTER:C301(Diary_CalPer; $5)
C_POINTER:C301(Diary_CalPer; $6)
C_POINTER:C301(Diary_CalPer; $7)

//Diary_CalPic
C_PICTURE:C286(Diary_CalPic; $0)
C_TEXT:C284(Diary_CalPic; $1)
C_TEXT:C284(Diary_CalPic; $2)

//Diary_CheckSrch
C_BOOLEAN:C305(Diary_CheckSrch; $0)

//Diary_DateSrchR
C_LONGINT:C283(Diary_DateSrchR; $1)

//Diary_DiaryWT
C_TEXT:C284(Diary_DiaryWT; $0)

//Diary_Done
C_TEXT:C284(Diary_Done; $1)

//Diary_File
C_BOOLEAN:C305(Diary_File; $0)

//Diary_File2
C_BOOLEAN:C305(Diary_File2; $0)

//Diary_FileL
C_BOOLEAN:C305(Diary_FileL; $0)
C_LONGINT:C283(Diary_FileL; $1)

//Diary_HistFind
C_LONGINT:C283(Diary_HistFind; $0)
C_LONGINT:C283(Diary_HistFind; $1)

//Diary_In
C_TEXT:C284(Diary_In; $1)
C_TEXT:C284(Diary_In; $2)
C_TEXT:C284(Diary_In; $3)
C_TEXT:C284(Diary_In; $4)
C_TEXT:C284(Diary_In; $5)
C_TEXT:C284(Diary_In; $6)
C_TEXT:C284(Diary_In; $7)

//Diary_InEmail
C_TEXT:C284(Diary_InEmail; $1)
C_TEXT:C284(Diary_InEmail; $2)
C_TEXT:C284(Diary_InEmail; $3)
C_TEXT:C284(Diary_InEmail; $4)

//Diary_InL
C_TEXT:C284(Diary_InL; $1)
C_TEXT:C284(Diary_InL; $2)
C_TEXT:C284(Diary_InL; $3)
C_TEXT:C284(Diary_InL; $4)

//Diary_InLLPA
C_LONGINT:C283(Diary_InLLPA; $1)
C_TEXT:C284(Diary_InLLPA; $2)
C_BOOLEAN:C305(Diary_InLLPA; $3)

//Diary_InLPASeq
C_TEXT:C284(Diary_InLPASeq; $1)
C_BOOLEAN:C305(Diary_InLPASeq; $2)



//Diary_InLPX
C_POINTER:C301(Diary_InLPX; $1)
C_TEXT:C284(Diary_InLPX; $2)

//Diary_Mod_SD
C_TEXT:C284(Diary_Mod_SD; $1)

//Diary_PrintS
C_BOOLEAN:C305(Diary_PrintS; $0)
C_BOOLEAN:C305(Diary_PrintS; $1)
C_BOOLEAN:C305(Diary_PrintS; $2)

//Diary_RealMod
C_LONGINT:C283(Diary_RealMod; $1)

//Diary_Sel
C_TEXT:C284(Diary_Sel; $1)
C_BOOLEAN:C305(Diary_Sel; $2)

//Diary_SelDate
C_DATE:C307(Diary_SelDate; $0)
C_TEXT:C284(Diary_SelDate; $1)
C_BOOLEAN:C305(Diary_SelDate; $2)

//Diary_SelLP
C_LONGINT:C283(Diary_SelLP; $0)
C_LONGINT:C283(Diary_SelLP; $1)
C_LONGINT:C283(Diary_SelLP; $2)
C_LONGINT:C283(Diary_SelLP; $3)
C_POINTER:C301(Diary_SelLP; $4)
C_POINTER:C301(Diary_SelLP; $5)

//Diary_SelP
C_BOOLEAN:C305(Diary_SelP; $1)
C_LONGINT:C283(Diary_SelP; $2)
C_POINTER:C301(Diary_SelP; $3)
C_POINTER:C301(Diary_SelP; $4)

//Diary_SelPvs
C_BOOLEAN:C305(Diary_SelPvs; $1)

//Diary_TimeCheck
C_TEXT:C284(Diary_TimeCheck; $1)

//DIARYGETDAYVIEW
C_TEXT:C284(DiaryGetDayView; $1)
C_DATE:C307(DiaryGetDayView; $2)

//DIARY_PRINTOUT
C_TEXT:C284(Diary_PrintOut; $1)

//Directory_Symbol
C_TEXT:C284(Directory_Symbol; $0)

//DIVIDEBY
C_REAL:C285(DivideBy; $0)
C_REAL:C285(DivideBy; $1)
C_REAL:C285(DivideBy; $2)
C_LONGINT:C283(DivideBy; $3)

//DM_BKGETDBCONTACTCODE
C_TEXT:C284(DM_BKGetDBContactCode; $0)
C_LONGINT:C283(DM_BKGetDBContactCode; $1)
C_LONGINT:C283(DM_BKGetDBContactCode; $2)
C_TEXT:C284(DM_BKGetDBContactCode; $3)
C_TEXT:C284(DM_BKGetDBContactCode; $4)
C_REAL:C285(DM_BKGetDBContactCode; $5)

//DM_BKGETDBPRODUCTCODE
C_TEXT:C284(DM_BKGetDBProductCode; $0)
C_LONGINT:C283(DM_BKGetDBProductCode; $1)
C_LONGINT:C283(DM_BKGetDBProductCode; $2)
C_TEXT:C284(DM_BKGetDBProductCode; $3)
C_TEXT:C284(DM_BKGetDBProductCode; $4)
C_REAL:C285(DM_BKGetDBProductCode; $5)

//DM_CONVERTTYPES
C_TEXT:C284(DM_ConvertTypes; $1)
C_REAL:C285(DM_ConvertTypes; $2)
C_REAL:C285(DM_ConvertTypes; $3)
C_TEXT:C284(DM_ConvertTypes; $4)
C_REAL:C285(DM_ConvertTypes; $5)
C_REAL:C285(DM_ConvertTypes; $6)

//DM_CREATECOMPANY
C_LONGINT:C283(DM_CreateCompany; $1)
C_LONGINT:C283(DM_CreateCompany; $2)
C_TEXT:C284(DM_CreateCompany; $3)
C_POINTER:C301(DM_CreateCompany; $4)

//DM_CREATECONTACT
C_REAL:C285(DM_CreateContact; $1)
C_REAL:C285(DM_CreateContact; $2)
C_TEXT:C284(DM_CreateContact; $3)
C_TEXT:C284(DM_CreateContact; $4)
C_POINTER:C301(DM_CreateContact; $5)
C_POINTER:C301(DM_CreateContact; $6)

//DM_CREATEORDER
C_REAL:C285(DM_CreateOrder; $1)
C_LONGINT:C283(DM_CreateOrder; $2)
C_TEXT:C284(DM_CreateOrder; $3)
C_TEXT:C284(DM_CreateOrder; $4)
C_POINTER:C301(DM_CreateOrder; $5)

//DM_CREATEPRODUCT
C_REAL:C285(DM_CreateProduct; $1)
C_REAL:C285(DM_CreateProduct; $2)
C_TEXT:C284(DM_CreateProduct; $3)
C_TEXT:C284(DM_CreateProduct; $4)
C_POINTER:C301(DM_CreateProduct; $5)

//DM_GETBKDATA
C_LONGINT:C283(DM_GetBKData; $1)
C_TEXT:C284(DM_GetBKData; $2)
C_POINTER:C301(DM_GetBKData; $3)
C_POINTER:C301(DM_GetBKData; $4)

//DM_GETBKSETTINGS
C_POINTER:C301(DM_GetBKSettings; $1)
C_POINTER:C301(DM_GetBKSettings; $2)
C_POINTER:C301(DM_GetBKSettings; $3)
C_POINTER:C301(DM_GetBKSettings; $4)
C_POINTER:C301(DM_GetBKSettings; $5)
C_POINTER:C301(DM_GetBKSettings; $6)
C_LONGINT:C283(DM_GetBKSettings; $7)

//DM_GETMODELCONTEXT
C_LONGINT:C283(DM_GetModelContext; $0)
C_LONGINT:C283(DM_GetModelContext; $1)

//DM_HANDLEBKCUSDATA
C_REAL:C285(DM_HandleBKCUSDATA; $1)
C_REAL:C285(DM_HandleBKCUSDATA; $2)
C_TEXT:C284(DM_HandleBKCUSDATA; $3)
C_POINTER:C301(DM_HandleBKCUSDATA; $4)
C_POINTER:C301(DM_HandleBKCUSDATA; $5)

//DM_HANDLEBKITMDATA
C_REAL:C285(DM_HandleBKITMDATA; $1)
C_TEXT:C284(DM_HandleBKITMDATA; $2)
C_POINTER:C301(DM_HandleBKITMDATA; $3)
C_POINTER:C301(DM_HandleBKITMDATA; $4)

//DM_HANDLEBKORDDATA
C_REAL:C285(DM_HandleBKORDDATA; $0)
C_REAL:C285(DM_HandleBKORDDATA; $1)
C_REAL:C285(DM_HandleBKORDDATA; $2)
C_TEXT:C284(DM_HandleBKORDDATA; $3)
C_POINTER:C301(DM_HandleBKORDDATA; $4)
C_POINTER:C301(DM_HandleBKORDDATA; $5)

//DM_MODIFYCOMPANY
C_TEXT:C284(DM_ModifyCompany; $1)
C_LONGINT:C283(DM_ModifyCompany; $2)
C_LONGINT:C283(DM_ModifyCompany; $3)
C_TEXT:C284(DM_ModifyCompany; $4)
C_TEXT:C284(DM_ModifyCompany; $5)

//DM_MODIFYCONTACT
C_TEXT:C284(DM_ModifyContact; $1)
C_TEXT:C284(DM_ModifyContact; $2)
C_REAL:C285(DM_ModifyContact; $3)
C_REAL:C285(DM_ModifyContact; $4)
C_TEXT:C284(DM_ModifyContact; $5)
C_TEXT:C284(DM_ModifyContact; $6)
C_LONGINT:C283(DM_ModifyContact; $7)

//DM_OPTIONSETTINGSTOSCREEN
C_LONGINT:C283(DM_OptionSettingsToScreen; $1)
C_LONGINT:C283(DM_OptionSettingsToScreen; $2)

//DM_SCREENTOOPTIONS
C_REAL:C285(DM_ScreentoOptions; $1)

//DM_SETBKRECORD
C_LONGINT:C283(DM_SetBKRecord; $1)
C_TEXT:C284(DM_SetBKRecord; $2)
C_POINTER:C301(DM_SetBKRecord; $3)
C_POINTER:C301(DM_SetBKRecord; $4)
C_POINTER:C301(DM_SetBKRecord; $5)
C_POINTER:C301(DM_SetBKRecord; $6)

//DM_SETCONTACTDEFAULTS
C_REAL:C285(DM_SetContactDefaults; $1)
C_TEXT:C284(DM_SetContactDefaults; $2)
C_TEXT:C284(DM_SetContactDefaults; $3)

//DM_SETCONTACTFIELDS
C_TEXT:C284(DM_SetContactFields; $1)
C_TEXT:C284(DM_SetContactFields; $2)

//DM_SETFILEPATH
C_TEXT:C284(DM_SetFilePath; $0)
C_TEXT:C284(DM_SetFilePath; $1)
C_TEXT:C284(DM_SetFilePath; $2)

//DM_SETNEXTTIME
C_LONGINT:C283(DM_SetNextTime; $0)
C_DATE:C307(DM_SetNextTime; $1)
C_LONGINT:C283(DM_SetNextTime; $2)
C_LONGINT:C283(DM_SetNextTime; $3)
C_TEXT:C284(DM_SetNextTime; $4)

//DM_SETORDERDEFAULTS
C_REAL:C285(DM_SetOrderDefaults; $1)
C_TEXT:C284(DM_SetOrderDefaults; $2)
C_TEXT:C284(DM_SetOrderDefaults; $3)
C_TEXT:C284(DM_SetOrderDefaults; $4)

//DM_SETORDERSTATE
C_POINTER:C301(DM_SetOrderState; $1)

//DM_SETPRODUCTDEFAULTS
C_TEXT:C284(DM_SetProductDefaults; $1)
C_TEXT:C284(DM_SetProductDefaults; $2)
C_TEXT:C284(DM_SetProductDefaults; $3)



//DM_SETSTATEFUNCTION
C_TEXT:C284(DM_SetStateFunction; $0)
C_TEXT:C284(DM_SetStateFunction; $1)

//DM_VALIDATE
C_BOOLEAN:C305(DM_Validate; $0)
C_LONGINT:C283(DM_Validate; $1)
C_LONGINT:C283(DM_Validate; $2)
C_LONGINT:C283(DM_Validate; $3)
C_LONGINT:C283(DM_Validate; $4)
C_TEXT:C284(DM_Validate; $5)
C_TEXT:C284(DM_Validate; $6)
C_POINTER:C301(DM_Validate; $7)
C_POINTER:C301(DM_Validate; $8)

//DM_VALIDATECOMPANYCODE
C_TEXT:C284(DM_ValidateCompanyCode; $0)
C_LONGINT:C283(DM_ValidateCompanyCode; $1)
C_LONGINT:C283(DM_ValidateCompanyCode; $2)
C_TEXT:C284(DM_ValidateCompanyCode; $3)

//DM_VALIDATECONTACT
C_BOOLEAN:C305(DM_ValidateContact; $0)
C_LONGINT:C283(DM_ValidateContact; $1)
C_LONGINT:C283(DM_ValidateContact; $2)
C_LONGINT:C283(DM_ValidateContact; $3)
C_TEXT:C284(DM_ValidateContact; $4)
C_TEXT:C284(DM_ValidateContact; $5)
C_POINTER:C301(DM_ValidateContact; $6)
C_POINTER:C301(DM_ValidateContact; $7)

//DM_VALIDATECONTACTCODE
C_TEXT:C284(DM_ValidateContactCode; $0)
C_LONGINT:C283(DM_ValidateContactCode; $1)
C_LONGINT:C283(DM_ValidateContactCode; $2)
C_TEXT:C284(DM_ValidateContactCode; $3)
C_POINTER:C301(DM_ValidateContactCode; $4)

//DM_VALIDATECONTRACT
C_TEXT:C284(DM_ValidateContract; $0)
C_LONGINT:C283(DM_ValidateContract; $1)
C_LONGINT:C283(DM_ValidateContract; $2)
C_TEXT:C284(DM_ValidateContract; $3)


//DM_VALIDATEINVOICENUMBER
C_TEXT:C284(DM_ValidateInvoiceNumber; $0)
C_LONGINT:C283(DM_ValidateInvoiceNumber; $1)
C_LONGINT:C283(DM_ValidateInvoiceNumber; $2)
C_TEXT:C284(DM_ValidateInvoiceNumber; $3)

//DM_VALIDATEJOB
C_TEXT:C284(DM_ValidateJob; $0)
C_LONGINT:C283(DM_ValidateJob; $1)
C_LONGINT:C283(DM_ValidateJob; $2)
C_TEXT:C284(DM_ValidateJob; $3)

//DM_VALIDATEJOBSTAGE
C_TEXT:C284(DM_ValidateJobStage; $0)
C_LONGINT:C283(DM_ValidateJobStage; $1)
C_LONGINT:C283(DM_ValidateJobStage; $2)
C_TEXT:C284(DM_ValidateJobStage; $3)
C_POINTER:C301(DM_ValidateJobStage; $4)

//DM_VALIDATEORDER
C_BOOLEAN:C305(DM_ValidateOrder; $0)
C_LONGINT:C283(DM_ValidateOrder; $1)
C_LONGINT:C283(DM_ValidateOrder; $2)
C_LONGINT:C283(DM_ValidateOrder; $3)
C_TEXT:C284(DM_ValidateOrder; $4)
C_TEXT:C284(DM_ValidateOrder; $5)

//DM_VALIDATEPONUMBER
C_TEXT:C284(DM_ValidatePONumber; $0)
C_LONGINT:C283(DM_ValidatePONumber; $1)
C_LONGINT:C283(DM_ValidatePONumber; $2)
C_TEXT:C284(DM_ValidatePONumber; $3)

//DM_VALIDATEPRODUCT
C_BOOLEAN:C305(DM_ValidateProduct; $0)
C_LONGINT:C283(DM_ValidateProduct; $1)
C_LONGINT:C283(DM_ValidateProduct; $2)
C_LONGINT:C283(DM_ValidateProduct; $3)
C_TEXT:C284(DM_ValidateProduct; $4)
C_TEXT:C284(DM_ValidateProduct; $5)
C_POINTER:C301(DM_ValidateProduct; $6)

//DM_VALIDATEPRODUCTCODE
C_TEXT:C284(DM_ValidateProductCode; $0)
C_LONGINT:C283(DM_ValidateProductCode; $1)
C_LONGINT:C283(DM_ValidateProductCode; $2)
C_TEXT:C284(DM_ValidateProductCode; $3)
C_TEXT:C284(DM_ValidateProductCode; $4)

//DM_VALIDORDERCODE
C_TEXT:C284(DM_ValidOrderCode; $0)
C_LONGINT:C283(DM_ValidOrderCode; $1)
C_LONGINT:C283(DM_ValidOrderCode; $2)
C_TEXT:C284(DM_ValidOrderCode; $3)

//DOCIMPORTSUBRECORDS
C_TEXT:C284(DocImportSubRecords; $1)
C_LONGINT:C283(DocImportSubRecords; $2)
C_LONGINT:C283(DocImportSubRecords; $3)
C_TEXT:C284(DocImportSubRecords; $4)
C_TEXT:C284(DocImportSubRecords; $5)
C_TEXT:C284(DocImportSubRecords; $6)

//DOCNAMEFROMPATH
C_TEXT:C284(DocNameFromPath; $0)
C_TEXT:C284(DocNameFromPath; $1)

//DOCUMENTLIST
C_LONGINT:C283(DocumentList; $0)
C_TEXT:C284(DocumentList; $1)
C_POINTER:C301(DocumentList; $2)
C_LONGINT:C283(DocumentList; $3)
C_LONGINT:C283(DocumentList; $4)
C_LONGINT:C283(DocumentList; $5)
C_LONGINT:C283(DocumentList; $6)

//DOCUMENTNAMECREATE
C_TEXT:C284(DocumentNamecreate; $0)
C_TEXT:C284(DocumentNamecreate; $1)

//DOC_EMAILCHOICES
C_LONGINT:C283(DOC_EmailChoices; $1)
C_LONGINT:C283(DOC_EmailChoices; $2)
C_LONGINT:C283(DOC_EmailChoices; $3)
C_LONGINT:C283(DOC_EmailChoices; $4)

//DOC_SETWRITEMODIFIABLE
C_LONGINT:C283(DOC_SetWriteModifiable; $1)
C_LONGINT:C283(DOC_SetWriteModifiable; $2)
C_BOOLEAN:C305(DOC_SetWriteModifiable; $3)

//DS_ATTACHMENTFROMSUBDIRECTORY
C_BOOLEAN:C305(DS_AttachmentFromSubDirectory; $0)
C_TEXT:C284(DS_AttachmentFromSubDirectory; $1)
C_TEXT:C284(DS_AttachmentFromSubDirectory; $2)
C_BOOLEAN:C305(DS_AttachmentFromSubDirectory; $3)
C_BOOLEAN:C305(DS_AttachmentFromSubDirectory; $4)
C_BOOLEAN:C305(DS_AttachmentFromSubDirectory; $5)

//DS_ATTACHMENTTOBLOB
C_TEXT:C284(DS_attachmenttoBLOB; $1)
C_TEXT:C284(DS_attachmenttoBLOB; $2)

//DS_CHECKNAMEWITHEXTENSION
C_TEXT:C284(DS_CheckNameWithExtension; $0)
C_TEXT:C284(DS_CheckNameWithExtension; $1)
C_TEXT:C284(DS_CheckNameWithExtension; $2)
C_POINTER:C301(DS_CheckNameWithExtension; $3)
C_POINTER:C301(DS_CheckNameWithExtension; $4)

//DS_DOCSTOSERVER
C_LONGINT:C283(DS_DocstoServer; $1)

//DS_GETDOCUMENTFOLDER
C_TEXT:C284(DS_GetDocumentFolder; $0)
C_TEXT:C284(DS_GetDocumentFolder; $1)

//DS_GETFILEMAP
C_POINTER:C301(DS_GETFILEMAP; $1)
C_POINTER:C301(DS_GETFILEMAP; $2)

//DS_GETFILETYPE
C_TEXT:C284(DS_GetFiletype; $1)
C_POINTER:C301(DS_GetFiletype; $2)
C_POINTER:C301(DS_GetFiletype; $3)

//DS_GETPICTUREFROMDRIVE
C_TEXT:C284(DS_GetPicturefromDrive; $0)
C_TEXT:C284(DS_GetPicturefromDrive; $1)
C_REAL:C285(DS_GetPicturefromDrive; $2)
C_TEXT:C284(DS_GetPicturefromDrive; $3)
C_TEXT:C284(DS_GetPicturefromDrive; $4)
C_TEXT:C284(DS_GetPicturefromDrive; $5)
C_TEXT:C284(DS_GetPicturefromDrive; $6)

//DS_LOADPICTURESTOARRAY
C_REAL:C285(DS_LoadPicturesToArray; $0)
C_TEXT:C284(DS_LoadPicturesToArray; $1)
C_POINTER:C301(DS_LoadPicturesToArray; $2)
C_POINTER:C301(DS_LoadPicturesToArray; $3)

//DS_MAKETEMPLATEFROMDOCUMENT
C_TEXT:C284(DS_MakeTemplateFromDocument; $1)

//DS_PICKUPDOCS
C_LONGINT:C283(DS_PickupDocs; $1)
C_TEXT:C284(DS_PickupDocs; $2)

//DS_PICTURESTOSERVER
C_LONGINT:C283(DS_Picturestoserver; $1)
C_TEXT:C284(DS_Picturestoserver; $2)
C_LONGINT:C283(DS_Picturestoserver; $3)
C_TEXT:C284(DS_Picturestoserver; $4)
C_TEXT:C284(DS_Picturestoserver; $5)

//DS_RESOLVEDPICTURENAME
C_TEXT:C284(DS_ResolvedPictureName; $0)
C_TEXT:C284(DS_ResolvedPictureName; $1)

//DS_SENDPICTURETODRIVE
C_TEXT:C284(DS_SendPicturetoDrive; $1)
C_LONGINT:C283(DS_SendPicturetoDrive; $2)
C_TEXT:C284(DS_SendPicturetoDrive; $3)
C_POINTER:C301(DS_SendPicturetoDrive; $4)

//DYNAMIC_SUITE
C_REAL:C285(DYNAMIC_SUITE; $1)

//DYNAMIC_TEXTMODIFY
C_TEXT:C284(DYNAMIC_TEXTMODIFY; $0)
C_LONGINT:C283(DYNAMIC_TEXTMODIFY; $1)
C_TEXT:C284(DYNAMIC_TEXTMODIFY; $2)

//DYNAMIC_TEXTMODIFY2
C_TEXT:C284(DYNAMIC_TEXTMODIFY2; $0)
C_LONGINT:C283(DYNAMIC_TEXTMODIFY2; $1)
C_TEXT:C284(DYNAMIC_TEXTMODIFY2; $2)

//DYNAMIC_TEXTMODIFY3


//Email_Attachment_From_Server
C_TEXT:C284(Email_Attachment_From_Server; $0)
C_TEXT:C284(Email_Attachment_From_Server; $1)
C_TEXT:C284(Email_Attachment_From_Server; $2)

//EMAIL_ON_OUTSIDE_CALL
C_BOOLEAN:C305(EMAIL_ON_OUTSIDE_CALL; $1)

//EMAILADDRESSUPDATE
C_BOOLEAN:C305(EmailAddressUpdate; $1)
C_LONGINT:C283(EmailAddressUpdate; $2)
C_LONGINT:C283(EmailAddressUpdate; $3)

//EMAILCHECKPDFWRITER
C_LONGINT:C283(EmailCheckPDFWriter; $0)
C_REAL:C285(EmailCheckPDFWriter; $1)

//EMAIL_SAVEATTACHMENTS
C_POINTER:C301(EMail_SaveAttachments; $1)
C_POINTER:C301(EMail_SaveAttachments; $2)
C_POINTER:C301(EMail_SaveAttachments; $3)
C_POINTER:C301(EMail_SaveAttachments; $4)
C_LONGINT:C283(EMail_SaveAttachments; $5)
C_TEXT:C284(EMail_SaveAttachments; $6)
C_LONGINT:C283(EMail_SaveAttachments; $7)

//EMAIL_SEND
C_TEXT:C284(Email_Send; $0)
C_POINTER:C301(Email_Send; $1)
C_POINTER:C301(Email_Send; $2)
C_POINTER:C301(Email_Send; $3)
C_TEXT:C284(Email_Send; $4)
C_TEXT:C284(Email_Send; $5)
C_TEXT:C284(Email_Send; $6)
C_TEXT:C284(Email_Send; $7)
C_POINTER:C301(Email_Send; $8)
C_POINTER:C301(Email_Send; $9)
C_BOOLEAN:C305(Email_Send; $10)
C_TEXT:C284(Email_Send; $11)
C_TEXT:C284(Email_Send; $12)
C_TEXT:C284(Email_Send; $13)
C_TEXT:C284(Email_Send; $14)

//Error_MessGen
C_TEXT:C284(Error_MessGen; $1)

//Error_MessIM
C_TEXT:C284(Error_MessIM; $1)
C_LONGINT:C283(Error_MessIM; $2)

//ERRORDEBUG_LOGVIEW
C_TEXT:C284(ErrorDebug_logview; $1)

//ERRORS_TCP
C_TEXT:C284(Errors_TCP; $0)
C_REAL:C285(Errors_TCP; $1)

//ERR_GETDATACHANGES
C_TEXT:C284(ERR_GetDataChanges; $0)

//ERR_GETTRACKING
C_TEXT:C284(ERR_GetTracking; $0)

//ERR_METHODTRACKER
C_TEXT:C284(ERR_MethodTracker; $0)
C_TEXT:C284(ERR_MethodTracker; $1)
C_REAL:C285(ERR_MethodTracker; $2)

//ERR_METHODTRACKERRETURN
C_TEXT:C284(ERR_MethodTrackerReturn; $1)
C_TEXT:C284(ERR_MethodTrackerReturn; $2)



//EW_4DBKC_TOOLSDATA
C_TEXT:C284(EW_4dBKC_ToolsData; $0)
C_TEXT:C284(EW_4dBKC_ToolsData; $1)
C_TEXT:C284(EW_4dBKC_ToolsData; $2)
C_POINTER:C301(EW_4dBKC_ToolsData; $3)
C_POINTER:C301(EW_4dBKC_ToolsData; $4)

//EW_ADDPICTURENAME2ARRAY
C_TEXT:C284(EW_AddPictureName2Array; $1)
C_TEXT:C284(EW_AddPictureName2Array; $2)

//EW_ARRAYSSETUP
C_TEXT:C284(EW_ArraysSetup; $1)

//EW_BKALLARRAYS
C_LONGINT:C283(EW_BKAllArrays; $1)

//EW_BKFIELDMAPARRAYS
C_LONGINT:C283(EW_BKFieldMapArrays; $1)
C_TEXT:C284(EW_BKFieldMapArrays; $2)
C_TEXT:C284(EW_BKFieldMapArrays; $3)

//EW_BKFIELDMAPCREATE
C_REAL:C285(EW_BKfieldMapCreate; $1)
C_REAL:C285(EW_BKfieldMapCreate; $2)

//EW_BKGETKEYFIELDINFO
C_TEXT:C284(EW_BKGetKeyFieldInfo; $1)

//EW_CURRENTSELECTION
C_POINTER:C301(EW_CurrentSelection; $1)

//EW_DATEFIELDPOINTER
C_POINTER:C301(EW_DateFieldPointer; $0)
C_POINTER:C301(EW_DateFieldPointer; $1)

//EW_DELETESTEP
C_LONGINT:C283(EW_DeleteStep; $1)

//EW_DISPLAYSTEP
C_LONGINT:C283(EW_DisplayStep; $1)

//EW_DROPEVENT
C_POINTER:C301(EW_DropEvent; $1)

//EW_ENTRYOPTIONS
C_REAL:C285(EW_EntryOptions; $1)
C_TEXT:C284(EW_EntryOptions; $2)

//EW_ERRORHANDLING
C_BOOLEAN:C305(EW_ErrorHandling; $1)

//EW_ERRORMESSAGES
C_TEXT:C284(EW_ErrorMessages; $0)
C_TEXT:C284(EW_ErrorMessages; $1)

//EW_EXPORTBKFIELDARRAYS
C_BOOLEAN:C305(EW_ExportBKfieldArrays; $0)

//EW_EXPORTDETAILS
C_POINTER:C301(EW_ExportDetails; $1)

//EW_EXPORTNOW
C_LONGINT:C283(EW_ExportNow; $1)
C_TEXT:C284(EW_ExportNow; $2)

//EW_EXPORTNOWSTEPS
C_TEXT:C284(EW_ExportNowSteps; $0)

//EW_EXPORTSUBFIELDS
C_TEXT:C284(EW_ExportSubfields; $0)

//EW_FIELDARRAYS
C_LONGINT:C283(EW_FieldArrays; $1)
C_LONGINT:C283(EW_FieldArrays; $2)

//EW_FIELDMAPSAVE
C_BOOLEAN:C305(EW_FieldMapSave; $0)
C_LONGINT:C283(EW_FieldMapSave; $1)

//EW_FINDFIELDNAME
C_TEXT:C284(EW_FindFieldName; $0)
C_TEXT:C284(EW_FindFieldName; $1)

//EW_GETSUBFIELDDATA
C_TEXT:C284(EW_GetSubfieldData; $0)
C_LONGINT:C283(EW_GetSubfieldData; $1)
C_LONGINT:C283(EW_GetSubfieldData; $2)
C_LONGINT:C283(EW_GetSubfieldData; $3)

//EW_GETSUBTABLEPOINTER
C_POINTER:C301(EW_GetSubTablePointer; $0)
C_LONGINT:C283(EW_GetSubTablePointer; $1)
C_LONGINT:C283(EW_GetSubTablePointer; $2)

//EW_INSERTELEMENTS
C_TEXT:C284(EW_InsertElements; $1)
C_TEXT:C284(EW_InsertElements; $2)
C_REAL:C285(EW_InsertElements; $3)
C_REAL:C285(EW_InsertElements; $4)
C_REAL:C285(EW_InsertElements; $5)
C_TEXT:C284(EW_InsertElements; $6)
C_REAL:C285(EW_InsertElements; $7)
C_REAL:C285(EW_InsertElements; $8)
C_LONGINT:C283(EW_InsertElements; $9)
C_TEXT:C284(EW_InsertElements; $10)

//EW_NUMERICFIELDARRAYS
C_LONGINT:C283(EW_NumericFieldArrays; $1)
C_LONGINT:C283(EW_NumericFieldArrays; $2)
C_LONGINT:C283(EW_NumericFieldArrays; $3)

//EW_PICTURESETUP
C_LONGINT:C283(EW_PictureSetup; $1)

//EW_RESULTREPORT
C_TEXT:C284(EW_ResultReport; $1)
C_TEXT:C284(EW_ResultReport; $2)
C_TEXT:C284(EW_ResultReport; $3)
C_BOOLEAN:C305(EW_ResultReport; $4)

//EW_SENDPACKET
C_POINTER:C301(EW_SendPacket; $1)

//EW_SUBRECORDFIELDNAMES
C_REAL:C285(EW_SubRecordFieldNames; $1)
C_REAL:C285(EW_SubRecordFieldNames; $2)

//EW_TESTBKCONNECTION
C_TEXT:C284(EW_TestBkconnection; $1)
C_LONGINT:C283(EW_TestBkconnection; $2)

//EW_VALIDATE
C_BOOLEAN:C305(EW_Validate; $0)

//Execute_File
C_BOOLEAN:C305(Execute_File; $0)
C_TEXT:C284(Execute_File; $1)

//Execute_Sel
C_TEXT:C284(Execute_Sel; $1)
C_TEXT:C284(Execute_Sel; $2)
C_BOOLEAN:C305(Execute_Sel; $3)


//Export_Stamp
C_TEXT:C284(Export_Stamp; $0)

//Export_Stamp2
C_TEXT:C284(Export_Stamp2; $0)
C_TEXT:C284(Export_Stamp2; $1)

//Export_Stamp3
C_TEXT:C284(Export_Stamp3; $0)
C_TEXT:C284(Export_Stamp3; $1)

//Fax_FEStartM1
C_LONGINT:C283(Fax_FEStartM1; $0)
C_TEXT:C284(Fax_FEStartM1; $1)

//Fax_SPEnd
C_TEXT:C284(Fax_SPEnd; $1)

//Fax_SPEndM2
C_TEXT:C284(Fax_SPEndM2; $1)

//Fax_SPHandleErr
C_BOOLEAN:C305(Fax_SPHandleErr; $0)
C_LONGINT:C283(Fax_SPHandleErr; $1)

//Fax_SPSetup
C_BOOLEAN:C305(Fax_SPSetup; $0)

//Fax_SPStart
C_LONGINT:C283(Fax_SPStart; $0)
C_TEXT:C284(Fax_SPStart; $1)
C_TEXT:C284(Fax_SPStart; $2)
C_TEXT:C284(Fax_SPStart; $3)
C_TEXT:C284(Fax_SPStart; $4)

//Fax_SPStartM1
C_LONGINT:C283(Fax_SPStartM1; $0)
C_TEXT:C284(Fax_SPStartM1; $1)

//Fax_SPStartM2
C_LONGINT:C283(Fax_SPStartM2; $0)
C_TEXT:C284(Fax_SPStartM2; $1)
C_TEXT:C284(Fax_SPStartM2; $2)
C_TEXT:C284(Fax_SPStartM2; $3)
C_TEXT:C284(Fax_SPStartM2; $4)

//Fax_SPSubject
C_TEXT:C284(Fax_SPSubject; $0)
C_TEXT:C284(Fax_SPSubject; $1)

//Fax_StartM2
C_LONGINT:C283(Fax_StartM2; $0)
C_TEXT:C284(Fax_StartM2; $1)
C_TEXT:C284(Fax_StartM2; $2)
C_TEXT:C284(Fax_StartM2; $3)

//Feet_to_Dec
C_REAL:C285(Feet_to_Dec; $0)
C_TEXT:C284(Feet_to_Dec; $1)

//FIELDDATATOTEXT
C_TEXT:C284(FieldDataToText; $0)
C_POINTER:C301(FieldDataToText; $1)

//FIELDTYPE2TEXT
C_TEXT:C284(FieldType2Text; $0)
C_LONGINT:C283(FieldType2Text; $1)

//FILENAMEFROMPATH
C_TEXT:C284(FileNamefromPath; $0)
C_TEXT:C284(FileNamefromPath; $1)

//FILTEROUTSOFTDELETIONS
C_POINTER:C301(FilterOutSoftDeletions; $1)

//FINDINDEXKEY
C_LONGINT:C283(FindIndexKey; $0)
C_POINTER:C301(FindIndexKey; $1)
C_POINTER:C301(FindIndexKey; $2)

//First_Field
C_TEXT:C284(First_Field; $0)
C_POINTER:C301(First_Field; $1)
C_TEXT:C284(First_Field; $2)

//First_Field2
C_TEXT:C284(First_Field2; $0)
C_TEXT:C284(First_Field2; $1)
C_TEXT:C284(First_Field2; $2)
C_TEXT:C284(First_Field2; $3)
C_TEXT:C284(First_Field2; $4)

//First_FieldPtr
C_POINTER:C301(First_FieldPtr; $1)
C_TEXT:C284(First_FieldPtr; $2)
C_POINTER:C301(First_FieldPtr; $3)

//First_Fieldx
C_TEXT:C284(First_Fieldx; $0)
C_POINTER:C301(First_Fieldx; $1)
C_TEXT:C284(First_Fieldx; $2)

//First_Param
C_TEXT:C284(First_Param; $0)
C_TEXT:C284(First_Param; $1)

//First_Tab
C_TEXT:C284(First_Tab; $0)
C_TEXT:C284(First_Tab; $1)

//First_Tab2
C_TEXT:C284(First_Tab2; $0)
C_TEXT:C284(First_Tab2; $1)

//FIRSTLETTERS
C_TEXT:C284(FirstLetters; $0)
C_TEXT:C284(FirstLetters; $1)

//FIRSTLETTERWORD
C_TEXT:C284(FirstLetterWord; $0)
C_TEXT:C284(FirstLetterWord; $1)

//FIRSTWORD
C_TEXT:C284(FirstWord; $0)
C_TEXT:C284(FirstWord; $1)

//FIXZEROIDSFROMUNIQUEFIELDS
C_LONGINT:C283(FixZeroIDsFromUniqueFields; $1)

//FIX_VATPERIODCODE
C_TEXT:C284(FIX_VATPERIODCODE; $1)
C_BOOLEAN:C305(FIX_VATPERIODCODE; $2)

//Form_SRArray
C_LONGINT:C283(Form_SRArray; $1)

//Form_SRArrIns
C_LONGINT:C283(Form_SRArrIns; $1)

//Form_SROK
C_BOOLEAN:C305(Form_SROK; $0)
C_TEXT:C284(Form_SROK; $1)

//Form_SRProOK
C_BOOLEAN:C305(Form_SRProOK; $0)
C_TEXT:C284(Form_SRProOK; $1)
C_TEXT:C284(Form_SRProOK; $2)

//Form_vT
C_BOOLEAN:C305(Form_vT; $1)
C_TEXT:C284(Form_vT; $2)

//FORMITEMCOMM
C_TEXT:C284(FormItemComm; $0)

//FORMITEMVT
C_TEXT:C284(FormItemvT; $0)

//Forms_GenTit
C_POINTER:C301(Forms_GenTit; $1)
C_POINTER:C301(Forms_GenTit; $2)

//Forms_Tit567Cur
C_TEXT:C284(Forms_Tit567Cur; $1)

//FSETTINGS_LOADPREFERENCES
C_TEXT:C284(FSettings_loadPreferences; $1)

//FSETTING_SAVEPREFERENCES
C_TEXT:C284(FSetting_savePreferences; $1)
C_POINTER:C301(FSetting_savePreferences; $2)
C_POINTER:C301(FSetting_savePreferences; $3)
C_POINTER:C301(FSetting_savePreferences; $4)
C_POINTER:C301(FSetting_savePreferences; $5)
C_POINTER:C301(FSetting_savePreferences; $6)
C_POINTER:C301(FSetting_savePreferences; $7)
C_POINTER:C301(FSetting_savePreferences; $8)

//FSETTING_SETLABEL
C_TEXT:C284(FSetting_SetLabel; $1)

//FSETTING_UPDATEARRAY
C_TEXT:C284(FSetting_UpdateArray; $1)
C_LONGINT:C283(FSetting_UpdateArray; $2)
C_LONGINT:C283(FSetting_UpdateArray; $3)
C_LONGINT:C283(FSetting_UpdateArray; $4)
C_TEXT:C284(FSetting_UpdateArray; $5)
C_TEXT:C284(FSetting_UpdateArray; $6)
C_TEXT:C284(FSetting_UpdateArray; $7)

//FS_SETFORMSORT
C_TEXT:C284(FS_SetFormSort; $1)
C_LONGINT:C283(FS_SetFormSort; $2)
C_REAL:C285(FS_SetFormSort; $3)
C_POINTER:C301(FS_SetFormSort; $4)
C_TEXT:C284(FS_SetFormSort; $5)

//FurthFld_ArF1
C_POINTER:C301(FurthFld_ArF1; $1)
C_TEXT:C284(FurthFld_ArF1; $2)

//FurthFld_Arr
C_LONGINT:C283(FurthFld_Arr; $1)

//FurthFld_Creat2
C_TEXT:C284(FurthFld_Creat2; $0)
C_TEXT:C284(FurthFld_Creat2; $1)
C_TEXT:C284(FurthFld_Creat2; $2)
C_TEXT:C284(FurthFld_Creat2; $3)
C_TEXT:C284(FurthFld_Creat2; $4)

//FurthFld_Create
C_TEXT:C284(FurthFld_Create; $1)
C_TEXT:C284(FurthFld_Create; $2)
C_TEXT:C284(FurthFld_Create; $3)
C_TEXT:C284(FurthFld_Create; $4)

//CustomFields_Delete
C_POINTER:C301(CustomFields_Delete; $1)

//FurthFld_Find
C_LONGINT:C283(FurthFld_Find; $0)
C_TEXT:C284(FurthFld_Find; $1)
C_TEXT:C284(FurthFld_Find; $2)
C_TEXT:C284(FurthFld_Find; $3)
C_TEXT:C284(FurthFld_Find; $4)

//FurthFld_Find2
C_LONGINT:C283(FurthFld_Find2; $0)
C_TEXT:C284(FurthFld_Find2; $1)
C_TEXT:C284(FurthFld_Find2; $2)
C_TEXT:C284(FurthFld_Find2; $3)
C_TEXT:C284(FurthFld_Find2; $4)
C_LONGINT:C283(FurthFld_Find2; $5)

//FurthFld_FindS
C_LONGINT:C283(FurthFld_FindS; $0)
C_TEXT:C284(FurthFld_FindS; $1)
C_TEXT:C284(FurthFld_FindS; $2)
C_TEXT:C284(FurthFld_FindS; $3)
C_TEXT:C284(FurthFld_FindS; $4)

//FurthFld_FindU
C_LONGINT:C283(FurthFld_FindU; $0)
C_TEXT:C284(FurthFld_FindU; $1)
C_TEXT:C284(FurthFld_FindU; $2)
C_TEXT:C284(FurthFld_FindU; $3)
C_TEXT:C284(FurthFld_FindU; $4)

//FurthFld_Func2
C_POINTER:C301(FurthFld_Func2; $1)

//FurthFld_Get
C_TEXT:C284(FurthFld_Get; $0)
C_TEXT:C284(FurthFld_Get; $1)
C_TEXT:C284(FurthFld_Get; $2)
C_TEXT:C284(FurthFld_Get; $3)

//FurthFld_Get2
C_TEXT:C284(FurthFld_Get2; $0)
C_TEXT:C284(FurthFld_Get2; $1)
C_TEXT:C284(FurthFld_Get2; $2)
C_TEXT:C284(FurthFld_Get2; $3)
C_TEXT:C284(FurthFld_Get2; $4)

//FurthFld_MC
C_POINTER:C301(FurthFld_MC; $1)

//FurthFld_Set
C_LONGINT:C283(FurthFld_Set; $0)
C_TEXT:C284(FurthFld_Set; $1)
C_TEXT:C284(FurthFld_Set; $2)
C_TEXT:C284(FurthFld_Set; $3)
C_TEXT:C284(FurthFld_Set; $4)

//FurthFld_Set2
C_LONGINT:C283(FurthFld_Set2; $0)
C_TEXT:C284(FurthFld_Set2; $1)
C_TEXT:C284(FurthFld_Set2; $2)
C_TEXT:C284(FurthFld_Set2; $3)
C_TEXT:C284(FurthFld_Set2; $4)

//FurthFld_Type
C_TEXT:C284(FurthFld_Type; $0)
C_TEXT:C284(FurthFld_Type; $1)
C_TEXT:C284(FurthFld_Type; $2)

//FurthFldD_InLPß
C_TEXT:C284(FurthFldD_InLPß; $1)

//FurthFldD_InLPX
C_POINTER:C301(FurthFldD_InLPX; $1)

//FurthFldP_InLPA
C_LONGINT:C283(FurthFldP_InLPA; $1)

//FurthFldP_InLPB
C_LONGINT:C283(FurthFldP_InLPB; $1)

//Gen_Add
C_REAL:C285(Gen_Add; $0)
C_POINTER:C301(Gen_Add; $1)
C_POINTER:C301(Gen_Add; $2)

//Gen_AddSub
C_REAL:C285(Gen_AddSub; $0)
C_POINTER:C301(Gen_AddSub; $1)
C_POINTER:C301(Gen_AddSub; $2)

//Gen_Alert
C_TEXT:C284(Gen_Alert; $1)
C_TEXT:C284(Gen_Alert; $2)
C_LONGINT:C283(Gen_Alert; $3)

//Gen_Alert2COL
C_TEXT:C284(Gen_Alert2Col; $1)
C_TEXT:C284(Gen_Alert2Col; $2)
C_TEXT:C284(Gen_Alert2Col; $3)

//Gen_AlertACC
C_TEXT:C284(Gen_AlertAcc; $1)
C_TEXT:C284(Gen_AlertAcc; $2)

//Gen_AlertCURR
C_TEXT:C284(Gen_AlertCurr; $1)
C_TEXT:C284(Gen_AlertCurr; $2)
C_TEXT:C284(Gen_AlertCurr; $3)

//Gen_AppToSel
C_POINTER:C301(Gen_AppToSel; $1)
C_POINTER:C301(Gen_AppToSel; $2)
C_TEXT:C284(Gen_AppToSel; $3)

//Gen_AppToSelEx
C_POINTER:C301(Gen_AppToSelEx; $1)
C_POINTER:C301(Gen_AppToSelEx; $2)
C_TEXT:C284(Gen_AppToSelEx; $3)
C_POINTER:C301(Gen_AppToSelEx; $4)

//Gen_Code
C_LONGINT:C283(Gen_Code; $0)
C_LONGINT:C283(Gen_Code; $1)
C_POINTER:C301(Gen_Code; $2)
C_TEXT:C284(Gen_Code; $3)
C_TEXT:C284(Gen_Code; $4)

//Gen_CodeCreate
C_LONGINT:C283(Gen_CodeCreate; $1)
C_LONGINT:C283(Gen_CodeCreate; $2)

//Gen_CodeMakeMN
C_LONGINT:C283(Gen_CodeMakeMN; $1)

//Gen_CodeMN2
C_LONGINT:C283(Gen_CodeMN2; $0)
C_LONGINT:C283(Gen_CodeMN2; $1)

//Gen_CodePref
C_TEXT:C284(Gen_CodePref; $0)
C_LONGINT:C283(Gen_CodePref; $1)
C_POINTER:C301(Gen_CodePref; $2)
C_TEXT:C284(Gen_CodePref; $3)
C_TEXT:C284(Gen_CodePref; $4)

//GEN_CODEPREF_PROCESS
C_TEXT:C284(GEN_CODEPREF_PROCESS; $0)
C_LONGINT:C283(GEN_CODEPREF_PROCESS; $1)
C_TEXT:C284(GEN_CODEPREF_PROCESS; $2)
C_LONGINT:C283(GEN_CODEPREF_PROCESS; $3)
C_LONGINT:C283(GEN_CODEPREF_PROCESS; $4)
C_LONGINT:C283(GEN_CODEPREF_PROCESS; $5)
C_TEXT:C284(GEN_CODEPREF_PROCESS; $6)
C_TEXT:C284(GEN_CODEPREF_PROCESS; $7)

//GEN_CODE_PROCESS
C_LONGINT:C283(GEN_CODE_PROCESS; $0)
C_LONGINT:C283(GEN_CODE_PROCESS; $1)
C_TEXT:C284(GEN_CODE_PROCESS; $2)
C_LONGINT:C283(GEN_CODE_PROCESS; $3)
C_LONGINT:C283(GEN_CODE_PROCESS; $4)
C_LONGINT:C283(GEN_CODE_PROCESS; $5)
C_TEXT:C284(GEN_CODE_PROCESS; $6)
C_TEXT:C284(GEN_CODE_PROCESS; $7)

//Gen_Confirm
C_TEXT:C284(Gen_Confirm; $1)
C_TEXT:C284(Gen_Confirm; $2)
C_TEXT:C284(Gen_Confirm; $3)
C_REAL:C285(Gen_Confirm; $4)

//Gen_Confirm3
C_TEXT:C284(Gen_Confirm3; $1)
C_TEXT:C284(Gen_Confirm3; $2)
C_TEXT:C284(Gen_Confirm3; $3)
C_TEXT:C284(Gen_Confirm3; $4)

//Gen_Confirm4
C_TEXT:C284(Gen_Confirm4; $1)
C_TEXT:C284(Gen_Confirm4; $2)
C_TEXT:C284(Gen_Confirm4; $3)
C_BOOLEAN:C305(Gen_Confirm4; $4)

//Gen_ConfirmT
C_TEXT:C284(Gen_ConfirmT; $1)
C_TEXT:C284(Gen_ConfirmT; $2)
C_TEXT:C284(Gen_ConfirmT; $3)
C_TEXT:C284(Gen_ConfirmT; $4)
C_TEXT:C284(Gen_ConfirmT; $5)

//Gen_Control
C_BOOLEAN:C305(Gen_Control; $0)

//Gen_Count
C_POINTER:C301(Gen_Count; $1)
C_TEXT:C284(Gen_Count; $2)

//Gen_CreditCh2
C_TEXT:C284(Gen_CreditCh2; $0)
C_TEXT:C284(Gen_CreditCh2; $1)
C_BOOLEAN:C305(Gen_CreditCh2; $2)

//Gen_CreditCheck
C_TEXT:C284(Gen_CreditCheck; $1)
C_BOOLEAN:C305(Gen_CreditCheck; $2)
C_POINTER:C301(Gen_CreditCheck; $3)

//Gen_CUCreate
C_TEXT:C284(Gen_CUCreate; $1)
C_LONGINT:C283(Gen_CUCreate; $2)

//Gen_CULPA
C_POINTER:C301(Gen_CULPA; $1)

//Gen_CULPB
C_POINTER:C301(Gen_CULPB; $1)
C_LONGINT:C283(Gen_CULPB; $2)
C_POINTER:C301(Gen_CULPB; $3)
C_TEXT:C284(Gen_CULPB; $4)
C_TEXT:C284(Gen_CULPB; $5)
C_TEXT:C284(Gen_CULPB; $6)
C_TEXT:C284(Gen_CULPB; $7)

//Gen_CULPB2
C_POINTER:C301(Gen_CULPB2; $1)
C_LONGINT:C283(Gen_CULPB2; $2)

//Gen_DeleteCheckState
C_BOOLEAN:C305(Gen_DeleteCheckState; $0)
C_POINTER:C301(Gen_DeleteCheckState; $1)
C_LONGINT:C283(Gen_DeleteCheckState; $2)

//Gen_DeleteCheckStateSingle
C_BOOLEAN:C305(Gen_DeleteCheckStateSingle; $0)
C_POINTER:C301(Gen_DeleteCheckStateSingle; $1)

//Gen_Disable
C_LONGINT:C283(Gen_Disable; $1)
C_LONGINT:C283(Gen_Disable; $2)
C_LONGINT:C283(Gen_Disable; $3)
C_TEXT:C284(Gen_Disable; $4)
C_TEXT:C284(Gen_Disable; $5)

//Gen_DisableOnly
C_LONGINT:C283(Gen_DisableOnly; $1)
C_LONGINT:C283(Gen_DisableOnly; $2)
C_LONGINT:C283(Gen_DisableOnly; $3)
C_TEXT:C284(Gen_DisableOnly; $4)
C_TEXT:C284(Gen_DisableOnly; $5)

//Gen_DisButt
C_LONGINT:C283(Gen_DisButt; $1)
C_POINTER:C301(Gen_DisButt; $2)

//Gen_DocName
C_TEXT:C284(Gen_DocName; $0)
C_TEXT:C284(Gen_DocName; $1)

//Gen_EmailAddr
C_POINTER:C301(Gen_EmailAddr; $1)
C_POINTER:C301(Gen_EmailAddr; $2)
C_LONGINT:C283(Gen_EmailAddr; $3)

//Gen_Export3
C_TEXT:C284(Gen_Export3; $1)
C_TEXT:C284(Gen_Export3; $2)
C_TEXT:C284(Gen_Export3; $3)


//Gen_ExportButt
C_POINTER:C301(Gen_ExportButt; $1)

//Gen_ExportButtU
C_POINTER:C301(Gen_ExportButtU; $1)

//Gen_Id
C_TEXT:C284(Gen_Id; $0)
C_POINTER:C301(Gen_Id; $1)

//Gen_IdFile
C_TEXT:C284(Gen_IdFile; $0)
C_POINTER:C301(Gen_IdFile; $1)

//Gen_Import3
C_TEXT:C284(Gen_Import3; $1)
C_TEXT:C284(Gen_Import3; $2)
C_TEXT:C284(Gen_Import3; $3)

//Gen_In
C_TEXT:C284(Gen_In; $1)
C_TEXT:C284(Gen_In; $2)
C_TEXT:C284(Gen_In; $3)
C_POINTER:C301(Gen_In; $4)

//Gen_InDisCode
C_POINTER:C301(Gen_InDisCode; $1)
C_POINTER:C301(Gen_InDisCode; $2)

//Gen_InLay
C_TEXT:C284(Gen_InLay; $1)
C_TEXT:C284(Gen_InLay; $2)
C_TEXT:C284(Gen_InLay; $3)
C_POINTER:C301(Gen_InLay; $4)
C_TEXT:C284(Gen_InLay; $5)

//Gen_InMid
C_TEXT:C284(Gen_InMid; $1)
C_TEXT:C284(Gen_InMid; $2)
C_POINTER:C301(Gen_InMid; $3)

//Gen_InMidLay
C_TEXT:C284(Gen_InMidLay; $1)
C_TEXT:C284(Gen_InMidLay; $2)
C_POINTER:C301(Gen_InMidLay; $3)
C_TEXT:C284(Gen_InMidLay; $4)

//Gen_InNOF
C_POINTER:C301(Gen_InNoF; $1)

//Gen_Integer
C_LONGINT:C283(Gen_Integer; $0)
C_REAL:C285(Gen_Integer; $1)

//Gen_List
C_TEXT:C284(Gen_List; $1)
C_TEXT:C284(Gen_List; $2)
C_TEXT:C284(Gen_List; $3)
C_POINTER:C301(Gen_List; $4)
C_POINTER:C301(Gen_List; $5)
C_TEXT:C284(Gen_List; $6)
C_TEXT:C284(Gen_List; $7)
C_TEXT:C284(Gen_List; $8)
C_TEXT:C284(Gen_List; $9)

//Gen_ListAp2
C_LONGINT:C283(Gen_ListAp2; $1)
C_POINTER:C301(Gen_ListAp2; $2)

//Gen_ListApFF
C_LONGINT:C283(Gen_ListApFF; $1)
C_POINTER:C301(Gen_ListApFF; $2)

//Gen_ListApply
C_LONGINT:C283(Gen_ListApply; $1)
C_POINTER:C301(Gen_ListApply; $2)

//Gen_ListReport
C_POINTER:C301(Gen_ListReport; $1)
C_TEXT:C284(Gen_ListReport; $2)
C_TEXT:C284(Gen_ListReport; $3)

//Gen_ListSet
C_TEXT:C284(Gen_ListSet; $1)

//Gen_ListSR
C_TEXT:C284(Gen_ListSR; $1)
C_TEXT:C284(Gen_ListSR; $2)
C_TEXT:C284(Gen_ListSR; $3)
C_POINTER:C301(Gen_ListSR; $4)
C_POINTER:C301(Gen_ListSR; $5)
C_TEXT:C284(Gen_ListSR; $6)
C_TEXT:C284(Gen_ListSR; $7)
C_TEXT:C284(Gen_ListSR; $8)
C_TEXT:C284(Gen_ListSR; $9)
C_TEXT:C284(Gen_ListSR; $10)

//Gen_ListtoLists
C_TEXT:C284(Gen_ListtoLists; $1)
C_TEXT:C284(Gen_ListtoLists; $2)

//Gen_LPTax
C_TEXT:C284(Gen_LPTax; $0)

//Gen_Message
C_TEXT:C284(Gen_Message; $1)

//Gen_Mod
C_TEXT:C284(Gen_Mod; $1)
C_TEXT:C284(Gen_Mod; $2)
C_TEXT:C284(Gen_Mod; $3)
C_POINTER:C301(Gen_Mod; $4)
C_POINTER:C301(Gen_Mod; $5)
C_TEXT:C284(Gen_Mod; $6)
C_TEXT:C284(Gen_Mod; $7)

//Gen_Mod2
C_TEXT:C284(Gen_Mod2; $1)
C_POINTER:C301(Gen_Mod2; $2)
C_TEXT:C284(Gen_Mod2; $3)
C_POINTER:C301(Gen_Mod2; $4)

//Gen_Mod2AL
C_TEXT:C284(Gen_Mod2AL; $1)
C_POINTER:C301(Gen_Mod2AL; $2)
C_TEXT:C284(Gen_Mod2AL; $3)
C_POINTER:C301(Gen_Mod2AL; $4)
C_TEXT:C284(Gen_Mod2AL; $5)

//Gen_ModAster
C_TEXT:C284(Gen_ModAster; $1)
C_TEXT:C284(Gen_ModAster; $2)
C_TEXT:C284(Gen_ModAster; $3)
C_POINTER:C301(Gen_ModAster; $4)
C_POINTER:C301(Gen_ModAster; $5)
C_TEXT:C284(Gen_ModAster; $6)
C_TEXT:C284(Gen_ModAster; $7)

//Gen_ModDisp
C_TEXT:C284(Gen_ModDisp; $1)
C_TEXT:C284(Gen_ModDisp; $2)
C_TEXT:C284(Gen_ModDisp; $3)
C_POINTER:C301(Gen_ModDisp; $4)
C_POINTER:C301(Gen_ModDisp; $5)
C_TEXT:C284(Gen_ModDisp; $6)
C_TEXT:C284(Gen_ModDisp; $7)

//Gen_ModLay
C_TEXT:C284(Gen_ModLay; $1)
C_TEXT:C284(Gen_ModLay; $2)
C_TEXT:C284(Gen_ModLay; $3)
C_POINTER:C301(Gen_ModLay; $4)
C_POINTER:C301(Gen_ModLay; $5)
C_TEXT:C284(Gen_ModLay; $6)
C_TEXT:C284(Gen_ModLay; $7)
C_TEXT:C284(Gen_ModLay; $8)

//Gen_ModMid
C_TEXT:C284(Gen_ModMid; $1)
C_TEXT:C284(Gen_ModMid; $2)
C_POINTER:C301(Gen_ModMid; $3)
C_POINTER:C301(Gen_ModMid; $4)
C_TEXT:C284(Gen_ModMid; $5)
C_TEXT:C284(Gen_ModMid; $6)
C_LONGINT:C283(Gen_ModMid; $7)

//Gen_ModMidAL
C_TEXT:C284(Gen_ModMidAL; $1)
C_TEXT:C284(Gen_ModMidAL; $2)
C_POINTER:C301(Gen_ModMidAL; $3)
C_POINTER:C301(Gen_ModMidAL; $4)
C_TEXT:C284(Gen_ModMidAL; $5)
C_TEXT:C284(Gen_ModMidAL; $6)
C_POINTER:C301(Gen_ModMidAL; $7)
C_TEXT:C284(Gen_ModMidAL; $8)

//Gen_ModMidAP
C_TEXT:C284(Gen_ModMidAP; $1)
C_POINTER:C301(Gen_ModMidAP; $2)
C_TEXT:C284(Gen_ModMidAP; $3)

//Gen_ModMidAster
C_TEXT:C284(Gen_ModMidAster; $1)
C_TEXT:C284(Gen_ModMidAster; $2)
C_POINTER:C301(Gen_ModMidAster; $3)
C_POINTER:C301(Gen_ModMidAster; $4)
C_TEXT:C284(Gen_ModMidAster; $5)
C_TEXT:C284(Gen_ModMidAster; $6)

//Gen_None
C_TEXT:C284(Gen_None; $1)
C_POINTER:C301(Gen_None; $2)

//Gen_Option
C_BOOLEAN:C305(Gen_Option; $0)

//GEN OUTNO
C_POINTER:C301(Gen_OutNo; $1)

//Gen_OutNoF
C_POINTER:C301(Gen_OutNoF; $1)

//Gen_OutsideCoCo
C_POINTER:C301(Gen_OutsideCoCo; $1)
C_POINTER:C301(Gen_OutsideCoCo; $2)

//Gen_PayAllP
C_LONGINT:C283(Gen_PayAllP; $1)

//Gen_PayDate
C_TEXT:C284(Gen_PayDate; $1)
C_BOOLEAN:C305(Gen_PayDate; $2)
C_REAL:C285(Gen_PayDate; $3)
C_LONGINT:C283(Gen_PayDate; $4)

//Gen_PostKey
C_REAL:C285(Gen_PostKey; $1)
C_REAL:C285(Gen_PostKey; $2)
C_REAL:C285(Gen_PostKey; $3)

//Gen_PoundsPence
C_POINTER:C301(Gen_PoundsPence; $1)
C_POINTER:C301(Gen_PoundsPence; $2)
C_REAL:C285(Gen_PoundsPence; $3)

//Gen_PP1
C_POINTER:C301(Gen_PP1; $1)
C_TEXT:C284(Gen_PP1; $2)

//Gen_PP2
C_TEXT:C284(Gen_PP2; $1)

//Gen_PPChkSt
C_BOOLEAN:C305(Gen_PPChkSt; $0)
C_POINTER:C301(Gen_PPChkSt; $1)
C_LONGINT:C283(Gen_PPChkSt; $2)

//Gen_PPChkStSing
C_BOOLEAN:C305(Gen_PPChkStSing; $0)
C_POINTER:C301(Gen_PPChkStSing; $1)
C_LONGINT:C283(Gen_PPChkStSing; $2)
C_BOOLEAN:C305(Gen_PPChkStSing; $3)

//Gen_PPCreditChk
C_BOOLEAN:C305(Gen_PPCreditChk; $0)
C_POINTER:C301(Gen_PPCreditChk; $1)
C_POINTER:C301(Gen_PPCreditChk; $2)
C_TEXT:C284(Gen_PPCreditChk; $3)

//Gen_PPMulti
C_LONGINT:C283(Gen_PPMulti; $0)
C_POINTER:C301(Gen_PPMulti; $1)
C_TEXT:C284(Gen_PPMulti; $2)
C_TEXT:C284(Gen_PPMulti; $3)
C_TEXT:C284(Gen_PPMulti; $4)
C_TEXT:C284(Gen_PPMulti; $5)
C_TEXT:C284(Gen_PPMulti; $6)
C_LONGINT:C283(Gen_PPMulti; $7)
C_POINTER:C301(Gen_PPMulti; $8)
C_TEXT:C284(Gen_PPMulti; $9)
C_TEXT:C284(Gen_PPMulti; $10)
C_BOOLEAN:C305(Gen_PPMulti; $11)
C_TEXT:C284(Gen_PPMulti; $12)

//Gen_PPMultiCS
C_POINTER:C301(Gen_PPMultiCS; $1)
C_TEXT:C284(Gen_PPMultiCS; $2)

//Gen_PPMultiUS
C_TEXT:C284(Gen_PPMultiUS; $1)

//Gen_PPSingle
C_POINTER:C301(Gen_PPSingle; $1)
C_TEXT:C284(Gen_PPSingle; $2)
C_TEXT:C284(Gen_PPSingle; $3)
C_TEXT:C284(Gen_PPSingle; $4)
C_TEXT:C284(Gen_PPSingle; $5)
C_TEXT:C284(Gen_PPSingle; $6)
C_LONGINT:C283(Gen_PPSingle; $7)
C_POINTER:C301(Gen_PPSingle; $8)
C_TEXT:C284(Gen_PPSingle; $9)
C_TEXT:C284(Gen_PPSingle; $10)
C_BOOLEAN:C305(Gen_PPSingle; $11)
C_TEXT:C284(Gen_PPSingle; $12)

//Gen_PPSingleCS
C_POINTER:C301(Gen_PPSingleCS; $1)
C_TEXT:C284(Gen_PPSingleCS; $2)

//Gen_PPSingleEmail
C_REAL:C285(Gen_PPSingleEmail; $1)
C_POINTER:C301(Gen_PPSingleEmail; $2)
C_TEXT:C284(Gen_PPSingleEmail; $3)
C_TEXT:C284(Gen_PPSingleEmail; $4)
C_TEXT:C284(Gen_PPSingleEmail; $5)
C_TEXT:C284(Gen_PPSingleEmail; $6)
C_TEXT:C284(Gen_PPSingleEmail; $7)
C_LONGINT:C283(Gen_PPSingleEmail; $8)
C_POINTER:C301(Gen_PPSingleEmail; $9)
C_TEXT:C284(Gen_PPSingleEmail; $10)
C_TEXT:C284(Gen_PPSingleEmail; $11)
C_BOOLEAN:C305(Gen_PPSingleEmail; $12)
C_TEXT:C284(Gen_PPSingleEmail; $13)
C_TEXT:C284(Gen_PPSingleEmail; $14)
C_TEXT:C284(Gen_PPSingleEmail; $15)

//Gen_PPSingleUS
C_TEXT:C284(Gen_PPSingleUS; $1)

//Gen_RecordNumber
C_LONGINT:C283(Gen_RecordNumber; $0)
C_LONGINT:C283(Gen_RecordNumber; $1)
C_POINTER:C301(Gen_RecordNumber; $2)

//Gen_RemDisDel
C_POINTER:C301(Gen_RemDisDel; $1)

//GEN REQUEST
C_TEXT:C284(Gen_Request; $0)
C_TEXT:C284(Gen_Request; $1)
C_TEXT:C284(Gen_Request; $2)
C_TEXT:C284(Gen_Request; $3)
C_TEXT:C284(Gen_Request; $4)
C_LONGINT:C283(Gen_Request; $5)
C_LONGINT:C283(Gen_Request; $6)
C_TEXT:C284(Gen_Request; $7)

//Gen_RequestText
C_TEXT:C284(Gen_RequestText; $0)
C_TEXT:C284(Gen_RequestText; $1)
C_TEXT:C284(Gen_RequestText; $2)
C_TEXT:C284(Gen_RequestText; $3)
C_TEXT:C284(Gen_RequestText; $4)
C_LONGINT:C283(Gen_RequestText; $5)
C_TEXT:C284(Gen_RequestText; $6)

//Gen_Round
C_REAL:C285(Gen_Round; $0)
C_REAL:C285(Gen_Round; $1)
C_LONGINT:C283(Gen_Round; $2)
C_LONGINT:C283(Gen_Round; $3)

//Gen_ScrRepPrEx
C_TEXT:C284(Gen_ScrRepPrEx; $1)

//Gen_ScrRepSrc
C_LONGINT:C283(Gen_ScrRepSrc; $1)

//Gen_Search
C_TEXT:C284(Gen_Search; $0)
C_TEXT:C284(Gen_Search; $1)
C_TEXT:C284(Gen_Search; $2)
C_TEXT:C284(Gen_Search; $3)
C_TEXT:C284(Gen_Search; $4)
C_TEXT:C284(Gen_Search; $5)
C_TEXT:C284(Gen_Search; $6)

//Gen_SearchA
C_TEXT:C284(Gen_SearchA; $0)
C_TEXT:C284(Gen_SearchA; $1)
C_TEXT:C284(Gen_SearchA; $2)
C_TEXT:C284(Gen_SearchA; $3)
C_TEXT:C284(Gen_SearchA; $4)
C_TEXT:C284(Gen_SearchA; $5)
C_TEXT:C284(Gen_SearchA; $6)
C_TEXT:C284(Gen_SearchA; $7)

//Gen_SelbyForm
C_BOOLEAN:C305(Gen_SelbyForm; $0)
C_POINTER:C301(Gen_SelbyForm; $1)

//Gen_ShowTel
C_TEXT:C284(Gen_ShowTel; $1)
C_TEXT:C284(Gen_ShowTel; $2)

//Gen_ShowTelDial
C_TEXT:C284(Gen_ShowTelDial; $1)

//Gen_ShowTelOut
C_POINTER:C301(Gen_ShowTelOut; $1)
C_POINTER:C301(Gen_ShowTelOut; $2)

//Gen_SMS_Msg
C_TEXT:C284(Gen_SMS_Msg; $0)
C_TEXT:C284(Gen_SMS_Msg; $1)
C_TEXT:C284(Gen_SMS_Msg; $2)
C_TEXT:C284(Gen_SMS_Msg; $3)
C_TEXT:C284(Gen_SMS_Msg; $4)
C_POINTER:C301(Gen_SMS_Msg; $5)
C_POINTER:C301(Gen_SMS_Msg; $6)

//Gen_TimeCode
C_LONGINT:C283(Gen_TimeCode; $0)

//Gen_Unique
C_TEXT:C284(Gen_Unique; $0)


//Gen_WWWAddress
C_TEXT:C284(Gen_WWWAddress; $0)
C_TEXT:C284(Gen_WWWAddress; $1)


//GENCODEBREAKOUT
C_REAL:C285(GenCodeBreakout; $0)
C_LONGINT:C283(GenCodeBreakout; $1)
C_POINTER:C301(GenCodeBreakout; $2)
C_TEXT:C284(GenCodeBreakout; $3)
C_TEXT:C284(GenCodeBreakout; $4)

//GENEXPORTSUBRECORDFIELDNAMES
C_TEXT:C284(GenExportSubRecordFieldNames; $1)
C_LONGINT:C283(GenExportSubRecordFieldNames; $2)
C_LONGINT:C283(GenExportSubRecordFieldNames; $3)
C_TEXT:C284(GenExportSubRecordFieldNames; $4)
C_TEXT:C284(GenExportSubRecordFieldNames; $5)
C_TEXT:C284(GenExportSubRecordFieldNames; $6)

//GENEXPORTSUBRECORDS
C_TEXT:C284(GenExportSubrecords; $1)
C_LONGINT:C283(GenExportSubrecords; $2)
C_LONGINT:C283(GenExportSubrecords; $3)
C_TEXT:C284(GenExportSubrecords; $4)
C_TEXT:C284(GenExportSubrecords; $5)
C_TEXT:C284(GenExportSubrecords; $6)

//GENIMPORTSUBRECORDFIELDNAMES
C_LONGINT:C283(GenImportSubRecordFieldNames; $0)
C_TEXT:C284(GenImportSubRecordFieldNames; $1)
C_LONGINT:C283(GenImportSubRecordFieldNames; $2)
C_LONGINT:C283(GenImportSubRecordFieldNames; $3)
C_TEXT:C284(GenImportSubRecordFieldNames; $4)
C_TEXT:C284(GenImportSubRecordFieldNames; $5)
C_TEXT:C284(GenImportSubRecordFieldNames; $6)
C_LONGINT:C283(GenImportSubRecordFieldNames; $7)

//GEN_ALERT_SD
C_LONGINT:C283(Gen_alert_SD; $0)
C_TEXT:C284(Gen_alert_SD; $1)
C_TEXT:C284(Gen_alert_SD; $2)
C_TEXT:C284(Gen_alert_SD; $3)

//GEN_CALINPROCESS
C_LONGINT:C283(GEN_CalInProcess; $1)
C_DATE:C307(GEN_CalInProcess; $2)
C_TEXT:C284(GEN_CalInProcess; $3)
C_TEXT:C284(GEN_CalInProcess; $4)
C_LONGINT:C283(GEN_CalInProcess; $5)

//GEN_CHOICES
C_LONGINT:C283(GEN_Choices; $0)
C_TEXT:C284(GEN_Choices; ${2})
C_LONGINT:C283(GEN_Choices; $1)
C_TEXT:C284(GEN_Choices; $2)
C_TEXT:C284(GEN_Choices; $3)
C_TEXT:C284(GEN_Choices; $4)

//GEN_CONFIRMPASSWORD
C_BOOLEAN:C305(Gen_ConfirmPassword; $0)
C_TEXT:C284(Gen_ConfirmPassword; $1)
C_BOOLEAN:C305(Gen_ConfirmPassword; $2)
C_BOOLEAN:C305(Gen_ConfirmPassword; $3)

//GEN_CONFIRM_WITHHIDEOPTION
C_REAL:C285(Gen_Confirm_WithHideOption; $0)
C_REAL:C285(Gen_Confirm_WithHideOption; $1)
C_TEXT:C284(Gen_Confirm_WithHideOption; $2)
C_TEXT:C284(Gen_Confirm_WithHideOption; $3)
C_TEXT:C284(Gen_Confirm_WithHideOption; $4)

//GEN_CONVERT
C_REAL:C285(GEN_CONVERT; $0)
C_TEXT:C284(GEN_CONVERT; $1)
C_REAL:C285(GEN_CONVERT; $2)
C_DATE:C307(GEN_CONVERT; $3)

//GEN_DATESTAMP
C_LONGINT:C283(Gen_DateStamp; $0)
C_DATE:C307(Gen_DateStamp; $1)

//GEN_DATESTAMP2DATE
C_LONGINT:C283(Gen_DateStamp2Date; $1)
C_POINTER:C301(Gen_DateStamp2Date; $2)

//GEN_GETCONSTANTSLIST
C_TEXT:C284(Gen_GetConstantsList; $1)
C_POINTER:C301(Gen_GetConstantsList; $2)
C_POINTER:C301(Gen_GetConstantsList; $3)

//GEN_IMPORTFINDRECORD
C_LONGINT:C283(Gen_IMportFindRecord; $1)
C_POINTER:C301(Gen_IMportFindRecord; $2)

//GEN_PPSINGLE_2
C_POINTER:C301(Gen_PPSingle_2; $1)
C_POINTER:C301(Gen_PPSingle_2; $2)
C_TEXT:C284(Gen_PPSingle_2; $3)
C_TEXT:C284(Gen_PPSingle_2; $4)
C_TEXT:C284(Gen_PPSingle_2; $5)
C_TEXT:C284(Gen_PPSingle_2; $6)
C_TEXT:C284(Gen_PPSingle_2; $7)
C_TEXT:C284(Gen_PPSingle_2; $8)
C_LONGINT:C283(Gen_PPSingle_2; $9)
C_POINTER:C301(Gen_PPSingle_2; $10)
C_TEXT:C284(Gen_PPSingle_2; $11)
C_TEXT:C284(Gen_PPSingle_2; $12)
C_BOOLEAN:C305(Gen_PPSingle_2; $13)
C_LONGINT:C283(Gen_PPSingle_2; $14)

//GEN_SETMANAGER
C_LONGINT:C283(Gen_SetManager; $1)
C_LONGINT:C283(Gen_SetManager; $2)
C_LONGINT:C283(Gen_SetManager; $3)
C_REAL:C285(Gen_SetManager; $4)

//GEN_SORTOUTPUT
C_POINTER:C301(GEN_SortOutput; $1)
C_BOOLEAN:C305(GEN_SortOutput; $2)
C_POINTER:C301(GEN_SortOutput; $3)

//GEN_SUM
C_REAL:C285(GEN_SUM; $0)
C_POINTER:C301(GEN_SUM; $1)
C_POINTER:C301(GEN_SUM; $2)

//GEN_TIMEDATESTAMP
C_LONGINT:C283(GEN_TimeDateStamp; $0)
C_DATE:C307(GEN_TimeDateStamp; $1)
C_TIME:C306(GEN_TimeDateStamp; $2)

//GEN_TIMESTAMP2DATE
C_LONGINT:C283(Gen_TimeStamp2Date; $1)
C_POINTER:C301(Gen_TimeStamp2Date; $2)
C_POINTER:C301(Gen_TimeStamp2Date; $3)

//GEN_TIMESTAMP2TIME
C_LONGINT:C283(Gen_TimeStamp2Time; $1)
C_POINTER:C301(Gen_TimeStamp2Time; $2)

//GEN_UPDATETAXPERIOD
C_DATE:C307(GEN_UPDATETAXPERIOD; $1)
C_TEXT:C284(GEN_UPDATETAXPERIOD; $2)
C_TEXT:C284(GEN_UPDATETAXPERIOD; $3)

//Get_Email_Owner
C_TEXT:C284(Get_Email_Owner; $0)

//GETDIARYHOUR
C_LONGINT:C283(GetDiaryHour; $0)
C_LONGINT:C283(GetDiaryHour; $1)

//GETEMAILSENDER
C_TEXT:C284(GetEmailSender; $0)

//GETEMAILSIGNATURE
C_TEXT:C284(GetEmailSignature; $0)


//IME_AccessCreate
C_TEXT:C284(IME_AccessCreate; $1)
C_LONGINT:C283(IME_AccessCreate; $2)

//IME_AccessUpdate
C_TEXT:C284(IME_AccessUpdate; $1)

//IME_DBEdit
C_TEXT:C284(IME_DBEdit; $1)

//IME_DBEditDefCreate
C_TEXT:C284(IME_DBEditDefCreate; $0)
C_TEXT:C284(IME_DBEditDefCreate; $1)
C_POINTER:C301(IME_DBEditDefCreate; $2)

//IME_DBEncrypt
C_TEXT:C284(IME_DBEncrypt; $0)
C_TEXT:C284(IME_DBEncrypt; $1)

//IME_DBFind
C_TEXT:C284(IME_DBFind; $1)

//IME_DBHeader
C_TEXT:C284(IME_DBHeader; $1)
C_TEXT:C284(IME_DBHeader; $2)
C_TEXT:C284(IME_DBHeader; $3)
C_TEXT:C284(IME_DBHeader; $4)
C_TEXT:C284(IME_DBHeader; $5)
C_TEXT:C284(IME_DBHeader; $6)
C_TEXT:C284(IME_DBHeader; $7)

//IME_DBList
C_TEXT:C284(IME_DBList; $1)

//IME_DBListDefCreate
C_TEXT:C284(IME_DBListDefCreate; $0)
C_TEXT:C284(IME_DBListDefCreate; $1)
C_POINTER:C301(IME_DBListDefCreate; $2)
C_POINTER:C301(IME_DBListDefCreate; $3)

//IME_DBListDefinitionFind
C_TEXT:C284(IME_DBListDefinitionFind; $0)
C_TEXT:C284(IME_DBListDefinitionFind; $1)
C_TEXT:C284(IME_DBListDefinitionFind; $2)

//IME_DBLookup
C_TEXT:C284(IME_DBLookup; $1)

//IME_DBLookupQuery
C_TEXT:C284(IME_DBLookupQuery; $0)
C_TEXT:C284(IME_DBLookupQuery; $1)
C_POINTER:C301(IME_DBLookupQuery; $2)

//IME_DBNavigation
C_TEXT:C284(IME_DBNavigation; $0)
C_TEXT:C284(IME_DBNavigation; $1)

//IME_Decrypt
C_TEXT:C284(IME_Decrypt; $0)
C_TEXT:C284(IME_Decrypt; $1)

//IME_Decrypt2
C_TEXT:C284(IME_Decrypt2; $0)
C_TEXT:C284(IME_Decrypt2; $1)
C_REAL:C285(IME_Decrypt2; $2)
C_REAL:C285(IME_Decrypt2; $3)
C_REAL:C285(IME_Decrypt2; $4)

//IME_DecryptWebRef
C_TEXT:C284(IME_DecryptWebRef; $0)
C_TEXT:C284(IME_DecryptWebRef; $1)

//IME_Encrypt
C_TEXT:C284(IME_Encrypt; $0)
C_TEXT:C284(IME_Encrypt; $1)

//IME_Encrypt2
C_TEXT:C284(IME_Encrypt2; $0)
C_TEXT:C284(IME_Encrypt2; $1)
C_REAL:C285(IME_Encrypt2; $2)
C_REAL:C285(IME_Encrypt2; $3)
C_REAL:C285(IME_Encrypt2; $4)

//IME_EncryptFind
C_TEXT:C284(IME_EncryptFind; $0)
C_TEXT:C284(IME_EncryptFind; $1)

//IME_EncryptWebRef
C_TEXT:C284(IME_EncryptWebRef; $0)
C_TEXT:C284(IME_EncryptWebRef; $1)

//IME_FieldValue
C_TEXT:C284(IME_FieldValue; $0)
C_TEXT:C284(IME_FieldValue; $1)
C_TEXT:C284(IME_FieldValue; $2)

//IME_FieldValue2
C_TEXT:C284(IME_FieldValue2; $0)
C_TEXT:C284(IME_FieldValue2; $1)
C_TEXT:C284(IME_FieldValue2; $2)

//IME FLUSH
C_LONGINT:C283(IME_Flush; $1)

//IME_IMAPlay
C_TEXT:C284(IME_IMAPlay; $1)

//IME_ITXListNS
C_LONGINT:C283(IME_ITXListNS; $0)
C_TEXT:C284(IME_ITXListNS; $1)

//IME_ITXPlay
C_TEXT:C284(IME_ITXPlay; $1)

//IME_ListLoad
C_BOOLEAN:C305(IME_ListLoad; $0)
C_TEXT:C284(IME_ListLoad; $1)
C_TEXT:C284(IME_ListLoad; $2)

//IME_MacroFind
C_BOOLEAN:C305(IME_MacroFind; $0)
C_TEXT:C284(IME_MacroFind; $1)
C_TEXT:C284(IME_MacroFind; $2)

//IME_Parameter
C_TEXT:C284(IME_Parameter; $0)
C_TEXT:C284(IME_Parameter; $1)

//IME_RelateOne
C_TEXT:C284(IME_RelateOne; $0)
C_POINTER:C301(IME_RelateOne; $1)
C_POINTER:C301(IME_RelateOne; $2)

//IME_Replace
C_TEXT:C284(IME_Replace; $0)
C_TEXT:C284(IME_Replace; $1)

//IME_Reply
C_TEXT:C284(IME_Reply; $1)

//IME_ReplyText2
C_TEXT:C284(IME_ReplyText2; ${2})
C_TEXT:C284(IME_ReplyText2; $1)
C_TEXT:C284(IME_ReplyText2; $2)
C_TEXT:C284(IME_ReplyText2; $3)
C_TEXT:C284(IME_ReplyText2; $4)
C_TEXT:C284(IME_ReplyText2; $5)
C_TEXT:C284(IME_ReplyText2; $6)
C_TEXT:C284(IME_ReplyText2; $7)
C_TEXT:C284(IME_ReplyText2; $8)
C_TEXT:C284(IME_ReplyText2; $9)
C_TEXT:C284(IME_ReplyText2; $10)
C_TEXT:C284(IME_ReplyText2; $11)
C_TEXT:C284(IME_ReplyText2; $12)
C_TEXT:C284(IME_ReplyText2; $13)
C_TEXT:C284(IME_ReplyText2; $14)
C_TEXT:C284(IME_ReplyText2; $15)
C_TEXT:C284(IME_ReplyText2; $16)
C_TEXT:C284(IME_ReplyText2; $17)
C_TEXT:C284(IME_ReplyText2; $18)

//IME_Session
C_TEXT:C284(IME_Session; $1)

//IME_SetMailOpts
C_TEXT:C284(IME_SetMailOpts; $1)
C_TEXT:C284(IME_SetMailOpts; $2)

//IME_Text2
C_TEXT:C284(IME_Text2; $0)
C_TEXT:C284(IME_Text2; ${2})
C_TEXT:C284(IME_Text2; $1)

//IME_ASCIITOTEXT
C_TEXT:C284(IME_AsciiToText; $0)
C_TEXT:C284(IME_AsciiToText; $1)

//IME_CACHEDDATADELETE
C_TEXT:C284(IME_CachedDataDelete; $1)
C_BOOLEAN:C305(IME_CachedDataDelete; $2)

//IME_CACHEDDATAEXPIRATION
C_TEXT:C284(IME_CachedDataExpiration; $0)
C_TEXT:C284(IME_CachedDataExpiration; $1)
C_REAL:C285(IME_CachedDataExpiration; $2)

//IME_CACHEDDATAGET
C_TEXT:C284(IME_CachedDataGet; $0)
C_TEXT:C284(IME_CachedDataGet; ${2})
C_TEXT:C284(IME_CachedDataGet; $1)
C_TEXT:C284(IME_CachedDataGet; $2)
C_TEXT:C284(IME_CachedDataGet; $3)
C_TEXT:C284(IME_CachedDataGet; $4)
C_TEXT:C284(IME_CachedDataGet; $5)
C_TEXT:C284(IME_CachedDataGet; $6)
C_TEXT:C284(IME_CachedDataGet; $7)
C_TEXT:C284(IME_CachedDataGet; $8)
C_TEXT:C284(IME_CachedDataGet; $9)
C_TEXT:C284(IME_CachedDataGet; $10)
C_TEXT:C284(IME_CachedDataGet; $11)
C_TEXT:C284(IME_CachedDataGet; $12)

//IME_CACHEDDATAGETBLOB
C_TEXT:C284(IME_CachedDataGetBlob; $0)
C_TEXT:C284(IME_CachedDataGetBlob; $1)
C_POINTER:C301(IME_CachedDataGetBlob; $2)

//IME_CACHEDDATAGETTEXT
C_TEXT:C284(IME_CachedDataGetText; $0)
C_TEXT:C284(IME_CachedDataGetText; ${2})
C_TEXT:C284(IME_CachedDataGetText; $1)

//IME_CACHEDDATAPUT
C_TEXT:C284(IME_CachedDataPut; $0)
C_TEXT:C284(IME_CachedDataPut; ${3})
C_TEXT:C284(IME_CachedDataPut; $1)
C_REAL:C285(IME_CachedDataPut; $2)
C_TEXT:C284(IME_CachedDataPut; $3)
C_TEXT:C284(IME_CachedDataPut; $4)
C_TEXT:C284(IME_CachedDataPut; $5)
C_TEXT:C284(IME_CachedDataPut; $6)
C_TEXT:C284(IME_CachedDataPut; $7)
C_TEXT:C284(IME_CachedDataPut; $8)
C_TEXT:C284(IME_CachedDataPut; $9)
C_TEXT:C284(IME_CachedDataPut; $10)
C_TEXT:C284(IME_CachedDataPut; $11)
C_TEXT:C284(IME_CachedDataPut; $12)
C_TEXT:C284(IME_CachedDataPut; $13)

//IME_CACHEDDATAPUTBLOB
C_TEXT:C284(IME_CachedDataPutBlob; $0)
C_TEXT:C284(IME_CachedDataPutBlob; $1)
C_REAL:C285(IME_CachedDataPutBlob; $2)
C_POINTER:C301(IME_CachedDataPutBlob; $3)

//IME_CACHEDDATAPUTTEXT
C_TEXT:C284(IME_CachedDataPutText; $0)
C_TEXT:C284(IME_CachedDataPutText; $1)
C_REAL:C285(IME_CachedDataPutText; $2)
C_TEXT:C284(IME_CachedDataPutText; $3)

//IME_CACHEPAGESTART
C_BOOLEAN:C305(IME_CachePageStart; $0)
C_TEXT:C284(IME_CachePageStart; $1)
C_LONGINT:C283(IME_CachePageStart; $2)
C_TEXT:C284(IME_CachePageStart; $3)
C_LONGINT:C283(IME_CachePageStart; $4)
C_LONGINT:C283(IME_CachePageStart; $5)

//IME_COOKIEGET
C_TEXT:C284(IME_CookieGet; $0)
C_TEXT:C284(IME_CookieGet; $1)
C_BOOLEAN:C305(IME_CookieGet; $2)

//IME_COOKIESET
C_TEXT:C284(IME_CookieSet; $1)
C_TEXT:C284(IME_CookieSet; $2)
C_BOOLEAN:C305(IME_CookieSet; $3)
C_LONGINT:C283(IME_CookieSet; $4)

//IME_DECRFIXED
C_TEXT:C284(IME_DecrFixed; $0)
C_TEXT:C284(IME_DecrFixed; $1)

//IME_DECRFIXED2
C_TEXT:C284(IME_DecrFixed2; $0)
C_TEXT:C284(IME_DecrFixed2; $1)


//IME_DECRFIXED3
C_TEXT:C284(IME_DecrFixed3; $0)
C_TEXT:C284(IME_DecrFixed3; $1)

//IME_DECRYPTFIND
C_TEXT:C284(IME_DecryptFind; $0)
C_TEXT:C284(IME_DecryptFind; $1)
C_LONGINT:C283(IME_DecryptFind; $2)
C_LONGINT:C283(IME_DecryptFind; $3)
C_POINTER:C301(IME_DecryptFind; $4)
C_TEXT:C284(IME_DecryptFind; $5)

//IME_DECRYPTSIMPLE
C_TEXT:C284(IME_DecryptSimple; $0)
C_TEXT:C284(IME_DecryptSimple; $1)

//IME_ENCRFIXED
C_TEXT:C284(IME_EncrFixed; $0)
C_TEXT:C284(IME_EncrFixed; $1)

//IME_ENCRFIXED2
C_TEXT:C284(IME_EncrFixed2; $0)
C_TEXT:C284(IME_EncrFixed2; $1)

//IME_ENCRFIXED3
C_TEXT:C284(IME_EncrFixed3; $0)
C_TEXT:C284(IME_EncrFixed3; $1)
C_TEXT:C284(IME_EncrFixed3; $2)

//IME_ENCRYPTFIND
C_TEXT:C284(IME_EncryptFind; $0)
C_TEXT:C284(IME_EncryptFind; $1)
C_LONGINT:C283(IME_EncryptFind; $2)
C_LONGINT:C283(IME_EncryptFind; $3)
C_POINTER:C301(IME_EncryptFind; $4)
C_TEXT:C284(IME_EncryptFind; $5)
C_LONGINT:C283(IME_EncryptFind; $6)

//IME_ENCRYPTSIMPLE
C_TEXT:C284(IME_EncryptSimple; $0)
C_TEXT:C284(IME_EncryptSimple; $1)

//IME_FLUSH
C_LONGINT:C283(IME_Flush; $1)

//IME_IMAPLAYFROMMETHOD
C_TEXT:C284(IME_IMAPlayFromMethod; ${2})
C_TEXT:C284(IME_IMAPlayFromMethod; $1)

//IME_MAIN
C_LONGINT:C283(IME_Main; $1)
C_TEXT:C284(IME_Main; $2)

//IME_MAINMACRO
C_TEXT:C284(IME_MainMacro; $1)
C_BOOLEAN:C305(IME_MainMacro; $2)

//IME_TEXTNOTAGS
C_TEXT:C284(IME_TextNoTags; $0)
C_TEXT:C284(IME_TextNoTags; $1)

//IME_TEXTTOASCII
C_TEXT:C284(IME_TextToAscii; $0)
C_TEXT:C284(IME_TextToAscii; $1)

//In_Allowed
C_BOOLEAN:C305(In_Allowed; $0)
C_TEXT:C284(In_Allowed; $1)

//In_ButtCall
C_TEXT:C284(In_ButtCall; $1)
C_TEXT:C284(In_ButtCall; $2)
C_TEXT:C284(In_ButtCall; $3)
C_POINTER:C301(In_ButtCall; $4)
C_POINTER:C301(In_ButtCall; $5)
C_TEXT:C284(In_ButtCall; $6)
C_TEXT:C284(In_ButtCall; $7)
C_TEXT:C284(In_ButtCall; $8)
C_TEXT:C284(In_ButtCall; $9)
C_TEXT:C284(In_ButtCall; $10)
C_TEXT:C284(In_ButtCall; $11)
C_POINTER:C301(In_ButtCall; $12)
C_POINTER:C301(In_ButtCall; $13)
C_POINTER:C301(In_ButtCall; $14)

//In_ButtChkDis
C_POINTER:C301(In_ButtChkDis; $1)

//In_ButtChkMan
C_BOOLEAN:C305(In_ButtChkMan; $0)
C_POINTER:C301(In_ButtChkMan; $1)
C_TEXT:C284(In_ButtChkMan; $2)

//In_ButtdCall
C_POINTER:C301(In_ButtdCall; $1)

//In_ButtLPA
C_TEXT:C284(In_ButtLPA; $1)
C_POINTER:C301(In_ButtLPA; $2)

//In_ButtNextPrev
C_POINTER:C301(In_ButtNextPrev; $1)
C_POINTER:C301(In_ButtNextPrev; $2)

//Input_Buttons
C_POINTER:C301(Input_Buttons; $1)
C_POINTER:C301(Input_Buttons; $2)

//Input_ButtonsWIN
C_LONGINT:C283(Input_ButtonsWin; $1)



//In_ButtSilver
C_BOOLEAN:C305(In_ButtSilver; $0)

//InButt_LPß
C_TEXT:C284(InButt_LPß; $1)
C_TEXT:C284(InButt_LPß; $2)
C_LONGINT:C283(InButt_LPß; $3)

//INBUTTSUBHANDLE
C_LONGINT:C283(inButtSubHandle; $1)
C_POINTER:C301(inButtSubHandle; $2)
C_TEXT:C284(inButtSubHandle; $3)

//INF_SETQUALITY
C_BOOLEAN:C305(INF_SetQuality; $0)
C_POINTER:C301(INF_SetQuality; $1)
C_LONGINT:C283(INF_SetQuality; $2)
C_LONGINT:C283(INF_SetQuality; $3)
C_TEXT:C284(INF_SetQuality; $4)
C_LONGINT:C283(INF_SetQuality; $5)
C_TEXT:C284(INF_SetQuality; $6)
C_TEXT:C284(INF_SetQuality; $7)
C_REAL:C285(INF_SetQuality; $8)
C_LONGINT:C283(INF_SetQuality; $9)
C_DATE:C307(INF_SetQuality; $10)

//INT_LOADFORMSIZES
C_REAL:C285(INT_LoadFormSizes; $1)
C_TEXT:C284(INT_LoadFormSizes; $2)

//INT_SELECTSKINS
C_REAL:C285(INT_SelectSkins; $1)
C_REAL:C285(INT_SelectSkins; $2)

//INT_SETINPUT
C_LONGINT:C283(INT_SetInput; $1)
C_TEXT:C284(INT_SetInput; $2)
C_POINTER:C301(INT_SetInput; $3)

//INT_SETOUTPUT
C_LONGINT:C283(INT_Setoutput; $1)
C_TEXT:C284(INT_Setoutput; $2)
C_POINTER:C301(INT_Setoutput; $3)
C_LONGINT:C283(INT_Setoutput; $4)


//Inv_PaySel2
C_BOOLEAN:C305(Inv_PaySel2; $1)
C_REAL:C285(Inv_PaySel2; $2)
C_LONGINT:C283(Inv_PaySel2; $3)

//INVFORMITEM
C_TEXT:C284(InvFormItem; $0)

//INVFORMSUBQTY
C_TEXT:C284(InvFormSubQty; $0)

//InvItems_InLPX
C_POINTER:C301(InvItems_InLPX; $1)

//Invoices_AASrch
C_BOOLEAN:C305(Invoices_AASrch; $0)

//Invoices_AASrchOnServer
C_DATE:C307(Invoices_AASrchOnServer; $1)
C_TEXT:C284(Invoices_AASrchOnServer; $2)

//Invoices_AD2
C_TEXT:C284(Invoices_AD2; $1)
C_POINTER:C301(Invoices_AD2; $2)

//Invoices_ADCalc
C_REAL:C285(Invoices_ADCalc; $1)

//Invoices_ADSRSt
C_DATE:C307(Invoices_ADSRSt; $1)

//Invoices_AllSr2
C_BOOLEAN:C305(Invoices_AllSr2; $0)

//Invoices_FormSR
C_LONGINT:C283(Invoices_FormSR; $1)

//Invoices_In
C_TEXT:C284(Invoices_In; $1)
C_TEXT:C284(Invoices_In; $2)
C_TEXT:C284(Invoices_In; $3)
C_TEXT:C284(Invoices_In; $4)

//Invoices_InLPß
C_TEXT:C284(Invoices_InLPß; $1)

//Invoices_InP
C_TEXT:C284(Invoices_InP; $1)
C_TEXT:C284(Invoices_InP; $2)
C_TEXT:C284(Invoices_InP; $3)

//Invoices_Pay2
C_BOOLEAN:C305(Invoices_Pay2; $1)
C_REAL:C285(Invoices_Pay2; $2)
C_LONGINT:C283(Invoices_Pay2; $3)

//Invoices_PaySel
C_BOOLEAN:C305(Invoices_PaySel; $1)
C_REAL:C285(Invoices_PaySel; $2)
C_LONGINT:C283(Invoices_PaySel; $3)

//Invoices_SelLP
C_LONGINT:C283(Invoices_SelLP; $0)
C_LONGINT:C283(Invoices_SelLP; $1)
C_LONGINT:C283(Invoices_SelLP; $2)
C_LONGINT:C283(Invoices_SelLP; $3)
C_POINTER:C301(Invoices_SelLP; $4)
C_POINTER:C301(Invoices_SelLP; $5)

//Invoices_SelP
C_REAL:C285(Invoices_SelP; $1)
C_POINTER:C301(Invoices_SelP; $2)
C_POINTER:C301(Invoices_SelP; $3)

//INV_ALLOCATIONCREATE
C_TEXT:C284(INV_AllocationCreate; $1)
C_TEXT:C284(INV_AllocationCreate; $2)
C_DATE:C307(INV_AllocationCreate; $3)
C_REAL:C285(INV_AllocationCreate; $4)
C_TEXT:C284(INV_AllocationCreate; $5)

//INV_CALCCLEAREDDATE
C_DATE:C307(INV_CalcClearedDate; $0)
C_TEXT:C284(INV_CalcClearedDate; $1)

//INV_CALCULATEALLOCATIONS
C_REAL:C285(INV_CalculateAllocations; $0)
C_TEXT:C284(INV_CalculateAllocations; $1)
C_BOOLEAN:C305(INV_CalculateAllocations; $2)

//INV_CHECKREMAINDER
C_TEXT:C284(INV_CheckRemainder; $1)

//INV_GETALLOCATIONS
C_TEXT:C284(INV_GetAllocations; $1)

//INV_IMPLEMENTCLEAREDDATE
C_BOOLEAN:C305(INV_ImplementClearedDate; $1)
C_LONGINT:C283(INV_ImplementClearedDate; $2)
C_LONGINT:C283(INV_ImplementClearedDate; $3)

//IPC_CLEARMESSAGEQUEUE
C_LONGINT:C283(IPC_ClearMessageQueue; $1)

//IPC_MESSAGESINQUEUE
C_LONGINT:C283(IPC_MessagesInQueue; $0)
C_LONGINT:C283(IPC_MessagesInQueue; $1)

//IPC_RCVMESSAGE
C_TEXT:C284(IPC_RcvMessage; $0)
C_LONGINT:C283(IPC_RcvMessage; $1)
C_LONGINT:C283(IPC_RcvMessage; $2)

//IPC_SENDMESSAGE
C_LONGINT:C283(IPC_SendMessage; $1)
C_TEXT:C284(IPC_SendMessage; $2)

//ISALEAPYEAR
C_BOOLEAN:C305(IsALeapYear; $0)
C_DATE:C307(IsALeapYear; $1)

//ISALLDIGITS
C_BOOLEAN:C305(isalldigits; $0)
C_TEXT:C284(isalldigits; $1)

//ISEMAILAVAILABLE
C_BOOLEAN:C305(IsEmailAvailable; $0)
C_BOOLEAN:C305(IsEmailAvailable; $1)

//IWS_ADDTORESPONSEHEADER
C_TEXT:C284(IWS_AddToResponseHeader; $1)
C_TEXT:C284(IWS_AddToResponseHeader; $2)

//IWS_ADDTOSTREAMARRAYS
C_LONGINT:C283(IWS_AddToStreamArrays; $1)

//IWS_ASCIITOBASE64
C_TEXT:C284(IWS_AsciiToBase64; $0)
C_TEXT:C284(IWS_AsciiToBase64; $1)

//IWS_BASE64TOASCII
C_TEXT:C284(IWS_Base64ToAscii; $0)
C_TEXT:C284(IWS_Base64ToAscii; $1)

//IWS_BYTESSENT
C_LONGINT:C283(IWS_BytesSent; $0)
C_LONGINT:C283(IWS_BytesSent; $1)

//IWS_CLOSESTREAM
C_LONGINT:C283(IWS_CloseStream; $0)
C_LONGINT:C283(IWS_CloseStream; $1)

//IWS_CONNECTIONSREFUSED
C_BOOLEAN:C305(IWS_ConnectionsRefused; $0)

//IWS_CURRENTTIMERFC
C_TEXT:C284(IWS_CurrentTimeRFC; $0)
C_LONGINT:C283(IWS_CurrentTimeRFC; $1)

//IWS_DOCLOG
C_TEXT:C284(IWS_DocLog; $1)

//IWS_DOCNORMALIZE
C_TEXT:C284(IWS_DocNormalize; $0)
C_TEXT:C284(IWS_DocNormalize; $1)

//IWS_DOCSEND
C_LONGINT:C283(IWS_DocSend; $1)

//IWS_DOTTEDIPADDRESS
C_TEXT:C284(IWS_DottedIPAddress; $0)
C_LONGINT:C283(IWS_DottedIPAddress; $1)

//IWS_GETDIRECT
C_TEXT:C284(IWS_GetDirect; $0)

//IWS_GETDOMAIN
C_TEXT:C284(IWS_GetDomain; $0)

//IWS_GETFILEEXTENSION
C_TEXT:C284(IWS_GetFileExtension; $0)
C_POINTER:C301(IWS_GetFileExtension; $1)
C_BOOLEAN:C305(IWS_GetFileExtension; $2)

//IWS_GETFILENAME
C_TEXT:C284(IWS_GetFilename; $0)

//IWS_GETFIRSTFREEHANDLERID
C_LONGINT:C283(IWS_GetFirstFreeHandlerID; $0)

//IWS_GETHANDLERCOUNT
C_LONGINT:C283(IWS_GetHandlerCount; $0)

//IWS_GETHEADERFIELD
C_TEXT:C284(IWS_GetHeaderField; $0)
C_TEXT:C284(IWS_GetHeaderField; $1)
C_TEXT:C284(IWS_GetHeaderField; $2)

//IWS_GETHTTPMETHOD
C_TEXT:C284(IWS_GetHTTPMethod; $0)

//IWS_GETHTTPVERSION
C_TEXT:C284(IWS_GetHTTPVersion; $0)

//IWS_GETLSCOOKIE
C_TEXT:C284(IWS_GetLSCookie; $0)
C_TEXT:C284(IWS_GetLSCookie; $1)
C_LONGINT:C283(IWS_GetLSCookie; $2)

//IWS_GETMIMEPARAMETER
C_TEXT:C284(IWS_GetMIMEParameter; $0)
C_TEXT:C284(IWS_GetMIMEParameter; $1)
C_TEXT:C284(IWS_GetMIMEParameter; $2)

//IWS_GETPAGE
C_TEXT:C284(IWS_GetPage; $0)
C_TEXT:C284(IWS_GetPage; $1)
C_TEXT:C284(IWS_GetPage; $2)
C_BOOLEAN:C305(IWS_GetPage; $3)

//IWS_GETPAGEOLD
C_TEXT:C284(IWS_GetPageOld; $0)
C_TEXT:C284(IWS_GetPageOld; $1)
C_TEXT:C284(IWS_GetPageOld; $2)
C_BOOLEAN:C305(IWS_GetPageOld; $3)

//IWS_GETSEARCH
C_TEXT:C284(IWS_GetSearch; $0)

//IWS_GETURL
C_TEXT:C284(IWS_GetURL; $0)

//IWS_HITINFO
C_LONGINT:C283(IWS_HitInfo; $1)

//IWS_ISDOTTEDADDRESS
C_BOOLEAN:C305(IWS_IsDottedAddress; $0)
C_TEXT:C284(IWS_IsDottedAddress; $1)

//IWS_LISTENSTREAM
C_LONGINT:C283(IWS_ListenStream; $0)

//IWS_LOCALIPADDRESS
C_TEXT:C284(IWS_LocalIPAddress; $0)

//IWS_LOGOPEN
C_BOOLEAN:C305(IWS_LOGOpen; $0)
C_TEXT:C284(IWS_LOGOpen; $1)

//IWS_LOGTHIS
C_TEXT:C284(IWS_LOGThis; $1)

//IWS_LOGTIMER
C_LONGINT:C283(IWS_LogTimer; $1)

//IWS_LOSTSTREAM
C_BOOLEAN:C305(IWS_LostStream; $0)
C_LONGINT:C283(IWS_LostStream; $1)

//IWS_MAILATTACHMENT
C_LONGINT:C283(IWS_MailAttachment; $1)
C_TEXT:C284(IWS_MailAttachment; $2)
C_TEXT:C284(IWS_MailAttachment; $3)

//IWS_MAILQUEUE
C_TEXT:C284(IWS_MailQueue; $1)

//IWS_MAILREMOVE
C_TEXT:C284(IWS_MailRemove; $0)
C_TEXT:C284(IWS_MailRemove; $1)

//IWS_PARAMFORM
C_TEXT:C284(IWS_ParamFORM; $0)
C_TEXT:C284(IWS_ParamFORM; $1)
C_TEXT:C284(IWS_ParamFORM; $2)
C_TEXT:C284(IWS_ParamFORM; $3)

//IWS_PARAMHTTP
C_TEXT:C284(IWS_ParamHTTP; $0)
C_TEXT:C284(IWS_ParamHTTP; $1)
C_TEXT:C284(IWS_ParamHTTP; $2)
C_LONGINT:C283(IWS_ParamHTTP; $3)

//IWS_PARAMURL
C_TEXT:C284(IWS_ParamURL; $0)
C_TEXT:C284(IWS_ParamURL; $1)
C_TEXT:C284(IWS_ParamURL; $2)
C_TEXT:C284(IWS_ParamURL; $3)

//IWS_PARSEHEADERBLOCK
C_TEXT:C284(IWS_ParseHeaderBlock; $1)
C_POINTER:C301(IWS_ParseHeaderBlock; $2)
C_POINTER:C301(IWS_ParseHeaderBlock; $3)

//IWS_PUTINMAILQUEUE
C_TEXT:C284(IWS_PutInMailQueue; $1)
C_PICTURE:C286(IWS_PutInMailQueue; $2)

//IWS_RCVIPCMESSAGE
C_TEXT:C284(IWS_RcvIPCMessage; $0)
C_LONGINT:C283(IWS_RcvIPCMessage; $1)
C_LONGINT:C283(IWS_RcvIPCMessage; $2)

//IWS_RECORDCLOSE
C_LONGINT:C283(IWS_RecordClose; $0)
C_LONGINT:C283(IWS_RecordClose; $1)

//IWS_RECORDCONNECT
C_LONGINT:C283(IWS_RecordConnect; $1)
C_LONGINT:C283(IWS_RecordConnect; $2)

//IWS_RECORDRELEASE
C_LONGINT:C283(IWS_RecordRelease; $0)
C_LONGINT:C283(IWS_RecordRelease; $1)

//IWS_RECORDSEND
C_LONGINT:C283(IWS_RecordSend; $0)

//IWS_RELEASESTREAM
C_LONGINT:C283(IWS_ReleaseStream; $0)
C_LONGINT:C283(IWS_ReleaseStream; $1)

//IWS_SENDIPCMESSAGE
C_LONGINT:C283(IWS_SendIPCMessage; $1)
C_TEXT:C284(IWS_SendIPCMessage; $2)

//IWS_SENDTEXT
//C_REAL(IWS_SendText ;$0)
//C_LONGINT(IWS_SendText ;$0)  `altered from real to long int  as part of adding ntk functionality
//IWS_SENDTEXT
//C_REAL(IWS_SendText ;$0)
C_LONGINT:C283(IWS_SendText; $0)  //altered from real to long int  as part of adding ntk functionality
C_LONGINT:C283(IWS_SendText; $1)
C_TEXT:C284(IWS_SendText; $2)
C_LONGINT:C283(IWS_SendText; $3)
//IWS_SENDTOCONNECTLOG
C_TEXT:C284(IWS_SendToConnectLog; $1)

//IWS_SENDTOLOG
C_TEXT:C284(IWS_SendToLog; $1)
C_BOOLEAN:C305(IWS_SendToLog; $2)

//IWS_SERVERISRUNNING
C_BOOLEAN:C305(IWS_ServerIsRunning; $0)

//IWS_SETMIMETYPE
C_TEXT:C284(IWS_SetMIMEType; $1)

//IWS_SETRESPONSEHEADER
C_LONGINT:C283(IWS_SetResponseHeader; $1)
C_TEXT:C284(IWS_SetResponseHeader; $2)
C_LONGINT:C283(IWS_SetResponseHeader; $3)
C_TEXT:C284(IWS_SetResponseHeader; $4)

//IWS_SETRESPONSEHEADERMINS
C_LONGINT:C283(IWS_SetResponseHeaderMins; $1)

//IWS_SMTPANSWER
C_LONGINT:C283(IWS_SMTPAnswer; $0)
C_LONGINT:C283(IWS_SMTPAnswer; $1)
C_LONGINT:C283(IWS_SMTPAnswer; $2)

//IWS_SMTPEXCHANGE
C_LONGINT:C283(IWS_SMTPExchange; $0)
C_LONGINT:C283(IWS_SMTPExchange; $1)
C_TEXT:C284(IWS_SMTPExchange; $2)
C_LONGINT:C283(IWS_SMTPExchange; $3)

//IWS_SMTPMESSAGE
C_LONGINT:C283(IWS_SMTPMessage; $0)
C_TEXT:C284(IWS_SMTPMessage; $1)
C_TEXT:C284(IWS_SMTPMessage; $2)
C_TEXT:C284(IWS_SMTPMessage; $3)
C_TEXT:C284(IWS_SMTPMessage; $4)
C_TEXT:C284(IWS_SMTPMessage; $5)
C_TEXT:C284(IWS_SMTPMessage; $6)
C_TEXT:C284(IWS_SMTPMessage; $7)

//IWS_SMTPMESSAGE2
C_LONGINT:C283(IWS_SMTPMessage2; $0)
C_TEXT:C284(IWS_SMTPMessage2; $1)
C_TEXT:C284(IWS_SMTPMessage2; $2)
C_TEXT:C284(IWS_SMTPMessage2; $3)
C_TEXT:C284(IWS_SMTPMessage2; $4)
C_TEXT:C284(IWS_SMTPMessage2; $5)
C_TEXT:C284(IWS_SMTPMessage2; $6)
C_TEXT:C284(IWS_SMTPMessage2; $7)

//IWS_SMTPMESSAGEBG
C_LONGINT:C283(IWS_SMTPMessageBG; $0)
C_TEXT:C284(IWS_SMTPMessageBG; $1)
C_TEXT:C284(IWS_SMTPMessageBG; $2)
C_TEXT:C284(IWS_SMTPMessageBG; $3)
C_TEXT:C284(IWS_SMTPMessageBG; $4)
C_TEXT:C284(IWS_SMTPMessageBG; $5)
C_TEXT:C284(IWS_SMTPMessageBG; $6)
C_TEXT:C284(IWS_SMTPMessageBG; $7)

//IWS_SMTPMESSAGEMULTIPART
C_LONGINT:C283(IWS_SMTPMessageMultiPart; $0)
C_TEXT:C284(IWS_SMTPMessageMultiPart; $1)
C_TEXT:C284(IWS_SMTPMessageMultiPart; $2)
C_TEXT:C284(IWS_SMTPMessageMultiPart; $3)
C_TEXT:C284(IWS_SMTPMessageMultiPart; $4)
C_TEXT:C284(IWS_SMTPMessageMultiPart; $5)
C_TEXT:C284(IWS_SMTPMessageMultiPart; $6)

//IWS_STOPWEBSERVER
C_TEXT:C284(IWS_StopWebServer; $1)

//IWS_STREAMCLOSED
C_BOOLEAN:C305(IWS_StreamClosed; $0)
C_LONGINT:C283(IWS_StreamClosed; $1)

//IWS_STREAMCONNECTED
C_BOOLEAN:C305(IWS_StreamConnected; $0)
C_LONGINT:C283(IWS_StreamConnected; $1)

//IWS_STREAMSTATUS
C_LONGINT:C283(IWS_StreamStatus; $0)
C_LONGINT:C283(IWS_StreamStatus; $1)
C_LONGINT:C283(IWS_StreamStatus; $2)

//IWS_WAITFORHANDLERPAUSE
C_LONGINT:C283(IWS_WaitForHandlerPause; $1)

//IWS_WAITFORPROCESSPAUSE
C_LONGINT:C283(IWS_WaitForProcessPause; $1)

//IWS_WINOPEN
C_TEXT:C284(IWS_WinOpen; $1)

//JobPers_InLPX
C_POINTER:C301(JobPers_InLPX; $1)

//JobPers_SelP
C_LONGINT:C283(JobPers_SelP; $1)
C_POINTER:C301(JobPers_SelP; $2)
C_POINTER:C301(JobPers_SelP; $3)

//Jobs_In
C_TEXT:C284(Jobs_In; $1)
C_TEXT:C284(Jobs_In; $2)
C_TEXT:C284(Jobs_In; $3)
C_TEXT:C284(Jobs_In; $4)



//Jobs_InLPB
C_BOOLEAN:C305(Jobs_InLPB; $0)

//Jobs_InLPOI
C_LONGINT:C283(Jobs_InLPOI; $1)

//Jobs_INLPX
C_POINTER:C301(Jobs_INLPX; $1)

//Jobs_InvWIP2
C_TEXT:C284(Jobs_InvWIP2; $1)
C_TEXT:C284(Jobs_InvWIP2; $2)
C_REAL:C285(Jobs_InvWIP2; $3)
C_DATE:C307(Jobs_InvWIP2; $4)
C_TEXT:C284(Jobs_InvWIP2; $5)

//Jobs_MenV
C_LONGINT:C283(Jobs_MenV; $1)
C_LONGINT:C283(Jobs_MenV; $2)

//Jobs_SelLP
C_LONGINT:C283(Jobs_SelLP; $0)
C_LONGINT:C283(Jobs_SelLP; $1)
C_LONGINT:C283(Jobs_SelLP; $2)
C_LONGINT:C283(Jobs_SelLP; $3)
C_POINTER:C301(Jobs_SelLP; $4)
C_POINTER:C301(Jobs_SelLP; $5)

//Jobs_SelP
C_LONGINT:C283(Jobs_SelP; $1)
C_POINTER:C301(Jobs_SelP; $2)
C_POINTER:C301(Jobs_SelP; $3)

//Jobs_WIPCheck
C_BOOLEAN:C305(Jobs_WIPCheck; $0)

//Jobs_WIPPost
C_TEXT:C284(Jobs_WIPPost; $1)
C_TEXT:C284(Jobs_WIPPost; $2)
C_DATE:C307(Jobs_WIPPost; $3)
C_TEXT:C284(Jobs_WIPPost; $4)

//Jobs_WIPStart
C_TEXT:C284(Jobs_WIPStart; $1)
C_DATE:C307(Jobs_WIPStart; $2)


//JobsI_DelBut
C_LONGINT:C283(JobsI_DelBut; $1)

//JobStages_InLOI
C_TEXT:C284(JobStages_InLOI; $1)
C_LONGINT:C283(JobStages_InLOI; $2)

//JobStages_inLPX
C_POINTER:C301(JobStages_inLPX; $1)
C_TEXT:C284(JobStages_inLPX; $2)

//JobStages_SelP
C_LONGINT:C283(JobStages_SelP; $1)
C_POINTER:C301(JobStages_SelP; $2)
C_POINTER:C301(JobStages_SelP; $3)

//JobsTC_JobCheck
C_POINTER:C301(JobsTC_JobCheck; $1)
C_BOOLEAN:C305(JobsTC_JobCheck; $2)


//JOB_LOADSTAGES
C_TEXT:C284(JOB_LoadStages; $1)
C_LONGINT:C283(JOB_LoadStages; $2)



//Join_SelCU
C_POINTER:C301(Join_SelCU; $1)
C_POINTER:C301(Join_SelCU; $2)

//Join_SelDV
C_POINTER:C301(Join_SelDV; $1)
C_POINTER:C301(Join_SelDV; $2)
C_POINTER:C301(Join_SelDV; $3)
C_POINTER:C301(Join_SelDV; $4)
C_LONGINT:C283(Join_SelDV; $5)

//Join_SelFast
C_POINTER:C301(Join_SelFast; $1)
C_POINTER:C301(Join_SelFast; $2)
C_POINTER:C301(Join_SelFast; $3)
C_POINTER:C301(Join_SelFast; $4)
C_LONGINT:C283(Join_SelFast; $5)

//Join_SelFastSub
C_POINTER:C301(Join_SelFastSub; $1)
C_POINTER:C301(Join_SelFastSub; $2)
C_POINTER:C301(Join_SelFastSub; $3)
C_POINTER:C301(Join_SelFastSub; $4)
C_POINTER:C301(Join_SelFastSub; $5)

//JPR_INLPX
C_POINTER:C301(JPR_inLPX; $1)

//JPR_SELECTJOBROLE
C_TEXT:C284(JPR_SelectJobRole; $0)
C_POINTER:C301(JPR_SelectJobRole; $1)

//JST_LOADPERSONS
C_TEXT:C284(JST_LoadPersons; $1)
C_TEXT:C284(JST_LoadPersons; $2)

//Keyword_Create
C_TEXT:C284(Keyword_Create; $1)
C_TEXT:C284(Keyword_Create; $2)
C_TEXT:C284(Keyword_Create; $3)

//Keyword_Create2
C_TEXT:C284(Keyword_Create2; $1)
C_TEXT:C284(Keyword_Create2; $2)
C_TEXT:C284(Keyword_Create2; $3)

//Keyword_Del
C_TEXT:C284(Keyword_Del; $1)
C_TEXT:C284(Keyword_Del; $2)

//Keyword_Del2
C_TEXT:C284(Keyword_Del2; $1)
C_TEXT:C284(Keyword_Del2; $2)

//Keyword_Find
C_LONGINT:C283(Keyword_Find; $0)
C_TEXT:C284(Keyword_Find; $1)
C_TEXT:C284(Keyword_Find; $2)
C_TEXT:C284(Keyword_Find; $3)
C_LONGINT:C283(Keyword_Find; $4)
C_LONGINT:C283(Keyword_Find; $5)
C_TEXT:C284(Keyword_Find; $6)

//Keyword_Find2
C_LONGINT:C283(Keyword_Find2; $0)
C_TEXT:C284(Keyword_Find2; $1)
C_TEXT:C284(Keyword_Find2; $2)
C_TEXT:C284(Keyword_Find2; $3)
C_LONGINT:C283(Keyword_Find2; $4)
C_LONGINT:C283(Keyword_Find2; $5)
C_TEXT:C284(Keyword_Find2; $6)

//LAB_BUILDADDRESS
C_TEXT:C284(LAB_BuildAddress; $0)
C_TEXT:C284(LAB_BuildAddress; $1)
C_TEXT:C284(LAB_BuildAddress; $2)
C_TEXT:C284(LAB_BuildAddress; $3)
C_TEXT:C284(LAB_BuildAddress; $4)
C_TEXT:C284(LAB_BuildAddress; $5)
C_TEXT:C284(LAB_BuildAddress; $6)

//LASTWORD2
C_TEXT:C284(LastWord2; $0)
C_TEXT:C284(LastWord2; $1)

//Layer_Fill
C_POINTER:C301(Layer_Fill; $1)

//Layer_InDDef
C_POINTER:C301(Layer_InDDef; $1)

//Layouts_Create
C_TEXT:C284(Layouts_Create; $1)
C_LONGINT:C283(Layouts_Create; $2)
C_LONGINT:C283(Layouts_Create; $3)
C_TEXT:C284(Layouts_Create; $4)
C_TEXT:C284(Layouts_Create; $5)
C_LONGINT:C283(Layouts_Create; $6)
C_LONGINT:C283(Layouts_Create; $7)
C_BOOLEAN:C305(Layouts_Create; $8)
C_BOOLEAN:C305(Layouts_Create; $9)
C_TEXT:C284(Layouts_Create; $10)
C_LONGINT:C283(Layouts_Create; $11)
C_TEXT:C284(Layouts_Create; $12)
C_LONGINT:C283(Layouts_Create; $13)

//Layouts_Type
C_TEXT:C284(Layouts_Type; $0)
C_POINTER:C301(Layouts_Type; $1)

//Let_No
C_TEXT:C284(Let_No; $1)

//Letter_AllDets
C_BOOLEAN:C305(Letter_AllDets; $1)

//Letter_Alloc
C_TEXT:C284(Letter_Alloc; $1)
C_TEXT:C284(Letter_Alloc; $2)

//Letter_AllocD
C_TEXT:C284(Letter_AllocD; $1)

//Letter_Email
C_LONGINT:C283(Letter_Email; $0)

//Letter_Entries
C_TEXT:C284(Letter_Entries; $0)

//Letter_FaxSetup
C_LONGINT:C283(Letter_FaxSetup; $0)
C_BOOLEAN:C305(Letter_FaxSetup; $1)

//Letter_LoadD
C_BOOLEAN:C305(Letter_LoadD; $0)
C_BOOLEAN:C305(Letter_LoadD; $1)
C_POINTER:C301(Letter_LoadD; $2)

//Letter_LoadI
C_BOOLEAN:C305(Letter_LoadI; $0)
C_BOOLEAN:C305(Letter_LoadI; $1)
C_POINTER:C301(Letter_LoadI; $2)

//Letter_Merge
C_POINTER:C301(Letter_Merge; $1)

//Letter_Print
C_TEXT:C284(Letter_Print; $1)
C_LONGINT:C283(Letter_Print; $2)

//Letter_Replace
C_BOOLEAN:C305(Letter_Replace; $1)

//Letters_FileI
C_TEXT:C284(Letters_FileI; $0)
C_BOOLEAN:C305(Letters_FileI; $1)

//Letters_In
C_TEXT:C284(Letters_In; $0)
C_TEXT:C284(Letters_In; $1)
C_REAL:C285(Letters_In; $2)

//Letters_InSWTyp
C_TEXT:C284(Letters_InSWTyp; $0)

//Letters_LayCode
C_BOOLEAN:C305(Letters_LayCode; $0)

//Letters_Mod
C_TEXT:C284(Letters_Mod; $1)

//Letters_Sel2
C_TEXT:C284(Letters_Sel2; $1)

//Letters_SWMerAL
C_POINTER:C301(Letters_SWMerAL; $1)

//LETTERS WRITE
C_TEXT:C284(Documents_4DWriteAccessType; $0)
C_BOOLEAN:C305(Documents_4DWriteAccessType; $1)

//LET_SELECTTEMPLATE
C_TEXT:C284(Let_selectTemplate; $1)
C_TEXT:C284(Let_selectTemplate; $2)
C_TEXT:C284(Let_selectTemplate; $3)

//LICENCE_TEXTACCEPT
C_BOOLEAN:C305(Licence_TextAccept; $0)

//LM_PRINTLISTITEMS
C_REAL:C285(LM_PrintListItems; $1)

//Load_Many
C_POINTER:C301(Load_Many; $1)
C_POINTER:C301(Load_Many; $2)
C_TEXT:C284(Load_Many; $3)

//Load_ManyFast
C_POINTER:C301(Load_ManyFast; $1)
C_POINTER:C301(Load_ManyFast; $2)
C_TEXT:C284(Load_ManyFast; $3)
C_POINTER:C301(Load_ManyFast; $4)
C_POINTER:C301(Load_ManyFast; $5)

//Load_ManyI
C_POINTER:C301(Load_ManyI; $1)
C_POINTER:C301(Load_ManyI; $2)
C_TEXT:C284(Load_ManyI; $3)
C_POINTER:C301(Load_ManyI; $4)
C_POINTER:C301(Load_ManyI; $5)

//Load_ManyIN
C_POINTER:C301(Load_ManyIN; $1)
C_POINTER:C301(Load_ManyIN; $2)
C_TEXT:C284(Load_ManyIN; $3)
C_POINTER:C301(Load_ManyIN; $4)
C_POINTER:C301(Load_ManyIN; $5)

//Load_ManyINS
C_POINTER:C301(Load_ManyINS; $1)
C_POINTER:C301(Load_ManyINS; $2)
C_POINTER:C301(Load_ManyINS; $3)
C_POINTER:C301(Load_ManyINS; $4)
C_LONGINT:C283(Load_ManyINS; $5)

//Load_One
C_POINTER:C301(Load_One; $1)
C_POINTER:C301(Load_One; $2)
C_TEXT:C284(Load_One; $3)

//Load_OneFast
C_POINTER:C301(Load_OneFast; $1)
C_POINTER:C301(Load_OneFast; $2)
C_POINTER:C301(Load_OneFast; $3)
C_POINTER:C301(Load_OneFast; $4)
C_TEXT:C284(Load_OneFast; $5)

//LOADDIARYACCESS
C_TEXT:C284(LoadDiaryAccess; $1)

//MACINTOSH
C_BOOLEAN:C305(Macintosh; $0)

//MACRO
C_TEXT:C284(Macro; $1)
C_TEXT:C284(Macro; $2)

//Macro_AccType
C_TEXT:C284(Macro_AccType; $1)
C_BOOLEAN:C305(Macro_AccType; $2)

//Macro_AccTypeFF
C_TEXT:C284(Macro_AccTypeFF; $1)

//Macro_AccTypePt
C_POINTER:C301(Macro_AccTypePt; $1)

//Macro_Import
C_POINTER:C301(Macro_Import; $1)
C_POINTER:C301(Macro_Import; $2)
C_LONGINT:C283(Macro_Import; $3)
C_TEXT:C284(Macro_Import; $4)

//MACRO LIST


//Macro_Load
C_TEXT:C284(Macro_Load; $1)

//Macro_Result
C_REAL:C285(Macro_Result; $0)
C_TEXT:C284(Macro_Result; $1)
C_TEXT:C284(Macro_Result; $2)

//Macro_ResultTxt
C_TEXT:C284(Macro_ResultTxt; $0)
C_TEXT:C284(Macro_ResultTxt; $1)
C_TEXT:C284(Macro_ResultTxt; $2)

//Macro_Text
C_TEXT:C284(Macro_Text; $0)
C_TEXT:C284(Macro_Text; $1)

//Macro_translate
C_TEXT:C284(Macro_translate; $0)
C_TEXT:C284(Macro_translate; $1)

//MACRO2
C_TEXT:C284(Macro2; ${5})
C_TEXT:C284(Macro2; $1)
C_TEXT:C284(Macro2; $2)
C_TEXT:C284(Macro2; $3)
C_LONGINT:C283(Macro2; $4)

C_TEXT:C284(Macro2; $5)
C_TEXT:C284(Macro2; $6)

//Macros_File
C_BOOLEAN:C305(Macros_File; $0)

//Macros_InLPA
C_TEXT:C284(Macros_InLPA; $1)

//MACRO_BUTTON
C_LONGINT:C283(Macro_button; $1)
C_LONGINT:C283(Macro_button; $2)
C_LONGINT:C283(Macro_button; $3)

//MACRO_CLICK
C_LONGINT:C283(Macro_Click; $1)
C_LONGINT:C283(Macro_Click; $2)
C_LONGINT:C283(Macro_Click; $3)

//MACRO_CONFIRM
C_TEXT:C284(Macro_Confirm; $1)

//MACRO_CONVERTMODULUSCALLS
C_TEXT:C284(Macro_ConvertModulusCalls; $0)
C_TEXT:C284(Macro_ConvertModulusCalls; $1)

//MACRO_CURRENTVERSIONCHECK
C_LONGINT:C283(Macro_CurrentVersionCheck; $0)
C_LONGINT:C283(Macro_CurrentVersionCheck; $1)

//MACRO_DOUBLECLICK
C_LONGINT:C283(Macro_DoubleClick; $1)
C_LONGINT:C283(Macro_DoubleClick; $2)
C_LONGINT:C283(Macro_DoubleClick; $3)

//MACRO_EXPORTCONVERSION
C_TEXT:C284(MAcro_exportConVersion; $1)

//MACRO_IMAPLAY
C_TEXT:C284(Macro_IMAPLAY; $1)

//MACRO_ITXPLAY
C_TEXT:C284(Macro_ITXPLAY; $1)

//MACRO_KEY
C_TEXT:C284(MACRO_KEY; $1)
C_LONGINT:C283(MACRO_KEY; $2)

//MACRO_MESSAGEPLAY
C_TEXT:C284(Macro_MessagePLAY; $1)

//MACRO_PLATFORMTRANSLATE
C_TEXT:C284(Macro_PlatformTranslate; $0)
C_POINTER:C301(Macro_PlatformTranslate; $1)
C_REAL:C285(Macro_PlatformTranslate; $2)

//MACRO_REPLY
C_TEXT:C284(Macro_Reply; $1)

//MACRO_SETSTATUSCONSTANTS
C_BOOLEAN:C305(MACRO_SetStatusConstants; $0)

//MACRO_TRANSLATE4DWRITE
C_TEXT:C284(MACRO_Translate4DWrite; $0)
C_TEXT:C284(MACRO_Translate4DWrite; $1)

//MACRO_TRANSLATEFIELDNAMES
C_TEXT:C284(Macro_translateFieldNames; $0)
C_TEXT:C284(Macro_translateFieldNames; $1)

//MACRO_WAIT
C_LONGINT:C283(MACRO_Wait; $1)

//MACRO_WAITFORSTATE
C_LONGINT:C283(Macro_WaitForState; $1)

//Mail_LetAlloc
C_TEXT:C284(Mail_LetAlloc; $1)

//Mail_MSOFN
C_TEXT:C284(Mail_MSOFN; $1)

//MailP_LabCC
C_POINTER:C301(MailP_LabCC; $1)
C_POINTER:C301(MailP_LabCC; $2)

//MailP_Let
C_POINTER:C301(MailP_Let; $1)

//MailP_Ready
C_TEXT:C284(MailP_Ready; $1)

//MAILP_LET_GROUPEDEMAIL
C_REAL:C285(MailP_Let_GroupedEmail; $1)

//MAILP_LET_MAKEEMAIL
C_LONGINT:C283(MailP_let_MakeEmail; $1)
C_BOOLEAN:C305(MailP_let_MakeEmail; $2)
C_TEXT:C284(MailP_let_MakeEmail; $3)

//MAILP_LET_NAMEPDF
C_TEXT:C284(MailP_Let_namepdf; $0)
C_LONGINT:C283(MailP_Let_namepdf; $1)
C_TEXT:C284(MailP_Let_namepdf; $2)

//Master_UseSS
C_POINTER:C301(Master_UseSS; $1)

//MASTER2
C_POINTER:C301(Master2; $1)

//MComp_Add
C_TEXT:C284(MComp_Add; $1)

//MCont_Add
C_TEXT:C284(MCont_Add; $1)

//Menu_FileSG
C_LONGINT:C283(Menu_FileSG; $0)

//Menu_ModBarButt
C_LONGINT:C283(Menu_ModBarButt; $1)

//Menu_ModChkIcon
C_LONGINT:C283(Menu_ModChkIcon; $0)
C_LONGINT:C283(Menu_ModChkIcon; $1)

//Menu_ModPalSt
C_LONGINT:C283(Menu_ModPalSt; $0)

//Menu_Record
C_TEXT:C284(Menu_Record; $1)
C_TEXT:C284(Menu_Record; $2)

//Menu_RecordITEM
C_TEXT:C284(Menu_RecordItem; $1)
C_LONGINT:C283(Menu_RecordItem; $2)

//Menu_RecordPop
C_TEXT:C284(Menu_RecordPop; $1)
C_LONGINT:C283(Menu_RecordPop; $2)

//Menu_Windows
C_LONGINT:C283(Menu_Windows; $1)

//Minor_Del
C_POINTER:C301(Minor_Del; $1)

//Minor_DelCU
C_POINTER:C301(Minor_DelCU; $1)
C_POINTER:C301(Minor_DelCU; $2)

//Minor_DelEx
C_POINTER:C301(Minor_DelEx; $1)
C_POINTER:C301(Minor_DelEx; $2)
C_TEXT:C284(Minor_DelEx; $3)

//Minor_DelExCU
C_POINTER:C301(Minor_DelExCU; $1)
C_POINTER:C301(Minor_DelExCU; $2)
C_TEXT:C284(Minor_DelExCU; $3)

//Minor_DelNoCan
C_POINTER:C301(Minor_DelNoCan; $1)

//Minor_DelRecords
C_POINTER:C301(Minor_DelRecords; $1)
C_POINTER:C301(Minor_DelRecords; $2)
C_TEXT:C284(Minor_DelRecords; $3)

//Minor_DelSECU
C_POINTER:C301(Minor_DelSECU; $1)
C_POINTER:C301(Minor_DelSECU; $2)
C_TEXT:C284(Minor_DelSECU; $3)

//Minor_DelSet
C_POINTER:C301(Minor_DelSet; $1)
C_TEXT:C284(Minor_DelSet; $2)

//Minor_DelSetEx
C_POINTER:C301(Minor_DelSetEx; $1)
C_POINTER:C301(Minor_DelSetEx; $2)
C_TEXT:C284(Minor_DelSetEx; $3)
C_TEXT:C284(Minor_DelSetEx; $4)

//Minor_DelSin
C_POINTER:C301(Minor_DelSin; $1)

//Minor_DelSinCU
C_POINTER:C301(Minor_DelSinCU; $1)
C_POINTER:C301(Minor_DelSinCU; $2)

//Minor_DelSinEx
C_POINTER:C301(Minor_DelSinEx; $1)
C_POINTER:C301(Minor_DelSinEx; $2)
C_TEXT:C284(Minor_DelSinEx; $3)

//Minor_DeleteSingleRecord
C_POINTER:C301(Minor_DeleteSingleRecord; $1)
C_POINTER:C301(Minor_DeleteSingleRecord; $2)
C_TEXT:C284(Minor_DeleteSingleRecord; $3)

//Minor_In
C_OBJECT:C1216(Minor_In; $1)
C_TEXT:C284(Minor_In; $2)
C_TEXT:C284(Minor_In; $3)

//Minor_LP
C_POINTER:C301(Minor_LP; $1)
C_POINTER:C301(Minor_LP; $2)
C_POINTER:C301(Minor_LP; $3)
C_TEXT:C284(Minor_LP; $4)
C_TEXT:C284(Minor_LP; $5)
C_TEXT:C284(Minor_LP; $6)
C_TEXT:C284(Minor_LP; $7)
C_TEXT:C284(Minor_LP; $8)

//Minor_LP_Ex
C_POINTER:C301(Minor_LP_Ex; $1)
C_POINTER:C301(Minor_LP_Ex; $2)
C_POINTER:C301(Minor_LP_Ex; $3)
C_POINTER:C301(Minor_LP_Ex; $4)
C_TEXT:C284(Minor_LP_Ex; $5)
C_TEXT:C284(Minor_LP_Ex; $6)
C_TEXT:C284(Minor_LP_Ex; $7)

//Minor_Mod
C_POINTER:C301(Minor_Mod; $1)
C_TEXT:C284(Minor_Mod; $2)
C_TEXT:C284(Minor_Mod; $3)

//Minor_ModName
C_BOOLEAN:C305(Minor_ModName; $0)
C_POINTER:C301(Minor_ModName; $1)
C_TEXT:C284(Minor_ModName; $2)
C_TEXT:C284(Minor_ModName; $3)
C_TEXT:C284(Minor_ModName; $4)

//Minor_Sel
C_POINTER:C301(Minor_Sel; $1)
C_POINTER:C301(Minor_Sel; $2)
C_POINTER:C301(Minor_Sel; $3)

//Minor_SelP
C_POINTER:C301(Minor_SelP; $1)
C_POINTER:C301(Minor_SelP; $2)
C_POINTER:C301(Minor_SelP; $3)



//Module_First
C_LONGINT:C283(Module_First; $1)

//Modules_ArrApp
C_TEXT:C284(Modules_ArrApp; $1)

//Modules_ArrDisp
C_TEXT:C284(Modules_ArrDisp; $1)

//Modules_MenuExe
C_TEXT:C284(Modules_MenuExe; $1)

//MONTHDATE
C_DATE:C307(MonthDate; $0)
C_DATE:C307(MonthDate; $1)
C_LONGINT:C283(MonthDate; $2)
C_LONGINT:C283(MonthDate; $3)

//MONTHNAME
C_TEXT:C284(MonthName; $0)
C_DATE:C307(MonthName; $1)

//Move_InTypeChk
C_TEXT:C284(Move_InTypeChk; $0)

//Move_PostItem
C_POINTER:C301(Move_PostItem; $1)
C_LONGINT:C283(Move_PostItem; $2)
C_POINTER:C301(Move_PostItem; $3)

//Move_PostLev
C_POINTER:C301(Move_PostLev; $1)
C_LONGINT:C283(Move_PostLev; $2)

//Move_PostLevArr
C_POINTER:C301(Move_PostLevArr; $1)
C_LONGINT:C283(Move_PostLevArr; $2)

//Move_PostLevCur
C_POINTER:C301(Move_PostLevCur; $1)
C_LONGINT:C283(Move_PostLevCur; $2)

//MOVE_TO_ARCHIVE
C_TEXT:C284(MOVE_TO_ARCHIVE; $1)
C_TEXT:C284(MOVE_TO_ARCHIVE; $2)

//Movements_File
C_BOOLEAN:C305(Movements_File; $0)

//Movements_Mod
C_TEXT:C284(Movements_Mod; $1)
C_TEXT:C284(Movements_Mod; $2)
C_TEXT:C284(Movements_Mod; $3)
C_TEXT:C284(Movements_Mod; $4)
C_TEXT:C284(Movements_Mod; $5)
C_TEXT:C284(Movements_Mod; $6)

//Movements_Sel2
C_TEXT:C284(Movements_Sel2; $1)

//Movements_SelLP
C_LONGINT:C283(Movements_SelLP; $0)
C_LONGINT:C283(Movements_SelLP; $1)

//Movements_SelP
C_LONGINT:C283(Movements_SelP; $1)
C_POINTER:C301(Movements_SelP; $2)
C_POINTER:C301(Movements_SelP; $3)

//MoveType_No_OLDSTYLE
C_TEXT:C284(MoveType_No_OLDSTYLE; $0)

//MOVETYPECODEBREAKOUT
C_LONGINT:C283(MoveTypeCodeBreakout; $0)
C_TEXT:C284(MoveTypeCodeBreakout; $1)
C_TEXT:C284(MoveTypeCodeBreakout; $2)
C_TEXT:C284(MoveTypeCodeBreakout; $3)

//MovementTypes_No
C_TEXT:C284(MovementTypes_No; $0)
C_LONGINT:C283(MovementTypes_No; $1)
C_TEXT:C284(MovementTypes_No; $2)
C_TEXT:C284(MoveTypesNo; $3)
C_TEXT:C284(MoveTypesNo; $4)

//MOVETYPES_NO_PROCESS
C_LONGINT:C283(MOVETYPES_NO_PROCESS; $1)
C_TEXT:C284(MOVETYPES_NO_PROCESS; $2)
C_LONGINT:C283(MOVETYPES_NO_PROCESS; $3)
C_TEXT:C284(MOVETYPES_NO_PROCESS; $4)
C_TEXT:C284(MOVETYPES_NO_PROCESS; $5)
C_TEXT:C284(MOVETYPES_NO_PROCESS; $6)

//MP_MODIFYDIARYACCESS
C_LONGINT:C283(MP_ModifyDiaryAccess; $1)
C_LONGINT:C283(MP_ModifyDiaryAccess; $2)

//NANFIXER
C_LONGINT:C283(NaNFixer; $1)

//NEWGENCODEPREF
C_TEXT:C284(NewGenCodePref; $0)
C_LONGINT:C283(NewGenCodePref; $1)
C_POINTER:C301(NewGenCodePref; $2)
C_TEXT:C284(NewGenCodePref; $3)
C_TEXT:C284(NewGenCodePref; $4)

//NULL


//Num_Words
C_TEXT:C284(Num_Words; $0)
C_REAL:C285(Num_Words; $1)

//Num_Words2
C_TEXT:C284(Num_Words2; $0)
C_LONGINT:C283(Num_Words2; $1)

//NUM2
C_REAL:C285(Num2; $0)
C_TEXT:C284(Num2; $1)

//OLDMOVETYPESINPROCESS
C_LONGINT:C283(OLDMOVETYPESINPROCESS; $1)
C_TEXT:C284(OLDMOVETYPESINPROCESS; $2)
C_LONGINT:C283(OLDMOVETYPESINPROCESS; $3)
C_TEXT:C284(OLDMOVETYPESINPROCESS; $4)
C_TEXT:C284(OLDMOVETYPESINPROCESS; $5)
C_TEXT:C284(OLDMOVETYPESINPROCESS; $6)

//Open_Any_Window
C_LONGINT:C283(Open_Any_Window; $1)
C_LONGINT:C283(Open_Any_Window; $2)
C_LONGINT:C283(Open_Any_Window; $3)
C_TEXT:C284(Open_Any_Window; $4)

//Open_AnyTypeWindow
C_LONGINT:C283(Open_AnyTypeWindow; $1)
C_LONGINT:C283(Open_AnyTypeWindow; $2)
C_LONGINT:C283(Open_AnyTypeWindow; $3)
C_TEXT:C284(Open_AnyTypeWindow; $4)
C_TEXT:C284(Open_AnyTypeWindow; $5)
C_POINTER:C301(Open_AnyTypeWindow; $6)
C_TEXT:C284(Open_AnyTypeWindow; $7)

//Open_Flo_Window
C_TEXT:C284(Open_Flo_Window; $1)

//Open_PrD_Window
C_TEXT:C284(Open_PrD_Window; $1)
C_TEXT:C284(Open_PrD_Window; $2)

//Open_Pro_Window
C_TEXT:C284(Open_Pro_Window; $1)
C_LONGINT:C283(Open_Pro_Window; $2)
C_LONGINT:C283(Open_Pro_Window; $3)
C_POINTER:C301(Open_Pro_Window; $4)
C_TEXT:C284(Open_Pro_Window; $5)
C_TEXT:C284(Open_Pro_Window; $6)

//Open_Rel_Window
C_TEXT:C284(Open_Rel_Window; $1)
C_TEXT:C284(Open_Rel_Window; $2)

//OPEN_THERMOMETER
C_LONGINT:C283(OPEN_THERMOMETER; $0)
C_TEXT:C284(OPEN_THERMOMETER; $1)

//OPEN_THERMOMETER1
C_TEXT:C284(OPEN_THERMOMETER1; $1)

//OrdDel_CheckNec
C_BOOLEAN:C305(OrdDel_CheckNec; $0)

//OrdDel_StkPNegS
C_BOOLEAN:C305(OrdDel_StkPNegS; $0)

//Order_TitCheck
C_TEXT:C284(Order_TitCheck; $1)

//Order_TitUp2
C_TEXT:C284(Order_TitUp2; $1)

//OrderI_AllocAu1
C_BOOLEAN:C305(OrderI_AllocAu1; $0)

//OrderI_AllocAu2
C_TEXT:C284(OrderI_AllocAu2; $0)

//OrderI_AllocSrc
C_BOOLEAN:C305(OrderI_AllocSrc; $0)

//OrderI_AllOIUp2
C_TEXT:C284(OrderI_AllOIUp2; $1)
C_LONGINT:C283(OrderI_AllOIUp2; $2)

//OrderI_BunCost
C_LONGINT:C283(OrderI_BunCost; $1)

//OrderI_DelBut
C_TEXT:C284(OrderI_DelBut; $1)

//OrderI_FormLP
C_TEXT:C284(OrderI_FormLP; $0)

//OrderI_InLPX
C_POINTER:C301(OrderI_InLPX; $1)
C_POINTER:C301(OrderI_InLPX; $2)

//OrderI_LevelCr
C_TEXT:C284(OrderI_LevelCr; $1)

//OrderI_LevelSrc
C_LONGINT:C283(OrderI_LevelSrc; $1)

//OrderI_SelLP
C_LONGINT:C283(OrderI_SelLP; $0)
C_LONGINT:C283(OrderI_SelLP; $1)

//OrderI_SelP
C_LONGINT:C283(OrderI_SelP; $1)
C_POINTER:C301(OrderI_SelP; $2)
C_POINTER:C301(OrderI_SelP; $3)

//OrderI_SplitSrc
C_BOOLEAN:C305(OrderI_SplitSrc; $0)

//OrderI_SubLPSup
C_BOOLEAN:C305(OrderI_SubLPSup; $0)

//OrderI_SubPTA
C_POINTER:C301(OrderI_SubPTA; $1)
C_TEXT:C284(OrderI_SubPTA; $2)

//Orders_Date
C_DATE:C307(Orders_Date; $0)

//Orders_FormSR
C_TEXT:C284(Orders_FormSR; $1)
C_LONGINT:C283(Orders_FormSR; $2)

//Orders_FormSR2
C_LONGINT:C283(Orders_FormSR2; $0)
C_LONGINT:C283(Orders_FormSR2; $1)

//Orders_FormSR3
C_LONGINT:C283(Orders_FormSR3; $1)
C_BOOLEAN:C305(Orders_FormSR3; $2)

//Orders_In
C_TEXT:C284(Orders_In; $1)
C_TEXT:C284(Orders_In; $2)
C_TEXT:C284(Orders_In; $3)
C_TEXT:C284(Orders_In; $4)
C_TEXT:C284(Orders_In; $5)
C_TEXT:C284(Orders_In; $6)

//Orders_InE
C_TEXT:C284(Orders_InE; $1)
C_TEXT:C284(Orders_InE; $2)
C_TEXT:C284(Orders_InE; $3)
C_TEXT:C284(Orders_InE; $4)
C_TEXT:C284(Orders_InE; $5)
C_TEXT:C284(Orders_InE; $6)

//Orders_InLPDCom
C_POINTER:C301(Orders_InLPDCom; $1)
C_POINTER:C301(Orders_InLPDCom; $2)
C_POINTER:C301(Orders_InLPDCom; $3)
C_TEXT:C284(Orders_InLPDCom; $4)

//Orders_InLPEvCh
C_POINTER:C301(Orders_InLPEvCh; $1)
C_BOOLEAN:C305(Orders_InLPEvCh; $2)
C_POINTER:C301(Orders_InLPEvCh; $3)

//Orders_InLPOI
C_LONGINT:C283(Orders_InLPOI; $1)
C_LONGINT:C283(Orders_InLPOI; $2)

//Orders_InLPß
C_TEXT:C284(Orders_InLPß; $1)

//Orders_InLPX
C_POINTER:C301(Orders_InLPX; $1)

//Orders_InvSrch
C_BOOLEAN:C305(Orders_InvSrch; $0)

//Orders_ListVGB3
C_TEXT:C284(Orders_ListVGB3; $0)

//Orders_ListVGB7
C_BOOLEAN:C305(Orders_ListVGB7; $0)

//Orders_ListVGB8
C_BOOLEAN:C305(Orders_ListVGB8; $0)

//Orders_Mod
C_TEXT:C284(Orders_Mod; $1)
C_TEXT:C284(Orders_Mod; $2)
C_TEXT:C284(Orders_Mod; $3)
C_TEXT:C284(Orders_Mod; $4)
C_TEXT:C284(Orders_Mod; $5)
C_TEXT:C284(Orders_Mod; $6)

//Orders_PartAppl
C_BOOLEAN:C305(Orders_PartAppl; $0)
C_TEXT:C284(Orders_PartAppl; $1)

//Orders_PartSrc
C_BOOLEAN:C305(Orders_PartSrc; $0)
C_TEXT:C284(Orders_PartSrc; $1)

//Orders_POTrans
C_BOOLEAN:C305(Orders_POTrans; $0)

//Orders_PPChCo
C_BOOLEAN:C305(Orders_PPChCo; $0)

//Orders_PPDel5
C_DATE:C307(Orders_PPDel5; $1)

//Orders_PPDelS2
C_BOOLEAN:C305(Orders_PPDelS2; $0)

//Orders_PPDelSel
C_BOOLEAN:C305(Orders_PPDelSel; $0)

//Orders_PPFull
C_BOOLEAN:C305(Orders_PPFull; $1)

//Orders_PPGen
C_POINTER:C301(Orders_PPGen; $1)
C_TEXT:C284(Orders_PPGen; $2)
C_TEXT:C284(Orders_PPGen; $3)
C_TEXT:C284(Orders_PPGen; $4)
C_TEXT:C284(Orders_PPGen; $5)
C_TEXT:C284(Orders_PPGen; $6)
C_LONGINT:C283(Orders_PPGen; $7)
C_POINTER:C301(Orders_PPGen; $8)
C_TEXT:C284(Orders_PPGen; $9)
C_TEXT:C284(Orders_PPGen; $10)
C_BOOLEAN:C305(Orders_PPGen; $11)

//Orders_PPOut1
C_BOOLEAN:C305(Orders_PPOut1; $0)
C_BOOLEAN:C305(Orders_PPOut1; $1)

//Orders_Sel
C_TEXT:C284(Orders_Sel; $1)

//Orders_SelLP
C_LONGINT:C283(Orders_SelLP; $0)
C_LONGINT:C283(Orders_SelLP; $1)

//Orders_SelP
C_LONGINT:C283(Orders_SelP; $1)
C_POINTER:C301(Orders_SelP; $2)
C_POINTER:C301(Orders_SelP; $3)

//Orders_StockSel
C_BOOLEAN:C305(Orders_StockSel; $0)

//ORD_DELIVERYDATEPREFS
C_BOOLEAN:C305(ORD_DeliveryDatePrefs; $1)

//ORD_ORDERCREATEREVISION
C_TEXT:C284(ORD_OrderCreateRevision; $1)

//ORD_ORDERRETRIEVEREVISION
C_TEXT:C284(ORD_OrderRetrieveRevision; $1)
C_LONGINT:C283(ORD_OrderRetrieveRevision; $2)

//ORD_RETRIEVEDRAGGEDLINES
C_POINTER:C301(ORD_RetrieveDraggedLines; $1)

//ORD_RETRIEVEPRODUCTINFO
C_POINTER:C301(ORD_RetrieveProductInfo; $1)

//ORD_SETSELECTABLE
C_LONGINT:C283(ORD_SetSelectable; $0)
C_LONGINT:C283(ORD_SetSelectable; $1)

//Out_ButtCall
C_POINTER:C301(Out_ButtCall; $1)
C_POINTER:C301(Out_ButtCall; $2)
C_POINTER:C301(Out_ButtCall; $3)
C_TEXT:C284(Out_ButtCall; $4)
C_TEXT:C284(Out_ButtCall; $5)
C_TEXT:C284(Out_ButtCall; $6)
C_TEXT:C284(Out_ButtCall; $7)
C_TEXT:C284(Out_ButtCall; $8)
C_TEXT:C284(Out_ButtCall; $9)
C_TEXT:C284(Out_ButtCall; $10)
C_LONGINT:C283(Out_ButtCall; $11)
C_LONGINT:C283(Out_ButtCall; $12)

//Out_Buttons
C_POINTER:C301(Out_Buttons; $1)
C_POINTER:C301(Out_Buttons; $2)

//OUT_BUTTCALLSD
C_POINTER:C301(Out_ButtCallSD; $1)
C_POINTER:C301(Out_ButtCallSD; $2)
C_POINTER:C301(Out_ButtCallSD; $3)
C_TEXT:C284(Out_ButtCallSD; $4)
C_TEXT:C284(Out_ButtCallSD; $5)
C_TEXT:C284(Out_ButtCallSD; $6)
C_TEXT:C284(Out_ButtCallSD; $7)
C_TEXT:C284(Out_ButtCallSD; $8)
C_TEXT:C284(Out_ButtCallSD; $9)
C_TEXT:C284(Out_ButtCallSD; $10)
C_LONGINT:C283(Out_ButtCallSD; $11)
C_LONGINT:C283(Out_ButtCallSD; $12)

//OUT_SETMANGER
C_POINTER:C301(Out_SetManger; $1)

//Path_CheckLU
C_TEXT:C284(Path_CheckLU; $0)
C_TEXT:C284(Path_CheckLU; $1)

//Path_CheckLUCod
C_TEXT:C284(Path_CheckLUCod; $0)
C_TEXT:C284(Path_CheckLUCod; $1)

//Path_CheckLUDec
C_TEXT:C284(Path_CheckLUDec; $0)
C_TEXT:C284(Path_CheckLUDec; $1)

//Path_Mod
C_TEXT:C284(Path_Mod; $1)

//PATHFROMPATHNAME
C_TEXT:C284(PathFromPathName; $0)
C_TEXT:C284(PathFromPathName; $1)

//Period_Calc
C_TEXT:C284(Period_Calc; $0)
C_DATE:C307(Period_Calc; $1)

//Period_Create
C_DATE:C307(Period_Create; $1)

//Period_Find2
C_POINTER:C301(Period_Find2; $1)
C_POINTER:C301(Period_Find2; $2)

//Periods_ConvCal
C_TEXT:C284(Periods_ConvCal; $0)
C_TEXT:C284(Periods_ConvCal; $1)

//Periods_Mod
C_BOOLEAN:C305(Periods_Mod; $1)

//PersonGr_InLPNo
C_LONGINT:C283(PersonGr_InLPNo; $1)

//Personnel_File
C_BOOLEAN:C305(Personnel_File; $0)

//Personnel_SelLP
C_LONGINT:C283(Personnel_SelLP; $0)

//PER_EDITEMAILS
C_TEXT:C284(PER_EditEmails; $1)
C_REAL:C285(PER_EditEmails; $2)
C_REAL:C285(PER_EditEmails; $3)
C_REAL:C285(PER_EditEmails; $4)
C_REAL:C285(PER_EditEmails; $5)

//PER_GETDIARYSHARES
C_LONGINT:C283(Per_GetDiaryShares; $1)
C_TEXT:C284(Per_GetDiaryShares; $2)

//PER_GETSTAFF
C_LONGINT:C283(PER_GetStaff; $1)
C_TEXT:C284(PER_GetStaff; $2)

//PG_LOADPGOPTIONS
C_LONGINT:C283(PG_LoadPGoptions; $1)

//Picture_Dialog
C_TEXT:C284(Picture_Dialog; $1)
C_TEXT:C284(Picture_Dialog; $2)
C_TEXT:C284(Picture_Dialog; $3)
C_TEXT:C284(Picture_Dialog; $4)

//PICTUREIFFAXSR
C_PICTURE:C286(PictureIfFaxSR; $0)
C_TEXT:C284(PictureIfFaxSR; $1)

//PICTUREIFFAXWP
C_TEXT:C284(PictureIfFaxWP; $0)
C_TEXT:C284(PictureIfFaxWP; $1)

//Play_Word
C_LONGINT:C283(Play_Word; $1)

//Play_Words
C_TEXT:C284(Play_Words; $1)

//PLUGCALL_CHOOSER
C_TEXT:C284(PLUGCALL_Chooser; $1)

//PLUGCALL_FAX
C_TEXT:C284(PLUGCALL_FAX; $1)
C_LONGINT:C283(PLUGCALL_FAX; $2)
C_TEXT:C284(PLUGCALL_FAX; $3)
C_POINTER:C301(PLUGCALL_FAX; $4)
C_POINTER:C301(PLUGCALL_FAX; $5)
C_POINTER:C301(PLUGCALL_FAX; $6)
C_POINTER:C301(PLUGCALL_FAX; $7)
C_POINTER:C301(PLUGCALL_FAX; $8)

//PLUGCALL_PDFREGISTER
C_LONGINT:C283(PLUGCALL_PDFRegister; $0)

//PLUGCALL_PDFS
C_LONGINT:C283(PLUGCALL_PDFs; $0)
C_TEXT:C284(PLUGCALL_PDFs; $1)
C_POINTER:C301(PLUGCALL_PDFs; $2)
C_POINTER:C301(PLUGCALL_PDFs; $3)
C_POINTER:C301(PLUGCALL_PDFs; $4)
C_POINTER:C301(PLUGCALL_PDFs; $5)
C_TEXT:C284(PLUGCALL_PDFs; $6)

//PLUGCALL_QUICKADDRESS
C_TEXT:C284(PLUGCALL_QuickAddress; $1)
C_LONGINT:C283(PLUGCALL_QuickAddress; $2)
C_POINTER:C301(PLUGCALL_QuickAddress; $3)
C_POINTER:C301(PLUGCALL_QuickAddress; $4)
C_POINTER:C301(PLUGCALL_QuickAddress; $5)
C_POINTER:C301(PLUGCALL_QuickAddress; $6)
C_POINTER:C301(PLUGCALL_QuickAddress; $7)
C_POINTER:C301(PLUGCALL_QuickAddress; $8)
C_POINTER:C301(PLUGCALL_QuickAddress; $9)

//PLUGCALL_TELEPHONY
C_LONGINT:C283(PLUGCALL_Telephony; $0)
C_TEXT:C284(PLUGCALL_Telephony; $1)
C_LONGINT:C283(PLUGCALL_Telephony; $2)

//PLUGCALL_VOICERECORD
C_LONGINT:C283(PLUGCALL_VoiceRecord; $0)
C_TEXT:C284(PLUGCALL_VoiceRecord; $1)
C_TEXT:C284(PLUGCALL_VoiceRecord; $2)
C_LONGINT:C283(PLUGCALL_VoiceRecord; $3)
C_REAL:C285(PLUGCALL_VoiceRecord; $4)
C_REAL:C285(PLUGCALL_VoiceRecord; $5)
C_REAL:C285(PLUGCALL_VoiceRecord; $6)

//Plural_Single
C_TEXT:C284(Plural_Single; $0)
C_TEXT:C284(Plural_Single; $1)
C_LONGINT:C283(Plural_Single; $2)

//Post_Amount
C_TEXT:C284(Post_Amount; $1)
C_REAL:C285(Post_Amount; $2)
C_REAL:C285(Post_Amount; $3)
C_REAL:C285(Post_Amount; $4)
C_TEXT:C284(Post_Amount; $5)

//PostKey_Wait
C_LONGINT:C283(PostKey_Wait; $1)
C_LONGINT:C283(PostKey_Wait; $2)
C_LONGINT:C283(PostKey_Wait; $3)
C_LONGINT:C283(PostKey_Wait; $4)
C_LONGINT:C283(PostKey_Wait; $5)

//PriceT_Check
C_TEXT:C284(PriceT_Check; $1)
C_TEXT:C284(PriceT_Check; $2)
C_TEXT:C284(PriceT_Check; $3)
C_TEXT:C284(PriceT_Check; $4)
C_TEXT:C284(PriceT_Check; $5)
C_REAL:C285(PriceT_Check; $6)

//PriceT_CheckCo2
C_TEXT:C284(PriceT_CheckCo2; $1)

//PriceT_CheckGen
C_POINTER:C301(PriceT_CheckGen; $1)
C_TEXT:C284(PriceT_CheckGen; $2)

//PriceT_Load
C_POINTER:C301(PriceT_Load; $1)
C_TEXT:C284(PriceT_Load; $2)
C_REAL:C285(PriceT_Load; $3)

//PriceT_Search
C_TEXT:C284(PriceT_Search; $1)
C_TEXT:C284(PriceT_Search; $2)
C_TEXT:C284(PriceT_Search; $3)
C_TEXT:C284(PriceT_Search; $4)
C_TEXT:C284(PriceT_Search; $5)

//PriceT_SearchC2
C_TEXT:C284(PriceT_SearchC2; $1)

//PriceT_SearchCo
C_TEXT:C284(PriceT_SearchCo; $1)
C_TEXT:C284(PriceT_SearchCo; $2)
C_TEXT:C284(PriceT_SearchCo; $3)
C_TEXT:C284(PriceT_SearchCo; $4)
C_TEXT:C284(PriceT_SearchCo; $5)

//PriceT_SearchCu
C_TEXT:C284(PriceT_SearchCu; $1)

//PriceT_SearchQt
C_REAL:C285(PriceT_SearchQt; $1)

//PRINT_SETSIZE
C_LONGINT:C283(PRINT_SetSIZE; $0)

C_TEXT:C284(PRINT_SetSIZE; $1)
C_TEXT:C284(PRINT_SetSIZE; $2)
C_TEXT:C284(PRINT_SetSIZE; $3)

//Process_ArrDef
C_LONGINT:C283(Process_ArrDef; $1)

//Process_ArrDel
C_LONGINT:C283(Process_ArrDel; $1)
C_LONGINT:C283(Process_ArrDel; $2)


//Process_ArrIns
C_LONGINT:C283(Process_ArrIns; $0)
C_LONGINT:C283(Process_ArrIns; $1)
C_LONGINT:C283(Process_ArrIns; $2)

//Process_GenAll
C_TEXT:C284(Process_GenAll; $1)
C_LONGINT:C283(Process_GenAll; $2)

//Process_Name
C_TEXT:C284(Process_Name; $0)
C_LONGINT:C283(Process_Name; $1)

//Process_No
C_LONGINT:C283(Process_No; $0)
C_TEXT:C284(Process_No; $1)

//Process_StartAr
C_LONGINT:C283(Process_StartAr; $1)
C_TEXT:C284(Process_StartAr; $2)

//Processes_PopUp
C_LONGINT:C283(Processes_PopUp; $1)
C_BOOLEAN:C305(Processes_PopUp; $2)

//PROCESSSERVICES_CLEANUP
C_BOOLEAN:C305(ProcessServices_Cleanup; $1)

//PROCESSSERVICES_CREATERECORD
C_POINTER:C301(ProcessServices_CreateRecord; $1)
C_POINTER:C301(ProcessServices_CreateRecord; $2)
C_TEXT:C284(ProcessServices_CreateRecord; $3)
C_REAL:C285(ProcessServices_CreateRecord; $4)
C_REAL:C285(ProcessServices_CreateRecord; $5)
C_REAL:C285(ProcessServices_CreateRecord; $6)
C_BOOLEAN:C305(ProcessServices_CreateRecord; $7)
C_POINTER:C301(ProcessServices_CreateRecord; $8)

//PROCESSSERVICES_INVOICES
C_BOOLEAN:C305(ProcessServices_INVOICES; $0)

//PROCESSSERVICE_ACCBAL
C_BOOLEAN:C305(ProcessService_AccBal; $0)




//PROCESSSERVICE_DELETEDUPLICATES
C_LONGINT:C283(ProcessService_DeleteDuplicates; $1)
C_LONGINT:C283(ProcessService_DeleteDuplicates; $2)
C_DATE:C307(ProcessService_DeleteDuplicates; $3)
C_TEXT:C284(ProcessService_DeleteDuplicates; $4)
C_LONGINT:C283(ProcessService_DeleteDuplicates; $5)
C_LONGINT:C283(ProcessService_DeleteDuplicates; $6)
C_LONGINT:C283(ProcessService_DeleteDuplicates; $7)
C_LONGINT:C283(ProcessService_DeleteDuplicates; $8)
C_BOOLEAN:C305(ProcessService_DeleteDuplicates; $9)
C_TIME:C306(ProcessService_DeleteDuplicates; $10)

//PROCESSSERVICE_DIARY
C_BOOLEAN:C305(ProcessService_Diary; $0)


//PROCESSSERVICE_JOBS
C_BOOLEAN:C305(ProcessService_Jobs; $0)

//PROCESSSERVICE_LISTITEMS
C_BOOLEAN:C305(ProcessService_ListItems; $0)

//PROCESSSERVICE_ORDERS
C_BOOLEAN:C305(ProcessService_ORDERS; $0)

//PROCESSSERVICE_PERSONNEL
C_BOOLEAN:C305(ProcessService_Personnel; $0)

//PROCESSSERVICE_PRODUCTS
C_BOOLEAN:C305(ProcessService_Products; $0)

//PROCESSSERVICE_PROJECTS
C_BOOLEAN:C305(ProcessService_Projects; $0)

//PROCESSSERVICE_QUALITIES
C_BOOLEAN:C305(ProcessService_Qualities; $0)

//PROCESSSERVICE_SENDSMS
C_BOOLEAN:C305(ProcessService_SendSMS; $0)

//PROCESSSERVICE_STOCK
C_BOOLEAN:C305(ProcessService_Stock; $0)

//PROCESSSERVICE_STOCKITEMS
C_BOOLEAN:C305(ProcessService_StockItems; $0)

//PROCESSSERVICE_STOCKLEVELS
C_BOOLEAN:C305(ProcessService_StockLevels; $0)

//PROCESSSERVICE_TRANSACTIONS
C_BOOLEAN:C305(ProcessService_Transactions; $0)
C_TIME:C306(ProcessService_Transactions; $1)

//Prod_Sel2
C_TEXT:C284(Prod_Sel2; $1)
C_TEXT:C284(Prod_Sel2; $2)
C_BOOLEAN:C305(Prod_Sel2; $3)

//Prod_SelLP
C_LONGINT:C283(Prod_SelLP; $0)
C_LONGINT:C283(Prod_SelLP; $1)

//Prod_SelP
C_LONGINT:C283(Prod_SelP; $1)
C_POINTER:C301(Prod_SelP; $2)
C_POINTER:C301(Prod_SelP; $3)

//ProdSupp_InLPX
C_POINTER:C301(ProdSupp_InLPX; $1)

//Products_In
C_TEXT:C284(Products_In; $1)
C_TEXT:C284(Products_In; $2)
C_TEXT:C284(Products_In; $3)
C_TEXT:C284(Products_In; $4)

//Products_InLPß
C_TEXT:C284(Products_InLPß; $1)

//Products_ReordS
C_BOOLEAN:C305(Products_ReordS; $0)

//PRODUCTS_ADDSUBENTITY
C_TEXT:C284(Products_AddSubentity; $1)

//PRODUCTS_DELSUBENTITY
C_TEXT:C284(Products_DelSubentity; $1)

//PROD_COMPONENTCHECKER
C_LONGINT:C283(Prod_ComponentChecker; $1)
C_TEXT:C284(Prod_ComponentChecker; $2)
C_TEXT:C284(Prod_ComponentChecker; $3)

//PROD_LOADCATS
C_LONGINT:C283(PROD_LoadCats; $1)

//PROD_LOADCOMPONENTS
C_BOOLEAN:C305(PROD_LoadComponents; $1)
C_TEXT:C284(PROD_LoadComponents; $2)

//PROD_LOADCURRENTSTOCK
C_REAL:C285(PROD_LoadCurrentStock; $1)
C_TEXT:C284(PROD_LoadCurrentStock; $2)
C_BOOLEAN:C305(PROD_LoadCurrentStock; $3)

//PROD_LOADGRAPHIC
C_REAL:C285(Prod_LoadGraphic; $1)
C_REAL:C285(Prod_LoadGraphic; $2)
C_REAL:C285(Prod_LoadGraphic; $3)

//PROD_LOADPRICEMATRIX
C_TEXT:C284(PROD_LoadPriceMatrix; $1)
C_TEXT:C284(PROD_LoadPriceMatrix; $2)
C_TEXT:C284(PROD_LoadPriceMatrix; $3)

//PROD_OPENCOMPONENTPRODUCT
C_LONGINT:C283(PROD_OpenComponentProduct; $1)
C_TEXT:C284(PROD_OpenComponentProduct; $2)

//PROD_PALLETTESETOBJECTS
C_LONGINT:C283(Prod_PalletteSetObjects; $1)


//PROD_SELECTIONPALLETTE
C_LONGINT:C283(Prod_SelectionPallette; $1)
C_TEXT:C284(Prod_SelectionPallette; $2)
C_LONGINT:C283(Prod_SelectionPallette; $3)
C_TEXT:C284(Prod_SelectionPallette; $4)
C_TEXT:C284(Prod_SelectionPallette; $5)
C_TEXT:C284(Prod_SelectionPallette; $6)

//PROD_SETPRODUCTDETAIL
C_TEXT:C284(Prod_SetProductDetail; $1)

//PROGRESS
C_TEXT:C284(Progress; $1)

//PROGRESS2
C_TEXT:C284(Progress2; $1)

//Progress2_Call
C_LONGINT:C283(Progress2_Call; $1)
C_TEXT:C284(Progress2_Call; $2)
C_LONGINT:C283(Progress2_Call; $3)
C_LONGINT:C283(Progress2_Call; $4)

//Progress2_Start
C_LONGINT:C283(Progress2_Start; $0)
C_TEXT:C284(Progress2_Start; $1)

//Project_Sel2Fld
C_POINTER:C301(Project_Sel2Fld; $1)
C_POINTER:C301(Project_Sel2Fld; $2)
C_POINTER:C301(Project_Sel2Fld; $3)
C_POINTER:C301(Project_Sel2Fld; $4)
C_POINTER:C301(Project_Sel2Fld; $5)
C_POINTER:C301(Project_Sel2Fld; $6)

//Project_SelCU
C_POINTER:C301(Project_SelCU; $1)
C_POINTER:C301(Project_SelCU; $2)
C_TEXT:C284(Project_SelCU; $3)

//Project_SelFast
C_POINTER:C301(Project_SelFast; $1)
C_POINTER:C301(Project_SelFast; $2)
C_POINTER:C301(Project_SelFast; $3)
C_POINTER:C301(Project_SelFast; $4)

//Projects_JobDel
C_BOOLEAN:C305(Projects_JobDel; $0)

//Projects_SelLP
C_LONGINT:C283(Projects_SelLP; $0)
C_LONGINT:C283(Projects_SelLP; $1)

//Projects_SelP
C_LONGINT:C283(Projects_SelP; $1)
C_POINTER:C301(Projects_SelP; $2)
C_POINTER:C301(Projects_SelP; $3)


//PT_GETDISCOUNT
C_REAL:C285(PT_GetDIscount; $1)
C_REAL:C285(PT_GetDIscount; $2)
C_REAL:C285(PT_GetDIscount; $3)
C_TEXT:C284(PT_GetDIscount; $4)
C_REAL:C285(PT_GetDIscount; $5)
C_REAL:C285(PT_GetDIscount; $6)
C_REAL:C285(PT_GetDIscount; $7)
C_REAL:C285(PT_GetDIscount; $8)
C_BOOLEAN:C305(PT_GetDIscount; $9)

//PT_GETPO
C_BOOLEAN:C305(PT_GetPO; $1)

//PT_GETPRICE
C_REAL:C285(PT_GetPrice; $1)
C_REAL:C285(PT_GetPrice; $2)
C_REAL:C285(PT_GetPrice; $3)
C_TEXT:C284(PT_GetPrice; $4)
C_REAL:C285(PT_GetPrice; $5)
C_REAL:C285(PT_GetPrice; $6)
C_REAL:C285(PT_GetPrice; $7)
C_REAL:C285(PT_GetPrice; $8)
C_BOOLEAN:C305(PT_GetPrice; $9)

//PT_GETQTY
C_REAL:C285(PT_GetQty; $1)

//PuOItems_InLPX
C_POINTER:C301(PuOItems_InLPX; $1)

//Purch_InLPChkIn
C_BOOLEAN:C305(Purch_InLPChkIn; $0)

//Purch_InLPß
C_TEXT:C284(Purch_InLPß; $1)

//Purchase_AllSr2
C_BOOLEAN:C305(Purchase_AllSr2; $0)

//Purchase_POSrch
C_BOOLEAN:C305(Purchase_POSrch; $0)

//Purchases_AASrc
C_BOOLEAN:C305(Purchases_AASrc; $0)

//Purchases_AC2
C_TEXT:C284(Purchases_AC2; $1)
C_POINTER:C301(Purchases_AC2; $2)

//Purchases_ACCal
C_REAL:C285(Purchases_ACCal; $1)

//Purchases_CheqN
C_LONGINT:C283(Purchases_CheqN; $1)

//Purchases_CheqP
C_LONGINT:C283(Purchases_CheqP; $1)
C_LONGINT:C283(Purchases_CheqP; $2)

//Purchases_In
C_TEXT:C284(Purchases_In; $1)
C_TEXT:C284(Purchases_In; $2)
C_TEXT:C284(Purchases_In; $3)
C_TEXT:C284(Purchases_In; $4)

//Purchases_SelLP
C_LONGINT:C283(Purchases_SelLP; $0)
C_LONGINT:C283(Purchases_SelLP; $1)

//Purchases_SelP
C_LONGINT:C283(Purchases_SelP; $1)
C_POINTER:C301(Purchases_SelP; $2)
C_POINTER:C301(Purchases_SelP; $3)

//PurchOrd_In
C_TEXT:C284(PurchOrd_In; $1)
C_TEXT:C284(PurchOrd_In; $2)
C_TEXT:C284(PurchOrd_In; $3)
C_TEXT:C284(PurchOrd_In; $4)

//PurchOrd_InLPß
C_TEXT:C284(PurchOrd_InLPß; $1)

//PurchOrd_PPrint
C_LONGINT:C283(PurchOrd_PPrint; $1)
C_POINTER:C301(PurchOrd_PPrint; $2)

//PurchOrd_SelLP
C_LONGINT:C283(PurchOrd_SelLP; $0)
C_LONGINT:C283(PurchOrd_SelLP; $1)

//PurchOrd_SelP
C_LONGINT:C283(PurchOrd_SelP; $1)
C_POINTER:C301(PurchOrd_SelP; $2)
C_POINTER:C301(PurchOrd_SelP; $3)

//PurItems_InLPX
C_POINTER:C301(PurItems_InLPX; $1)

//PW_CHANGEPW
C_TEXT:C284(PW_CHANGEPW; $1)
C_TEXT:C284(PW_CHANGEPW; $2)

//PW_CLEARUSERS
C_POINTER:C301(PW_CLEARUSERS; $1)

//QA_Lookup
C_BOOLEAN:C305(QA_Lookup; $0)
C_TEXT:C284(QA_Lookup; $1)

//QA_Lookup2
C_LONGINT:C283(QA_Lookup2; $1)

//QA_Open
C_BOOLEAN:C305(QA_Open; $0)
C_TEXT:C284(QA_Open; $1)
C_LONGINT:C283(QA_Open; $2)

//QA_Setup
C_BOOLEAN:C305(QA_Setup; $0)

//Qual_Code
C_TEXT:C284(Qual_Code; $0)
C_BOOLEAN:C305(Qual_Code; $1)

//Qualities_InLPX
//Qualities_InLPX

//C_POINTER(Qualities_InLPX;$1)

//QuickAdd_Arr
C_LONGINT:C283(QuickAdd_Arr; $1)

//Quit_Name
C_TEXT:C284(Quit_Name; $0)

//QUITCHECKUSERPROCSRUNNING
C_BOOLEAN:C305(QuitCheckUserProcsRunning; $0)

//QV_ADVANCEDSEARCH
C_LONGINT:C283(QV_AdvancedSearch; $1)
C_BOOLEAN:C305(QV_AdvancedSearch; $2)
C_LONGINT:C283(QV_AdvancedSearch; $3)
C_POINTER:C301(QV_AdvancedSearch; $4)
C_POINTER:C301(QV_AdvancedSearch; $5)

//QV_APPLYQUALITIES
C_LONGINT:C283(QV_ApplyQualities; $1)
C_LONGINT:C283(QV_ApplyQualities; $2)
C_TEXT:C284(QV_ApplyQualities; $3)

//QV_CALLBACK
C_LONGINT:C283(QV_Callback; $1)
C_LONGINT:C283(QV_Callback; $2)

//QV_CALLQUALITIES
C_LONGINT:C283(QV_CallQualities; $1)
C_LONGINT:C283(QV_CallQualities; $2)
C_BOOLEAN:C305(QV_CallQualities; $3)

//QV_DISPLAYLEVELS
//QV_DOSEARCH
C_BOOLEAN:C305(QV_DoSearch; $0)
C_LONGINT:C283(QV_DoSearch; $1)

//QV_FROMFA
C_LONGINT:C283(QV_FromFA; $1)
C_LONGINT:C283(QV_FromFA; $2)
C_TEXT:C284(QV_FromFA; $3)

//QV_GETIDFIELD
C_POINTER:C301(QV_GetIdField; $0)
C_LONGINT:C283(QV_GetIdField; $1)

//QV_LOADSET
C_LONGINT:C283(QV_loadset; $1)
C_TEXT:C284(QV_loadset; $2)
C_TEXT:C284(QV_loadset; $3)
C_LONGINT:C283(QV_loadset; $4)
C_LONGINT:C283(QV_loadset; $5)
C_LONGINT:C283(QV_loadset; $6)
C_TEXT:C284(QV_loadset; $7)

//QV_PARSETEXT
C_TEXT:C284(QV_ParseText; $1)
C_BOOLEAN:C305(QV_ParseText; $2)
C_LONGINT:C283(QV_ParseText; $3)

//QV_QUALITIESPALLETTEPROCESS
C_LONGINT:C283(QV_QualitiesPalletteProcess; $1)
C_LONGINT:C283(QV_QualitiesPalletteProcess; $2)
C_BOOLEAN:C305(QV_QualitiesPalletteProcess; $3)
C_TEXT:C284(QV_QualitiesPalletteProcess; $4)

//QV_RELEVANTTABLES
C_POINTER:C301(QV_RelevantTables; $1)
C_POINTER:C301(QV_RelevantTables; $2)
C_POINTER:C301(QV_RelevantTables; $3)
C_POINTER:C301(QV_RelevantTables; $4)
C_POINTER:C301(QV_RelevantTables; $5)

//QV_SAVECURRENTQUALITY
C_BOOLEAN:C305(QV_SaveCurrentQuality; $1)
C_REAL:C285(QV_SaveCurrentQuality; $2)

//QV_SAVEFROMPOWERVIEW
C_TEXT:C284(QV_SaveFromPowerview; $1)

//QV_SAVEQUALITIES
C_REAL:C285(QV_SaveQualities; $1)
C_LONGINT:C283(QV_SaveQualities; $2)
C_LONGINT:C283(QV_SaveQualities; $3)
C_BOOLEAN:C305(QV_SaveQualities; $4)

//QV_SAVESET
C_LONGINT:C283(QV_SaveSet; $1)

//QV_SELECTGROUPORITEM
C_LONGINT:C283(QV_SelectGroupORitem; $1)
C_TEXT:C284(QV_SelectGroupORitem; $2)
C_POINTER:C301(QV_SelectGroupORitem; $3)
C_POINTER:C301(QV_SelectGroupORitem; $4)
C_POINTER:C301(QV_SelectGroupORitem; $5)

//QV_SHOWQUALITIES
C_LONGINT:C283(QV_ShowQualities; $1)
C_LONGINT:C283(QV_ShowQualities; $2)
C_LONGINT:C283(QV_ShowQualities; $3)
C_LONGINT:C283(QV_ShowQualities; $4)

//QV_UPDATEQUALSPALLETTE
C_LONGINT:C283(QV_UpdateQualsPallette; $1)
C_LONGINT:C283(QV_UpdateQualsPallette; $2)
C_LONGINT:C283(QV_UpdateQualsPallette; $3)
C_LONGINT:C283(QV_UpdateQualsPallette; $4)

//QV_UPDATESET
C_BOOLEAN:C305(QV_UpdateSet; $0)
C_LONGINT:C283(QV_UpdateSet; $1)
C_LONGINT:C283(QV_UpdateSet; $2)
C_LONGINT:C283(QV_UpdateSet; $3)
C_BOOLEAN:C305(QV_UpdateSet; $4)
C_LONGINT:C283(QV_UpdateSet; $5)

//QV_WHATGROUP
C_LONGINT:C283(QV_WhatGroup; $0)
C_LONGINT:C283(QV_WhatGroup; $1)
C_LONGINT:C283(QV_WhatGroup; $2)

//Record_BarCreat
C_LONGINT:C283(Record_BarCreat; $1)

//Record_BarPlay
C_LONGINT:C283(Record_BarPlay; $1)

//Record_MessWin
C_LONGINT:C283(Record_MessWin; $0)
C_TEXT:C284(Record_MessWin; $1)

//Record_PagLine
C_TEXT:C284(Record_PagLine; $0)

//Record_Play
C_LONGINT:C283(Record_Play; $1)
C_TEXT:C284(Record_Play; $2)

//Record_PlayButt
C_TEXT:C284(Record_PlayButt; $1)

//Record_PlayEval
C_TEXT:C284(Record_PlayEval; $1)

//Record_PlayExec
C_BOOLEAN:C305(Record_PlayExec; $0)
C_TEXT:C284(Record_PlayExec; $1)

//Record_PlayLine
C_POINTER:C301(Record_PlayLine; $1)

//Record_PlayLinS
C_POINTER:C301(Record_PlayLinS; $1)

//Record_PlayMenu
C_TEXT:C284(Record_PlayMenu; $1)
C_LONGINT:C283(Record_PlayMenu; $2)
C_TEXT:C284(Record_PlayMenu; $3)

//Record_PlayP
C_TEXT:C284(Record_PlayP; $1)

//Record_PlayvMT
C_LONGINT:C283(Record_PlayvMT; $1)

//Record_PlayWEnd
C_LONGINT:C283(Record_PlayWEnd; $0)
C_LONGINT:C283(Record_PlayWEnd; $1)

//Record_PlayWfS
C_BOOLEAN:C305(Record_PlayWfS; $1)
C_LONGINT:C283(Record_PlayWfS; $2)

//Record_PlayWoE
C_TEXT:C284(Record_PlayWoE; $1)

//Record_PlMacro
C_TEXT:C284(Record_PlMacro; $1)

//RECORDUSER
C_TEXT:C284(RecordUser; $1)
C_TEXT:C284(RecordUser; $2)

//RecText_EditArr
C_POINTER:C301(RecText_EditArr; $1)

//RecText_Field
C_POINTER:C301(RecText_Field; $1)

//RecText_File
C_POINTER:C301(RecText_File; $1)

//Remote_Code
C_TEXT:C284(Remote_Code; $0)
C_TEXT:C284(Remote_Code; $1)

//Remote_Decode
C_TEXT:C284(Remote_Decode; $0)
C_TEXT:C284(Remote_Decode; $1)

//Remote_ExAppCre
C_TEXT:C284(Remote_ExAppCre; $1)

//Remote_ExComp
C_BOOLEAN:C305(Remote_ExComp; $1)

//Remote_ExCont
C_BOOLEAN:C305(Remote_ExCont; $1)

//Remote_ExLet
C_TEXT:C284(Remote_ExLet; $1)

//Remote_ExMin
C_POINTER:C301(Remote_ExMin; $1)
C_POINTER:C301(Remote_ExMin; $2)
C_POINTER:C301(Remote_ExMin; $3)
C_TEXT:C284(Remote_ExMin; $4)
C_LONGINT:C283(Remote_ExMin; $5)
C_LONGINT:C283(Remote_ExMin; $6)

//Remote_ExProd
C_BOOLEAN:C305(Remote_ExProd; $1)

//Remote_ImComp
C_BOOLEAN:C305(Remote_ImComp; $1)

//Remote_ImCont
C_BOOLEAN:C305(Remote_ImCont; $1)

//Remote_ImGen
C_TEXT:C284(Remote_ImGen; $1)

//Remote_ImMin
C_POINTER:C301(Remote_ImMin; $1)
C_POINTER:C301(Remote_ImMin; $2)
C_POINTER:C301(Remote_ImMin; $3)
C_TEXT:C284(Remote_ImMin; $4)
C_LONGINT:C283(Remote_ImMin; $5)
C_LONGINT:C283(Remote_ImMin; $6)

//Remote_ImOverCh
C_TEXT:C284(Remote_ImOverCh; $1)

//Remote_ImProd
C_BOOLEAN:C305(Remote_ImProd; $1)

//Remote_ImSaveSe
C_POINTER:C301(Remote_ImSaveSe; $1)
C_BOOLEAN:C305(Remote_ImSaveSe; $2)

//Remote_ImSetSav
C_TEXT:C284(Remote_ImSetSav; $1)
C_TEXT:C284(Remote_ImSetSav; $2)
C_TEXT:C284(Remote_ImSetSav; $3)
C_TEXT:C284(Remote_ImSetSav; $4)
C_POINTER:C301(Remote_ImSetSav; $5)

//Remote_ImShow2
C_POINTER:C301(Remote_ImShow2; $1)
C_TEXT:C284(Remote_ImShow2; $2)
C_TEXT:C284(Remote_ImShow2; $3)
C_TEXT:C284(Remote_ImShow2; $4)
C_TEXT:C284(Remote_ImShow2; $5)
C_TEXT:C284(Remote_ImShow2; $6)
C_TEXT:C284(Remote_ImShow2; $7)
C_TEXT:C284(Remote_ImShow2; $8)

//Remote_Packet
C_TEXT:C284(Remote_Packet; $0)
C_TEXT:C284(Remote_Packet; $1)

//Remote_Rec
C_TEXT:C284(Remote_Rec; $0)

//REMOVECHAR
C_TEXT:C284(RemoveChar; $0)
C_TEXT:C284(RemoveChar; $1)
C_TEXT:C284(RemoveChar; $2)

//REMOVELEAD
C_TEXT:C284(RemoveLead; $0)
C_TEXT:C284(RemoveLead; $1)

//REMOVELEADHYP
C_TEXT:C284(RemoveLeadHyp; $0)
C_TEXT:C284(RemoveLeadHyp; $1)

//REMOVELEADTR
C_TEXT:C284(RemoveLeadTr; $0)
C_TEXT:C284(RemoveLeadTr; $1)
C_POINTER:C301(RemoveLeadTr; $2)

//REMOVEQUOTE
C_TEXT:C284(RemoveQuote; $0)
C_TEXT:C284(RemoveQuote; $1)

//REMOVETRAIL2
C_TEXT:C284(RemoveTrail2; $0)
C_TEXT:C284(RemoveTrail2; $1)

//REMOVETRAILCR
C_TEXT:C284(RemoveTrailCR; $0)
C_TEXT:C284(RemoveTrailCR; $1)

//REPLACE
C_TEXT:C284(Replace; $0)
C_TEXT:C284(Replace; $1)

//Replace_Length
C_TEXT:C284(Replace_Length; $0)
C_TEXT:C284(Replace_Length; $1)
C_LONGINT:C283(Replace_Length; $2)
C_TEXT:C284(Replace_Length; $3)

//REPLACEIME
C_TEXT:C284(ReplaceIME; $0)
C_TEXT:C284(ReplaceIME; $1)

//Reports_Event
C_LONGINT:C283(Reports_Event; $1)
C_LONGINT:C283(Reports_Event; $2)
C_LONGINT:C283(Reports_Event; $3)

//Reports_FormCr2
C_TEXT:C284(Reports_FormCr2; $1)
C_LONGINT:C283(Reports_FormCr2; $2)
C_TEXT:C284(Reports_FormCr2; $3)

//Reset_Attachment_Var
C_BOOLEAN:C305(Reset_Attachment_Var; $1)

//RS_RECORDACCESSALLOWED
C_BOOLEAN:C305(RS_RecordAccessAllowed; $0)
C_POINTER:C301(RS_RecordAccessAllowed; $1)
C_POINTER:C301(RS_RecordAccessAllowed; $2)
C_POINTER:C301(RS_RecordAccessAllowed; $3)
C_POINTER:C301(RS_RecordAccessAllowed; $4)
C_POINTER:C301(RS_RecordAccessAllowed; $5)

//SALES_YEARONYEAR
C_TEXT:C284(SALES_YearonYear; $1)
C_REAL:C285(SALES_YearonYear; $2)

//SCL_RETREIVEDRAGGEDLINES
C_POINTER:C301(SCL_RetreiveDraggedLines; $1)


//SC_POWERVIEWPRODSCPT
C_LONGINT:C283(SC_PowerViewPRODScpt; $1)
C_LONGINT:C283(SC_PowerViewPRODScpt; $2)
C_LONGINT:C283(SC_PowerViewPRODScpt; $3)

//SC_PVENTRY
C_LONGINT:C283(SC_PVentry; $1)
C_LONGINT:C283(SC_PVentry; $2)
C_LONGINT:C283(SC_PVentry; $3)

//SC_RESOLVED
C_TEXT:C284(SC_Resolved; $0)

//SDAG_EDITINPROCESS
C_REAL:C285(SDAG_EditinProcess; $1)
C_REAL:C285(SDAG_EditinProcess; $2)
C_REAL:C285(SDAG_EditinProcess; $3)

//SDAG_SAVEPREFERENCE
C_BOOLEAN:C305(SDAG_SavePreference; $0)
C_LONGINT:C283(SDAG_SavePreference; $1)
C_LONGINT:C283(SDAG_SavePreference; $2)

//SDIARY_HISTFIND
C_LONGINT:C283(SDiary_HistFind; $0)
C_LONGINT:C283(SDiary_HistFind; $1)

//SDIARY_HL_DISPLAYDIARY
C_DATE:C307(SDiary_HL_DisplayDiary; $1)
C_DATE:C307(SDiary_HL_DisplayDiary; $2)

//SDIARY_HL_DISPLAYDIARY_OLD
C_DATE:C307(SDiary_HL_DisplayDiary_OLD; $1)
C_DATE:C307(SDiary_HL_DisplayDiary_OLD; $2)

//SDIARY_HL_QUERYDIARY
C_TEXT:C284(SDiary_HL_QueryDiary; $1)
C_DATE:C307(SDiary_HL_QueryDiary; $2)
C_DATE:C307(SDiary_HL_QueryDiary; $3)
C_REAL:C285(SDiary_HL_QueryDiary; $4)
C_TEXT:C284(SDiary_HL_QueryDiary; $5)

//SDIARY_MENV
C_LONGINT:C283(SDiary_MenV; $1)

//SD_ADDRELATEDRECORD
C_LONGINT:C283(SD_AddRelatedRecord; $1)

//SD_ADDTOREMINDERS
C_BOOLEAN:C305(SD_Addtoreminders; $0)
C_TEXT:C284(SD_Addtoreminders; $1)
C_TEXT:C284(SD_Addtoreminders; $2)
C_BOOLEAN:C305(SD_Addtoreminders; $3)

//SD_AGDRAGEVENTHANDLER
C_REAL:C285(SD_AGDragEventHandler; $1)
C_DATE:C307(SD_AGDragEventHandler; $2)
C_TIME:C306(SD_AGDragEventHandler; $3)
C_REAL:C285(SD_AGDragEventHandler; $4)

//SD_AGENDADIARYRESET
C_LONGINT:C283(SD_AgendaDiaryReset; $1)

//SD_AGENDAEVENTHANDLER
C_LONGINT:C283(SD_AgendaEventHandler; $1)
C_LONGINT:C283(SD_AgendaEventHandler; $2)
C_DATE:C307(SD_AgendaEventHandler; $3)
C_TIME:C306(SD_AgendaEventHandler; $4)
C_DATE:C307(SD_AgendaEventHandler; $5)
C_TIME:C306(SD_AgendaEventHandler; $6)
C_LONGINT:C283(SD_AgendaEventHandler; $7)

//SD_AGENDAGETEVENTS
C_BOOLEAN:C305(SD_AgendaGetEvents; $0)
C_DATE:C307(SD_AgendaGetEvents; $1)
C_DATE:C307(SD_AgendaGetEvents; $2)
C_LONGINT:C283(SD_AgendaGetEvents; $3)
C_LONGINT:C283(SD_AgendaGetEvents; $4)

//SD_ALARMINGEVENTS
C_LONGINT:C283(SD_AlarmingEvents; $1)
C_TEXT:C284(SD_AlarmingEvents; $2)

//SD_AUTOADDREC
C_TEXT:C284(SD_AutoAddRec; $1)
C_DATE:C307(SD_AutoAddRec; $2)
C_TIME:C306(SD_AutoAddRec; $3)
C_BOOLEAN:C305(SD_AutoAddRec; $4)

//SD_BUILDDAY
C_REAL:C285(SD_BuildDay; $1)
C_DATE:C307(SD_BuildDay; $2)

//SD_CALENDARCALC
C_DATE:C307(SD_CalendarCalc; $1)

//SD_CHECKAVAILABLE
C_BOOLEAN:C305(SD_CheckAvailable; $0)
C_REAL:C285(SD_CheckAvailable; $1)
C_DATE:C307(SD_CheckAvailable; $2)
C_DATE:C307(SD_CheckAvailable; $3)
C_TIME:C306(SD_CheckAvailable; $4)
C_TIME:C306(SD_CheckAvailable; $5)
C_TEXT:C284(SD_CheckAvailable; $6)
C_TEXT:C284(SD_CheckAvailable; $7)

//SD_Diary_CalM
C_TEXT:C284(SD_Diary_CalM; $1)
C_TEXT:C284(SD_Diary_CalM; $2)
C_TEXT:C284(SD_Diary_CalM; $3)

//SD_EMAILCHECK
C_POINTER:C301(SD_EmailCheck; $1)

//SD_EVENTITEMDATA
C_LONGINT:C283(SD_EventItemData; $1)
C_LONGINT:C283(SD_EventItemData; $2)

//SD_GETACTIONNAME
C_TEXT:C284(SD_GetActionName; $0)
C_TEXT:C284(SD_GetActionName; $1)
C_LONGINT:C283(SD_GetActionName; $2)

//SD_GETAGENDALICENCE
C_BOOLEAN:C305(SD_GetAgendaLicence; $0)
C_TEXT:C284(SD_GetAgendaLicence; $1)
C_BOOLEAN:C305(SD_GetAgendaLicence; $2)

//SD_GETAVAILABLETIMESLOT
C_TIME:C306(SD_GETAVAILABLETIMESLOT; $0)
C_TEXT:C284(SD_GETAVAILABLETIMESLOT; $1)
C_DATE:C307(SD_GETAVAILABLETIMESLOT; $2)
C_TIME:C306(SD_GETAVAILABLETIMESLOT; $3)
C_LONGINT:C283(SD_GETAVAILABLETIMESLOT; $4)

//SD_GETCODETAILS
C_TEXT:C284(SD_GETCODETAILS; $0)
C_TEXT:C284(SD_GETCODETAILS; $1)
C_TEXT:C284(SD_GETCODETAILS; $2)

//SD_GETGROUPS
C_LONGINT:C283(SD_GetGroups; $1)
C_BOOLEAN:C305(SD_GetGroups; $2)

//SD_GETOTHERDIARIES
C_LONGINT:C283(SD_GetOtherDiaries; $1)
//C_REAL(SD_GetOtherDiaries ;$2)

//SD_GETRESULTNAME
C_TEXT:C284(SD_GetResultName; $0)
C_TEXT:C284(SD_GetResultName; $1)
C_LONGINT:C283(SD_GetResultName; $2)

//SD_GETSOURCERECORD
C_LONGINT:C283(SD_GETSOURCERECORD; $1)
C_LONGINT:C283(SD_GETSOURCERECORD; $2)

//SD_HL_SORT
C_REAL:C285(SD_HL_Sort; $1)

//SD_INCLUDEExclude
C_REAL:C285(SD_IncludeExclude; $1)

//SD_LOADOTHERPERSON
C_TEXT:C284(SD_LoadOtherPerson; $1)
C_TEXT:C284(SD_LoadOtherPerson; $2)

//SD_LOADPREFS
C_LONGINT:C283(SD_LoadPrefs; $1)
C_TEXT:C284(SD_LoadPrefs; $2)
C_BOOLEAN:C305(SD_LoadPrefs; $3)

//SD_LOADSEQUENCE
C_TEXT:C284(SD_LoadSequence; $0)
C_TEXT:C284(SD_LoadSequence; $1)
C_TEXT:C284(SD_LoadSequence; $2)

//SD_MULTIOWNERLIST
C_TEXT:C284(SD_MultiOwnerList; $1)

//SD_RECORDMODIFIED
C_BOOLEAN:C305(SD_RecordModified; $0)
C_POINTER:C301(SD_RecordModified; $1)

//SD_SAVEPREFS
C_LONGINT:C283(SD_SavePrefs; $1)
C_LONGINT:C283(SD_SavePrefs; $2)

//SD_SELECTOTHERUSER
C_TEXT:C284(SD_SelectOtherUser; $0)
C_TEXT:C284(SD_SelectOtherUser; $1)

//SD_SEQUENCESCOPYRELATIONS
C_TEXT:C284(SD_SequencesCopyRelations; $1)

//SD_SEQUENCESETNEXTDATE
C_TEXT:C284(SD_SEQUENCESetNextDate; $1)
C_TEXT:C284(SD_SEQUENCESetNextDate; $2)
C_TEXT:C284(SD_SEQUENCESetNextDate; $3)

//SD_SEQUENCESSETNEXTACTION
C_TEXT:C284(SD_SEQUENCESsetNextAction; $1)

//SD_SETBANKHOLS
C_DATE:C307(SD_SetBankHols; $1)

//SD_SETCOLOURPREFERENCES
C_LONGINT:C283(SD_SetColourPreferences; $1)
C_BOOLEAN:C305(SD_SetColourPreferences; $2)
C_BOOLEAN:C305(SD_SetColourPreferences; $3)

//SD_SETREMINDER
C_LONGINT:C283(SD_SetReminder; $1)
C_TEXT:C284(SD_SetReminder; $2)
C_BOOLEAN:C305(SD_SetReminder; $3)

//SD_SETSPLITTER
C_POINTER:C301(SD_SetSplitter; $1)
C_REAL:C285(SD_SetSplitter; $2)

//SD_SETTIMEWARNING
C_POINTER:C301(SD_SetTimeWarning; $1)
C_POINTER:C301(SD_SetTimeWarning; $2)

//SD_SETVISIBLE
C_BOOLEAN:C305(SD_SetVisible; $1)

//SD_TABMANAGER
C_LONGINT:C283(SD_TabManager; $1)

//SD_al_TimeTODURATION
C_DATE:C307(SD_TimeToDuration; $1)
C_DATE:C307(SD_TimeToDuration; $2)
C_TIME:C306(SD_TimeToDuration; $3)
C_TIME:C306(SD_TimeToDuration; $4)

//SD_UPDATEREMINDERLIST
C_REAL:C285(SD_UpdateReminderList; $1)
C_TEXT:C284(SD_UpdateReminderList; $2)
C_REAL:C285(SD_UpdateReminderList; $3)

//SD_WORKINGDAYS
C_DATE:C307(SD_WorkingDays; $0)
C_DATE:C307(SD_WorkingDays; $1)
C_LONGINT:C283(SD_WorkingDays; $2)
C_BOOLEAN:C305(SD_WorkingDays; $3)
C_BOOLEAN:C305(SD_WorkingDays; $4)

//SD_WORKINGHOURS
C_TIME:C306(SD_WorkingHours; $0)
C_TIME:C306(SD_WorkingHours; $1)
C_LONGINT:C283(SD_WorkingHours; $2)
C_POINTER:C301(SD_WorkingHours; $3)
C_BOOLEAN:C305(SD_WorkingHours; $4)
C_BOOLEAN:C305(SD_WorkingHours; $5)

//SD_WORKINGMINUTES
C_TIME:C306(SD_WorkingMinutes; $0)
C_TIME:C306(SD_WorkingMinutes; $1)
C_LONGINT:C283(SD_WorkingMinutes; $2)
C_POINTER:C301(SD_WorkingMinutes; $3)
C_BOOLEAN:C305(SD_WorkingMinutes; $4)
C_BOOLEAN:C305(SD_WorkingMinutes; $5)

//Sel_AtOp
C_TEXT:C284(Sel_AtOp; $0)
C_TEXT:C284(Sel_AtOp; $1)
C_TEXT:C284(Sel_AtOp; $2)

//Sel_AtSign
C_TEXT:C284(Sel_AtSign; $0)
C_TEXT:C284(Sel_AtSign; $1)

//Sel_BegArr
C_LONGINT:C283(Sel_BegArr; $1)

//Sel_Beginning
C_BOOLEAN:C305(Sel_Beginning; $1)
C_POINTER:C301(Sel_Beginning; $2)

//Sel_Beginning2
C_BOOLEAN:C305(Sel_Beginning2; $1)
C_POINTER:C301(Sel_Beginning2; $2)

//Sel_Beginning3
C_POINTER:C301(Sel_Beginning3; $1)

//Sel_ButtDown
C_POINTER:C301(Sel_ButtDown; $1)
C_POINTER:C301(Sel_ButtDown; $2)

//Sel_ButtUp
C_POINTER:C301(Sel_ButtUp; $1)
C_POINTER:C301(Sel_ButtUp; $2)

//Sel_c01
C_POINTER:C301(Sel_c01; $1)
C_POINTER:C301(Sel_c01; $2)
C_LONGINT:C283(Sel_c01; $3)
C_LONGINT:C283(Sel_c01; $4)

//Sel_c02
C_POINTER:C301(Sel_c02; $1)
C_POINTER:C301(Sel_c02; $2)
C_LONGINT:C283(Sel_c02; $3)
C_LONGINT:C283(Sel_c02; $4)
C_LONGINT:C283(Sel_c02; $5)

//Sel_c03
C_POINTER:C301(Sel_c03; $1)
C_POINTER:C301(Sel_c03; $2)
C_LONGINT:C283(Sel_c03; $3)
C_LONGINT:C283(Sel_c03; $4)
C_LONGINT:C283(Sel_c03; $5)
C_LONGINT:C283(Sel_c03; $6)

//Sel_c04
C_POINTER:C301(Sel_c04; $1)
C_POINTER:C301(Sel_c04; $2)
C_LONGINT:C283(Sel_c04; $3)
C_LONGINT:C283(Sel_c04; $4)
C_LONGINT:C283(Sel_c04; $5)
C_LONGINT:C283(Sel_c04; $6)
C_LONGINT:C283(Sel_c04; $7)

//Sel_c05
C_POINTER:C301(Sel_c05; $1)
C_POINTER:C301(Sel_c05; $2)
C_LONGINT:C283(Sel_c05; $3)
C_LONGINT:C283(Sel_c05; $4)
C_LONGINT:C283(Sel_c05; $5)
C_LONGINT:C283(Sel_c05; $6)
C_LONGINT:C283(Sel_c05; $7)
C_LONGINT:C283(Sel_c05; $8)

//Sel_c06
C_POINTER:C301(Sel_c06; $1)
C_POINTER:C301(Sel_c06; $2)
C_LONGINT:C283(Sel_c06; $3)
C_LONGINT:C283(Sel_c06; $4)
C_LONGINT:C283(Sel_c06; $5)
C_LONGINT:C283(Sel_c06; $6)
C_LONGINT:C283(Sel_c06; $7)
C_LONGINT:C283(Sel_c06; $8)
C_LONGINT:C283(Sel_c06; $9)

//Sel_CFCalcRel
C_POINTER:C301(Sel_CFCalcRel; $1)
C_POINTER:C301(Sel_CFCalcRel; $2)
C_POINTER:C301(Sel_CFCalcRel; $3)
C_TEXT:C284(Sel_CFCalcRel; $4)
C_POINTER:C301(Sel_CFCalcRel; $5)

//Sel_CompCode
C_TEXT:C284(Sel_CompCode; $0)

//Sel_ContCode
C_TEXT:C284(Sel_ContCode; $0)

//Sel_CritArrL
C_LONGINT:C283(Sel_CritArrL; $1)

//Sel_CritArrS
C_LONGINT:C283(Sel_CritArrS; $1)

//Sel_CritLoadVar
C_TEXT:C284(Sel_CritLoadVar; $1)
C_LONGINT:C283(Sel_CritLoadVar; $2)

//Sel_CritSaveVar
C_TEXT:C284(Sel_CritSaveVar; $1)
C_LONGINT:C283(Sel_CritSaveVar; $2)

//Sel_CrossTable
C_REAL:C285(Sel_CrossTable; $0)
C_LONGINT:C283(Sel_CrossTable; $1)
C_LONGINT:C283(Sel_CrossTable; $2)
C_LONGINT:C283(Sel_CrossTable; $3)
C_TEXT:C284(Sel_CrossTable; $4)
C_TEXT:C284(Sel_CrossTable; $5)
C_POINTER:C301(Sel_CrossTable; $6)
C_POINTER:C301(Sel_CrossTable; $7)
C_POINTER:C301(Sel_CrossTable; $8)
C_POINTER:C301(Sel_CrossTable; $9)
C_TEXT:C284(Sel_CrossTable; $10)
C_TEXT:C284(Sel_CrossTable; $11)
C_TEXT:C284(Sel_CrossTable; $12)
C_TEXT:C284(Sel_CrossTable; $13)
C_POINTER:C301(Sel_CrossTable; $14)
C_POINTER:C301(Sel_CrossTable; $15)
C_REAL:C285(Sel_CrossTable; $16)
C_REAL:C285(Sel_CrossTable; $17)
C_POINTER:C301(Sel_CrossTable; $18)
C_POINTER:C301(Sel_CrossTable; $19)

//Sel_Ending
C_POINTER:C301(Sel_Ending; $1)

//Sel_FindMy
C_POINTER:C301(Sel_FindMy; $1)
C_POINTER:C301(Sel_FindMy; $2)
C_POINTER:C301(Sel_FindMy; $3)

//Sel_LinkMess
C_POINTER:C301(Sel_LinkMess; $1)

//Sel_LPCompCode
C_POINTER:C301(Sel_LPCompCode; $1)
C_POINTER:C301(Sel_LPCompCode; $2)

//Sel_LPmi
C_LONGINT:C283(Sel_LPmi; $0)
C_TEXT:C284(Sel_LPmi; $1)

//Sel_LProc2
C_POINTER:C301(Sel_LProc2; $1)

//Sel_NoAtAt
C_POINTER:C301(Sel_NoAtAt; $1)
C_POINTER:C301(Sel_NoAtAt; $2)
C_TEXT:C284(Sel_NoAtAt; $3)
C_TEXT:C284(Sel_NoAtAt; $4)

//Sel_NoAtAt2
C_POINTER:C301(Sel_NoAtAt2; $1)
C_POINTER:C301(Sel_NoAtAt2; $2)
C_POINTER:C301(Sel_NoAtAt2; $3)
C_TEXT:C284(Sel_NoAtAt2; $4)
C_TEXT:C284(Sel_NoAtAt2; $5)

//Sel_NoAtAt3
C_POINTER:C301(Sel_NoAtAt3; $1)
C_POINTER:C301(Sel_NoAtAt3; $2)
C_POINTER:C301(Sel_NoAtAt3; $3)
C_POINTER:C301(Sel_NoAtAt3; $4)
C_TEXT:C284(Sel_NoAtAt3; $5)
C_TEXT:C284(Sel_NoAtAt3; $6)

//Sel_OpGen
C_TEXT:C284(Sel_OpGen; $1)

//Sel_RemSets
C_TEXT:C284(Sel_RemSets; $1)
C_BOOLEAN:C305(Sel_RemSets; $2)
C_POINTER:C301(Sel_RemSets; $3)

//Sel_S
C_POINTER:C301(Sel_S; $1)
C_POINTER:C301(Sel_S; $2)
C_TEXT:C284(Sel_S; $3)

//Sel_SCurr
C_POINTER:C301(Sel_SCurr; $1)
C_POINTER:C301(Sel_SCurr; $2)
C_TEXT:C284(Sel_SCurr; $3)

//Sel_Set
C_POINTER:C301(Sel_Set; $1)

//Sel_SetAny
C_TEXT:C284(Sel_SetAny; $1)
C_POINTER:C301(Sel_SetAny; $2)

//Sel_SetAny2
C_TEXT:C284(Sel_SetAny2; $1)
C_TEXT:C284(Sel_SetAny2; $2)
C_POINTER:C301(Sel_SetAny2; $3)
C_POINTER:C301(Sel_SetAny2; $4)

//Sel_SetAny3
C_TEXT:C284(Sel_SetAny3; $1)
C_POINTER:C301(Sel_SetAny3; $2)
C_POINTER:C301(Sel_SetAny3; $3)

//Sel_SIBetDate
C_POINTER:C301(Sel_SIBetDate; $1)
C_POINTER:C301(Sel_SIBetDate; $2)
C_POINTER:C301(Sel_SIBetDate; $3)
C_DATE:C307(Sel_SIBetDate; $4)
C_DATE:C307(Sel_SIBetDate; $5)

//Sel_SIDate
C_POINTER:C301(Sel_SIDate; $1)
C_POINTER:C301(Sel_SIDate; $2)
C_DATE:C307(Sel_SIDate; $3)
C_DATE:C307(Sel_SIDate; $4)

//Sel_SINum
C_POINTER:C301(Sel_SINum; $1)
C_POINTER:C301(Sel_SINum; $2)
C_REAL:C285(Sel_SINum; $3)
C_REAL:C285(Sel_SINum; $4)

//Sel_SIS
C_POINTER:C301(Sel_SIS; $1)

//Sel_SIString
C_POINTER:C301(Sel_SIString; $1)
C_POINTER:C301(Sel_SIString; $2)
C_TEXT:C284(Sel_SIString; $3)
C_TEXT:C284(Sel_SIString; $4)

//Sel_SLay
C_POINTER:C301(Sel_SLay; $1)
C_POINTER:C301(Sel_SLay; $2)
C_TEXT:C284(Sel_SLay; $3)

//Sel_SLayer
C_POINTER:C301(Sel_SLayer; $1)
C_POINTER:C301(Sel_SLayer; $2)
C_TEXT:C284(Sel_SLayer; $3)

//Sel_SNum
C_POINTER:C301(Sel_SNum; $1)
C_POINTER:C301(Sel_SNum; $2)
C_REAL:C285(Sel_SNum; $3)

//Sel_SRadio
C_POINTER:C301(Sel_SRadio; $1)
C_POINTER:C301(Sel_SRadio; $2)
C_LONGINT:C283(Sel_SRadio; $3)
C_BOOLEAN:C305(Sel_SRadio; $4)

//Sel_SSDate
C_POINTER:C301(Sel_SSDate; $1)
C_POINTER:C301(Sel_SSDate; $2)
C_DATE:C307(Sel_SSDate; $3)
C_DATE:C307(Sel_SSDate; $4)

//Sel_SSNum
C_POINTER:C301(Sel_SSNum; $1)
C_POINTER:C301(Sel_SSNum; $2)
C_REAL:C285(Sel_SSNum; $3)
C_REAL:C285(Sel_SSNum; $4)

//Sel_SSRadio
C_POINTER:C301(Sel_SSRadio; $1)
C_POINTER:C301(Sel_SSRadio; $2)
C_LONGINT:C283(Sel_SSRadio; $3)
C_BOOLEAN:C305(Sel_SSRadio; $4)

//Sel_SSStrSin
C_POINTER:C301(Sel_SSStrSin; $1)
C_POINTER:C301(Sel_SSStrSin; $2)
C_TEXT:C284(Sel_SSStrSin; $3)

//Sel_State
C_POINTER:C301(Sel_State; $1)
C_POINTER:C301(Sel_State; $2)

//Sel_StatePosNeg
C_LONGINT:C283(Sel_StatePosNeg; $0)

//SELECTFOLDERONSERVER
C_LONGINT:C283(SelectFolderOnServer; $1)

//SELFSTART
C_BOOLEAN:C305(SelfStart; $0)
C_TEXT:C284(SelfStart; $1)
C_TEXT:C284(SelfStart; $2)

//SelOr_1
C_POINTER:C301(SelOr_1; $1)

//SelOr_2
C_POINTER:C301(SelOr_2; $1)

//SelOr_3
C_POINTER:C301(SelOr_3; $1)

//Send_Email_Menu
C_LONGINT:C283(Send_Email_Menu; $1)

//SEND_TO_FILE
C_TIME:C306(SEND_TO_FILE; $1)
C_TEXT:C284(SEND_TO_FILE; $2)
C_BOOLEAN:C305(SEND_TO_FILE; $3)

//SER_GETDATAFILESIZE
C_LONGINT:C283(SER_GetDatafileSize; $1)

//Set_Fonts
C_TEXT:C284(Set_Fonts; $1)
C_LONGINT:C283(Set_Fonts; $2)

//Set_FontsFS
C_TEXT:C284(Set_FontsFS; $1)
C_TEXT:C284(Set_FontsFS; $2)
C_LONGINT:C283(Set_FontsFS; $3)

//SETMACHINEPDFWRITER
C_LONGINT:C283(SetMachinePDFWriter; $0)
C_TEXT:C284(SetMachinePDFWriter; $1)

//SET_DOCUMENTCODE
C_LONGINT:C283(Set_DocumentCode; $1)
C_TEXT:C284(Set_DocumentCode; $2)
C_TEXT:C284(Set_DocumentCode; $3)

//SET_INDEX_PRIORITIES
C_LONGINT:C283(Set_INDEX_PRIORITIES; $1)
C_BOOLEAN:C305(Set_INDEX_PRIORITIES; $2)

//SET_THERMOMETER
C_TEXT:C284(SET_THERMOMETER; $1)
C_LONGINT:C283(SET_THERMOMETER; $2)

//SINGLE SWITCH
C_TEXT:C284(Single_Switch; $1)
C_LONGINT:C283(Single_Switch; $2)

//SI_ALLOCATIONVALIDATION
C_TEXT:C284(SI_AllocationValidation; $1)
C_BOOLEAN:C305(SI_AllocationValidation; $2)

//SI_TRANSFER
C_BOOLEAN:C305(SI_Transfer; $1)
C_LONGINT:C283(SI_Transfer; $2)
C_LONGINT:C283(SI_Transfer; $3)

//SI_TRANSFERTAXDATE
C_BOOLEAN:C305(SI_TransferTaxDate; $1)
C_LONGINT:C283(SI_TransferTaxDate; $2)
C_LONGINT:C283(SI_TransferTaxDate; $3)

//SMSRELAY_URL_ENCODE
C_TEXT:C284(SMSRelay_URL_Encode; $0)
C_TEXT:C284(SMSRelay_URL_Encode; $1)

//SMS_ADDMESSAGELOG
C_TEXT:C284(SMS_AddMessageLog; $1)
C_TEXT:C284(SMS_AddMessageLog; $2)
C_TEXT:C284(SMS_AddMessageLog; $3)
C_REAL:C285(SMS_AddMessageLog; $4)
C_TEXT:C284(SMS_AddMessageLog; $5)
C_TEXT:C284(SMS_AddMessageLog; $6)

//SMS_DIALLINGCODESLOOKUP
C_TEXT:C284(SMS_DiallingCodesLookup; $0)
C_POINTER:C301(SMS_DiallingCodesLookup; $1)

//SMS_INTLPHONENUMBER
C_TEXT:C284(SMS_IntlPhoneNumber; $0)
C_POINTER:C301(SMS_IntlPhoneNumber; $1)

//SMS_SENDMESSAGE
C_BOOLEAN:C305(SMS_SendMessage; $0)
C_TEXT:C284(SMS_SendMessage; $1)
C_TEXT:C284(SMS_SendMessage; $2)
C_POINTER:C301(SMS_SendMessage; $3)
C_POINTER:C301(SMS_SendMessage; $4)
C_BOOLEAN:C305(SMS_SendMessage; $5)

//SMS_SENDMESSAGE2
C_POINTER:C301(SMS_SendMessage2; $1)
C_POINTER:C301(SMS_SendMessage2; $2)
C_BOOLEAN:C305(SMS_SendMessage2; $3)

//SMS_SENDMSG2
C_TEXT:C284(SMS_SendMsg2; $0)
C_TEXT:C284(SMS_SendMsg2; $1)
C_TEXT:C284(SMS_SendMsg2; $2)
C_TEXT:C284(SMS_SendMsg2; $3)
C_TEXT:C284(SMS_SendMsg2; $4)
C_BOOLEAN:C305(SMS_SendMsg2; $5)
C_TEXT:C284(SMS_SendMsg2; $6)

//SMS_SENDONEMESSAGE
C_POINTER:C301(SMS_SendOneMessage; $1)

//SM_CHECKACTIONOK
C_BOOLEAN:C305(SM_CheckActionOK; $0)
C_TEXT:C284(SM_CheckActionOK; $1)
C_TEXT:C284(SM_CheckActionOK; $2)
C_REAL:C285(SM_CheckActionOK; $3)

//SM_CONTEXTIDFROMTABLE
C_REAL:C285(SM_ContextIDfromTable; $0)
C_REAL:C285(SM_ContextIDfromTable; $1)

//SM_LISTITEMSHARED
C_LONGINT:C283(SM_ListItemShared; $1)

//SM_LOADSET
C_TEXT:C284(SM_LoadSet; $0)
C_LONGINT:C283(SM_LoadSet; $1)
C_BOOLEAN:C305(SM_LoadSet; $2)
C_BOOLEAN:C305(SM_LoadSet; $3)

//SM_MODIFYSELECTION
C_LONGINT:C283(SM_ModifySelection; $1)
C_LONGINT:C283(SM_ModifySelection; $2)

//SM_SAVESET
C_LONGINT:C283(SM_saveSet; $0)
C_TEXT:C284(SM_saveSet; $1)
C_LONGINT:C283(SM_saveSet; $2)

//SM_SENDSETSELECTION
C_BOOLEAN:C305(SM_SendSetSelection; $0)
C_TEXT:C284(SM_SendSetSelection; $1)
C_REAL:C285(SM_SendSetSelection; $2)
C_REAL:C285(SM_SendSetSelection; $3)

//SM_SETOBJECTPOSITION
C_TEXT:C284(SM_SETOBJECTPOSITION; $1)
C_LONGINT:C283(SM_SETOBJECTPOSITION; $2)
C_LONGINT:C283(SM_SETOBJECTPOSITION; $3)
C_LONGINT:C283(SM_SETOBJECTPOSITION; $4)
C_LONGINT:C283(SM_SETOBJECTPOSITION; $5)

//SM_SETRELOAD
C_LONGINT:C283(SM_SetReload; $1)

//SM_SHOWHIDEACTIONS
C_BOOLEAN:C305(SM_ShowHideActions; $1)

//SM_TABLEFROMCONTEXTID
C_LONGINT:C283(SM_TableFromContextID; $0)
C_LONGINT:C283(SM_TableFromContextID; $1)

//SM_UPDATEARRAYS
C_TEXT:C284(SM_UpdateArrays; $1)
C_TEXT:C284(SM_UpdateArrays; $2)
C_REAL:C285(SM_UpdateArrays; $3)
C_REAL:C285(SM_UpdateArrays; $4)
C_TEXT:C284(SM_UpdateArrays; $5)
C_REAL:C285(SM_UpdateArrays; $6)
C_TEXT:C284(SM_UpdateArrays; $7)
C_REAL:C285(SM_UpdateArrays; $8)
C_TEXT:C284(SM_UpdateArrays; $9)

//SM_UPDATEDATA
C_BOOLEAN:C305(SM_UPDATEDATA; $1)
C_BOOLEAN:C305(SM_UPDATEDATA; $2)

//SPCALLSHOWPIPELINE
C_LONGINT:C283(SPCallShowPipeline; $1)
C_LONGINT:C283(SPCallShowPipeline; $2)
C_LONGINT:C283(SPCallShowPipeline; $3)
C_TEXT:C284(SPCallShowPipeline; $4)
C_DATE:C307(SPCallShowPipeline; $5)
C_DATE:C307(SPCallShowPipeline; $6)
C_LONGINT:C283(SPCallShowPipeline; $7)
C_LONGINT:C283(SPCallShowPipeline; $8)

//SPLASH_END_GRACEFULLY
C_TEXT:C284(SPLASH_END_GRACEFULLY; $1)
C_BOOLEAN:C305(SPLASH_END_GRACEFULLY; $2)

//SPLASH_GETAVGTIMER
C_LONGINT:C283(SPLASH_GETAVGTIMER; $0)

//SPLASH_MESSAGE
C_TEXT:C284(SPLASH_MESSAGE; $1)

//SPLASH_SAVEAVGTIMER
C_LONGINT:C283(SPLASH_SAVEAVGTIMER; $1)

//SPLASH_SET_AUTO_UPDATE
C_LONGINT:C283(SPLASH_SET_AUTO_UPDATE; $1)

//SPLASH_THERMO
C_BOOLEAN:C305(SPLASH_THERMO; $1)

//SPLASH_TIMER
C_LONGINT:C283(SPLASH_TIMER; $1)
C_REAL:C285(SPLASH_TIMER; $2)

//SPLASH_UPDATE
C_TEXT:C284(SPLASH_UPDATE; $1)
C_LONGINT:C283(SPLASH_UPDATE; $2)
C_LONGINT:C283(SPLASH_UPDATE; $3)
C_BOOLEAN:C305(SPLASH_UPDATE; $4)

//SP_CALCMARGIN
C_REAL:C285(SP_CalcMargin; $0)
C_REAL:C285(SP_CalcMargin; $1)
C_REAL:C285(SP_CalcMargin; $2)

//SP_CALCVALUE
C_REAL:C285(SP_calcValue; $0)
C_REAL:C285(SP_calcValue; $1)
C_REAL:C285(SP_calcValue; $2)

//SP_ENTERRELATEDPIPELINE
C_POINTER:C301(SP_EnterRelatedPipeline; $1)

//SP_FINDPIPELINE
C_REAL:C285(SP_FindPipeline; $1)
C_DATE:C307(SP_FindPipeline; $2)
C_DATE:C307(SP_FindPipeline; $3)
C_REAL:C285(SP_FindPipeline; $4)
C_POINTER:C301(SP_FindPipeline; $5)
C_REAL:C285(SP_FindPipeline; $6)
C_REAL:C285(SP_FindPipeline; $7)

//SP_FINDTARGETS
C_REAL:C285(SP_FindTargets; $1)
C_REAL:C285(SP_FindTargets; $2)
C_TEXT:C284(SP_FindTargets; $3)
C_DATE:C307(SP_FindTargets; $4)
C_DATE:C307(SP_FindTargets; $5)
C_POINTER:C301(SP_FindTargets; $6)
C_REAL:C285(SP_FindTargets; $7)

//SP_GETOTHERRELATED
C_POINTER:C301(SP_GetOtherrelated; $1)
C_POINTER:C301(SP_GetOtherrelated; $2)
C_POINTER:C301(SP_GetOtherrelated; $3)
C_POINTER:C301(SP_GetOtherrelated; $4)
C_POINTER:C301(SP_GetOtherrelated; $5)

//SP_GETPREVIOUSYEARS
C_LONGINT:C283(SP_GetPreviousYears; $1)
C_LONGINT:C283(SP_GetPreviousYears; $2)
C_TEXT:C284(SP_GetPreviousYears; $3)
C_LONGINT:C283(SP_GetPreviousYears; $4)

//SP_GETREPORTSFOLDER
C_TEXT:C284(SP_GetreportsFolder; $0)

//SP_GETSALESORDERDATE
C_DATE:C307(SP_GetSalesOrderDate; $0)
C_LONGINT:C283(SP_GetSalesOrderDate; $1)
C_TEXT:C284(SP_GetSalesOrderDate; $2)
C_LONGINT:C283(SP_GetSalesOrderDate; $3)

//SP_GETSALESORDERSTATE
C_LONGINT:C283(SP_GetSalesOrderState; $0)
C_LONGINT:C283(SP_GetSalesOrderState; $1)
C_TEXT:C284(SP_GetSalesOrderState; $2)
C_LONGINT:C283(SP_GetSalesOrderState; $3)
C_BOOLEAN:C305(SP_GetSalesOrderState; $4)

//SP_GETSALESORDERVALUE
C_REAL:C285(SP_GetSalesOrderValue; $0)
C_LONGINT:C283(SP_GetSalesOrderValue; $1)
C_TEXT:C284(SP_GetSalesOrderValue; $2)
C_POINTER:C301(SP_GetSalesOrderValue; $3)
C_POINTER:C301(SP_GetSalesOrderValue; $4)
C_POINTER:C301(SP_GetSalesOrderValue; $5)
C_POINTER:C301(SP_GetSalesOrderValue; $6)

//SP_GETSALETYPE
C_LONGINT:C283(SP_GetSaleType; $0)
C_LONGINT:C283(SP_GetSaleType; $1)
C_LONGINT:C283(SP_GetSaleType; $2)
C_BOOLEAN:C305(SP_GetSaleType; $3)

//SP_GETUSERSANDGROUPS
C_REAL:C285(SP_GetUsersAndGroups; $1)

//SP_LOADCOMPANY
C_TEXT:C284(SP_LoadCompany; $0)
C_LONGINT:C283(SP_LoadCompany; $1)

//SP_LOADCONTACT
C_TEXT:C284(SP_loadContact; $0)
C_LONGINT:C283(SP_loadContact; $1)

//SP_LOADCURRENCYNAME
C_TEXT:C284(SP_LoadCurrencyName; $0)
C_LONGINT:C283(SP_LoadCurrencyName; $1)

//SP_LOADLINKTYPES
C_BOOLEAN:C305(SP_LoadLinkTypes; $1)

//SP_LOADPERSONELGROUP
C_TEXT:C284(SP_LoadPersonelGroup; $0)
C_LONGINT:C283(SP_LoadPersonelGroup; $1)

//SP_LOADPERSONNEL
C_TEXT:C284(SP_loadPersonnel; $0)
C_LONGINT:C283(SP_loadPersonnel; $1)

//SP_LOADRELATED
C_POINTER:C301(SP_LoadRelated; $1)
C_POINTER:C301(SP_LoadRelated; $2)
C_POINTER:C301(SP_LoadRelated; $3)
C_POINTER:C301(SP_LoadRelated; $4)
C_POINTER:C301(SP_LoadRelated; $5)
C_LONGINT:C283(SP_LoadRelated; $6)

//SP_LOADSTATES
C_LONGINT:C283(SP_LoadStates; $1)

//SP_LOADTARGETPROJECTIONS
C_LONGINT:C283(SP_LoadTargetProjections; $1)

//SP_MODIFYPIPELINE
C_LONGINT:C283(SP_ModifyPipeline; $1)
C_LONGINT:C283(SP_ModifyPipeline; $2)
C_TEXT:C284(SP_ModifyPipeline; $3)
C_TEXT:C284(SP_ModifyPipeline; $4)

//SP_MODIFYTARGET
C_LONGINT:C283(SP_ModifyTarget; $1)
C_LONGINT:C283(SP_ModifyTarget; $2)
C_TEXT:C284(SP_ModifyTarget; $3)
C_TEXT:C284(SP_ModifyTarget; $4)

//SP_NEWPIPELINE
C_BOOLEAN:C305(SP_NewPipeline; $1)
C_LONGINT:C283(SP_NewPipeline; $2)
C_LONGINT:C283(SP_NewPipeline; $3)
C_TEXT:C284(SP_NewPipeline; $4)
C_TEXT:C284(SP_NewPipeline; $5)
C_REAL:C285(SP_NewPipeline; $6)
C_REAL:C285(SP_NewPipeline; $7)
C_TEXT:C284(SP_NewPipeline; $8)
C_TEXT:C284(SP_NewPipeline; $9)
C_LONGINT:C283(SP_NewPipeline; $10)
C_LONGINT:C283(SP_NewPipeline; $11)


//SP_NEWPIPELINE_OLD
C_BOOLEAN:C305(SP_NewPipeline_OLD; $1)
C_LONGINT:C283(SP_NewPipeline_OLD; $2)
C_LONGINT:C283(SP_NewPipeline_OLD; $3)
C_TEXT:C284(SP_NewPipeline_OLD; $4)
C_TEXT:C284(SP_NewPipeline_OLD; $5)
C_REAL:C285(SP_NewPipeline_OLD; $6)
C_REAL:C285(SP_NewPipeline_OLD; $7)
C_TEXT:C284(SP_NewPipeline_OLD; $8)
C_TEXT:C284(SP_NewPipeline_OLD; $9)

//SP_NEWTARGET
C_BOOLEAN:C305(SP_NewTarget; $1)
C_BOOLEAN:C305(SP_NewTarget; $2)
C_LONGINT:C283(SP_NewTarget; $3)
C_LONGINT:C283(SP_NewTarget; $4)
C_TEXT:C284(SP_NewTarget; $5)

//SP_PRINTSTDREPORT
C_LONGINT:C283(SP_PrintSTDreport; $1)
C_LONGINT:C283(SP_PrintSTDreport; $2)
C_LONGINT:C283(SP_PrintSTDreport; $3)

//SP_PVTARGETENTRY
C_LONGINT:C283(SP_PVTargetEntry; $1)
C_LONGINT:C283(SP_PVTargetEntry; $2)
C_LONGINT:C283(SP_PVTargetEntry; $3)


//SP_SETREADWRITE
C_LONGINT:C283(SP_SetReadWrite; $1)
C_BOOLEAN:C305(SP_SetReadWrite; $2)
C_BOOLEAN:C305(SP_SetReadWrite; $3)

//SP_SETUPMULTIPLE
C_BOOLEAN:C305(SP_SetUpMultiple; $0)
C_LONGINT:C283(SP_SetUpMultiple; $1)
C_LONGINT:C283(SP_SetUpMultiple; $2)
C_DATE:C307(SP_SetUpMultiple; $3)
C_DATE:C307(SP_SetUpMultiple; $4)
C_BOOLEAN:C305(SP_SetUpMultiple; $5)

//SP_SORTDATE
C_LONGINT:C283(SP_SortDate; $0)
C_DATE:C307(SP_SortDate; $1)
C_DATE:C307(SP_SortDate; $2)

//SP_UPDATEDIARY
C_LONGINT:C283(SP_UpdateDiary; $1)
C_LONGINT:C283(SP_UpdateDiary; $2)

//SP_UPDATEPIPELINE
C_LONGINT:C283(SP_UpdatePipeline; $1)
C_LONGINT:C283(SP_UpdatePipeline; $2)
C_TEXT:C284(SP_UpdatePipeline; $3)
C_TEXT:C284(SP_UpdatePipeline; $4)
C_LONGINT:C283(SP_UpdatePipeline; $5)
C_TEXT:C284(SP_UpdatePipeline; $6)
C_LONGINT:C283(SP_UpdatePipeline; $7)
C_TEXT:C284(SP_UpdatePipeline; $8)
C_TEXT:C284(SP_UpdatePipeline; $9)
C_LONGINT:C283(SP_UpdatePipeline; $10)
C_TEXT:C284(SP_UpdatePipeline; $11)
C_TEXT:C284(SP_UpdatePipeline; $12)

//SP_UPDATEPROJECTIONFROMPV
C_LONGINT:C283(SP_UpdateProjectionfromPV; $1)

//SP_UPDATETARGETFROMPV
C_REAL:C285(SP_UpdateTargetFromPV; $1)

//SR_CallPrint
C_TEXT:C284(SR_CallPrint; $1)
C_TEXT:C284(SR_CallPrint; $2)
C_LONGINT:C283(SR_CallPrint; $3)

//SR_Print_Res2
C_LONGINT:C283(SR_Print_Res2; $0)
C_TEXT:C284(SR_Print_Res2; $1)
C_TEXT:C284(SR_Print_Res2; $2)
C_LONGINT:C283(SR_Print_Res2; $3)

//SR_Print_Result
C_LONGINT:C283(SR_Print_Result; $0)
C_TEXT:C284(SR_Print_Result; $1)
C_TEXT:C284(SR_Print_Result; $2)
C_LONGINT:C283(SR_Print_Result; $3)

//SR_Print2
C_TEXT:C284(SR_Print2; $1)
C_TEXT:C284(SR_Print2; $2)
C_LONGINT:C283(SR_Print2; $3)

//SR_ReportOK
C_BOOLEAN:C305(SR_ReportOK; $0)
C_TEXT:C284(SR_ReportOK; $1)

//SR_REPORTEDITOR
C_LONGINT:C283(SR_ReportEditor; $0)
C_LONGINT:C283(SR_ReportEditor; $1)
C_TEXT:C284(SR_ReportEditor; $2)
C_LONGINT:C283(SR_ReportEditor; $3)
C_TEXT:C284(SR_ReportEditor; $4)
C_LONGINT:C283(SR_ReportEditor; $5)
C_LONGINT:C283(SR_ReportEditor; $6)

//Standing_Check
C_LONGINT:C283(Standing_Check; $0)

//Start_ProcCount
C_TEXT:C284(Start_ProcCount; $1)

//Start_Process
C_TEXT:C284(Start_Process; $1)

//Start_Semaphore
C_TEXT:C284(START_SEMAPHORE; $1)

//Startup_GLOBMod
C_BOOLEAN:C305(Startup_GLOBMod; $0)
C_LONGINT:C283(Startup_GLOBMod; $1)
C_LONGINT:C283(Startup_GLOBMod; $2)

//Startup_Import2
C_LONGINT:C283(Startup_Import2; $1)

//Startup_Page2Im
C_TEXT:C284(Startup_Page2Im; $1)


//States_Create
C_TEXT:C284(States_Create; $1)
C_TEXT:C284(States_Create; $2)
C_LONGINT:C283(States_Create; $3)
C_TEXT:C284(States_Create; $4)
C_TEXT:C284(States_Create; $5)
C_TEXT:C284(States_Create; $6)

//States_CUArr
C_POINTER:C301(States_CUArr; $1)

//States_Down
C_POINTER:C301(States_Down; $1)

//States_Load2
C_LONGINT:C283(States_Load2; $1)

//States_Relate
C_POINTER:C301(States_Relate; $1)

//States_Start
C_POINTER:C301(States_Start; $1)

//States_Up
C_POINTER:C301(States_Up; $1)

//STATES_LOAD_POPUP
C_POINTER:C301(States_Load_POPUP; $1)
C_POINTER:C301(States_Load_POPUP; $2)
C_POINTER:C301(States_Load_POPUP; $3)
C_POINTER:C301(States_Load_POPUP; $4)

//StatsView_ArF1
C_LONGINT:C283(StatsView_ArF1; $1)
C_BOOLEAN:C305(StatsView_ArF1; $2)

//StatsView_ArF1S
C_TEXT:C284(StatsView_ArF1S; $1)

//StatsView_ArF3
C_LONGINT:C283(StatsView_ArF3; $1)

//StatsView_ArFi
C_LONGINT:C283(StatsView_ArFi; $1)

//StatsView_ArFiS
C_TEXT:C284(StatsView_ArFiS; $1)

//StatsView_Arr
C_LONGINT:C283(StatsView_Arr; $1)
C_LONGINT:C283(StatsView_Arr; $2)

//StatsView_Cal1C
C_LONGINT:C283(StatsView_Cal1C; $1)

//StatsView_CFEnd
C_POINTER:C301(StatsView_CFEnd; $1)

//StatsView_Disp
C_TEXT:C284(StatsView_Disp; $1)
C_POINTER:C301(StatsView_Disp; $2)
C_TEXT:C284(StatsView_Disp; $3)

//StatsView_FFS2
C_TEXT:C284(StatsView_FFS2; $1)
C_LONGINT:C283(StatsView_FFS2; $2)

//StatsView_FFS3
C_POINTER:C301(StatsView_FFS3; $1)

//StatsView_FFSS
C_POINTER:C301(StatsView_FFSS; $1)
C_TEXT:C284(StatsView_FFSS; $2)
C_LONGINT:C283(StatsView_FFSS; $3)
//StatsView_Mess1
C_TEXT:C284(StatsView_Mess1; $1)

//StatsView_Upd3
C_LONGINT:C283(StatsView_Upd3; $1)

//StatsView_Upd3F
C_LONGINT:C283(StatsView_Upd3F; $1)

//StatsView_Upd4
C_LONGINT:C283(StatsView_Upd4; $1)

//StatsView_Upd4F
C_LONGINT:C283(StatsView_Upd4F; $1)

//StatsView_UpdS
C_LONGINT:C283(StatsView_UpdS; $1)
C_POINTER:C301(StatsView_UpdS; $2)
C_LONGINT:C283(StatsView_UpdS; $3)
C_BOOLEAN:C305(StatsView_UpdS; $4)

//StatsView_ViewF
C_LONGINT:C283(StatsView_ViewF; $1)


//STK_RETRIEVEDRAGGEDLINES
C_POINTER:C301(STK_RetrieveDraggedLines; $1)

//Stock_SelLP
C_LONGINT:C283(Stock_SelLP; $0)
C_LONGINT:C283(Stock_SelLP; $1)

//Stock_SelP
C_LONGINT:C283(Stock_SelP; $1)
C_POINTER:C301(Stock_SelP; $2)
C_POINTER:C301(Stock_SelP; $3)

//StockAss_Calc2
C_LONGINT:C283(StockAss_Calc2; $0)

//StockAss_CalSe2
C_LONGINT:C283(StockAss_CalSe2; $1)

//StockAss_CalSe3
C_LONGINT:C283(StockAss_CalSe3; $1)

//StockAss_DisIns
C_LONGINT:C283(StockAss_DisIns; $1)

//StockAss_Movt
C_REAL:C285(StockAss_Movt; $0)
C_LONGINT:C283(StockAss_Movt; $1)
C_TEXT:C284(StockAss_Movt; $2)

//StockAss_Movt2
C_TEXT:C284(StockAss_Movt2; $1)
C_LONGINT:C283(StockAss_Movt2; $2)
C_LONGINT:C283(StockAss_Movt2; $3)
C_TEXT:C284(StockAss_Movt2; $4)
C_LONGINT:C283(StockAss_Movt2; $5)

//StockCurr_ACLS2
C_TEXT:C284(StockCurr_ACLS2; $1)
C_TEXT:C284(StockCurr_ACLS2; $2)
C_TEXT:C284(StockCurr_ACLS2; $3)

//StockCurr_Expct
C_TEXT:C284(StockCurr_Expct; $0)
C_TEXT:C284(StockCurr_Expct; $1)
C_TEXT:C284(StockCurr_Expct; $2)

//StockCurr_Fmul2
C_REAL:C285(StockCurr_Fmul2; $0)
C_TEXT:C284(StockCurr_Fmul2; $1)
C_TEXT:C284(StockCurr_Fmul2; $2)
C_TEXT:C284(StockCurr_Fmul2; $3)
C_TEXT:C284(StockCurr_Fmul2; $4)
C_TEXT:C284(StockCurr_Fmul2; $5)
C_TEXT:C284(StockCurr_Fmul2; $6)

//StockCurr_Fmula
C_REAL:C285(StockCurr_Fmula; $0)
C_TEXT:C284(StockCurr_Fmula; $1)
C_TEXT:C284(StockCurr_Fmula; $2)
C_TEXT:C284(StockCurr_Fmula; $3)
C_TEXT:C284(StockCurr_Fmula; $4)
C_TEXT:C284(StockCurr_Fmula; $5)
C_TEXT:C284(StockCurr_Fmula; $6)

//StockCurr_SelLP
C_LONGINT:C283(StockCurr_SelLP; $0)
C_LONGINT:C283(StockCurr_SelLP; $1)

//StockCurr_SelP
C_REAL:C285(StockCurr_SelP; $1)
C_POINTER:C301(StockCurr_SelP; $2)
C_POINTER:C301(StockCurr_SelP; $3)

//StockI_CopyPrevProcess
C_TEXT:C284(StockI_CopyPrevProcess; $1)
C_TEXT:C284(StockI_CopyPrevProcess; $2)
C_TEXT:C284(StockI_CopyPrevProcess; $3)
C_TEXT:C284(StockI_CopyPrevProcess; $4)
C_TEXT:C284(StockI_CopyPrevProcess; $5)
C_TEXT:C284(StockI_CopyPrevProcess; $6)

//StockI_CurrDisp
C_TEXT:C284(StockI_CurrDisp; $1)

//StockI_SubLPSN
C_POINTER:C301(StockI_SubLPSN; $1)
C_POINTER:C301(StockI_SubLPSN; $2)
C_POINTER:C301(StockI_SubLPSN; $3)

//StockI_SubLPX
C_POINTER:C301(StockI_SubLPX; $1)

//StockLev_ACLS2
C_TEXT:C284(StockLev_ACLS2; $1)
C_TEXT:C284(StockLev_ACLS2; $2)
C_TEXT:C284(StockLev_ACLS2; $3)

//StockLev_Fmul2
C_REAL:C285(StockLev_Fmul2; $0)
C_TEXT:C284(StockLev_Fmul2; $1)
C_TEXT:C284(StockLev_Fmul2; $2)
C_TEXT:C284(StockLev_Fmul2; $3)
C_TEXT:C284(StockLev_Fmul2; $4)
C_TEXT:C284(StockLev_Fmul2; $5)
C_TEXT:C284(StockLev_Fmul2; $6)

//StockLev_Fmula
C_REAL:C285(StockLev_Fmula; $0)
C_TEXT:C284(StockLev_Fmula; $1)
C_TEXT:C284(StockLev_Fmula; $2)
C_TEXT:C284(StockLev_Fmula; $3)
C_TEXT:C284(StockLev_Fmula; $4)
C_TEXT:C284(StockLev_Fmula; $5)
C_TEXT:C284(StockLev_Fmula; $6)

//StockLev_SelLP
C_LONGINT:C283(StockLev_SelLP; $0)
C_LONGINT:C283(StockLev_SelLP; $1)

//StockLev_SelP
C_LONGINT:C283(StockLev_SelP; $1)
C_POINTER:C301(StockLev_SelP; $2)
C_POINTER:C301(StockLev_SelP; $3)

//STOCK_AUTOLEVEL
C_TEXT:C284(STOCK_AutoLevel; $1)
C_LONGINT:C283(STOCK_AutoLevel; $2)
C_TEXT:C284(STOCK_AutoLevel; $3)
C_TEXT:C284(STOCK_AutoLevel; $4)
C_TEXT:C284(STOCK_AutoLevel; $5)
C_TEXT:C284(STOCK_AutoLevel; $6)
C_TEXT:C284(STOCK_AutoLevel; $7)

//STOCK_BUILDUNIQUE
C_TEXT:C284(STOCK_BuildUnique; $0)
C_TEXT:C284(STOCK_BuildUnique; $1)
C_TEXT:C284(STOCK_BuildUnique; $2)
C_TEXT:C284(STOCK_BuildUnique; $3)
C_TEXT:C284(STOCK_BuildUnique; $4)
C_TEXT:C284(STOCK_BuildUnique; $5)
C_TEXT:C284(STOCK_BuildUnique; $6)

//STOCK_CLEANCODE
C_TEXT:C284(STOCK_CLEANCODE; $0)
C_TEXT:C284(STOCK_CLEANCODE; $1)

//STOCK_FINDCURRENT
C_LONGINT:C283(STOCK_FindCurrent; $1)
C_TEXT:C284(STOCK_FindCurrent; $2)

//STOCK_ITEMSUPDATE
C_BOOLEAN:C305(STOCK_itemsUpdate; $1)
C_LONGINT:C283(STOCK_itemsUpdate; $2)
C_REAL:C285(STOCK_itemsUpdate; $3)

//STOCK_LINKMOVEMENTS
C_BOOLEAN:C305(STOCK_LINKMOVEMENTS; $0)
C_TEXT:C284(STOCK_LINKMOVEMENTS; $1)
C_TEXT:C284(STOCK_LINKMOVEMENTS; $2)
C_TEXT:C284(STOCK_LINKMOVEMENTS; $3)
C_TEXT:C284(STOCK_LINKMOVEMENTS; $4)

//STOCK_LOADITEMS
C_TEXT:C284(STOCK_LoadItems; $1)

//STOCK_UPDATEITEMCT
C_REAL:C285(STOCK_UpdateItemCT; $1)
C_REAL:C285(STOCK_UpdateItemCT; $2)

//Stop_Semaphore
C_TEXT:C284(Stop_Semaphore; $1)

//Str_AlphaOnly
C_TEXT:C284(Str_AlphaOnly; $0)
C_TEXT:C284(Str_AlphaOnly; $1)

//Str_AlphaOnly2
C_TEXT:C284(Str_AlphaOnly2; $0)
C_TEXT:C284(Str_AlphaOnly2; $1)

//Str_CountStr
C_LONGINT:C283(STR_CountStr; $0)
C_TEXT:C284(STR_CountStr; $1)
C_TEXT:C284(STR_CountStr; $2)

//Str_DatePos1
C_LONGINT:C283(Str_DatePos1; $0)
C_DATE:C307(Str_DatePos1; $1)

//Str_DatePos2
C_LONGINT:C283(Str_DatePos2; $0)
C_DATE:C307(Str_DatePos2; $1)

//Str_DatePos3
C_LONGINT:C283(Str_DatePos3; $0)
C_DATE:C307(Str_DatePos3; $1)

//Str_Divide
C_TEXT:C284(Str_Divide; $0)
C_TEXT:C284(Str_Divide; $1)
C_TEXT:C284(Str_Divide; $2)

//Str_FolderDiv
C_TEXT:C284(Str_FolderDiv; $0)
C_TEXT:C284(Str_FolderDiv; $1)

//Str_IMAChars
C_TEXT:C284(Str_IMAChars; $0)
C_TEXT:C284(Str_IMAChars; $1)

//Str_IMAChars2
C_TEXT:C284(Str_IMAChars2; $0)
C_TEXT:C284(Str_IMAChars2; $1)

//Str_In_List
C_BOOLEAN:C305(Str_In_List; $0)
C_TEXT:C284(Str_In_List; $1)
C_TEXT:C284(Str_In_List; $2)

//Str_Initials
C_TEXT:C284(Str_Initials; $0)
C_TEXT:C284(Str_Initials; $1)

//Str_IsAComp
C_BOOLEAN:C305(Str_IsAComp; $0)
C_TEXT:C284(Str_IsAComp; $1)

//Str_IsACountry
C_BOOLEAN:C305(Str_IsACountry; $0)
C_TEXT:C284(Str_IsACountry; $1)

//Str_IsARoad
C_BOOLEAN:C305(Str_IsARoad; $0)
C_TEXT:C284(Str_IsARoad; $1)

//Str_KeyChars
C_TEXT:C284(Str_KeyChars; $0)
C_TEXT:C284(Str_KeyChars; $1)

//Str_LeadSpaces
C_TEXT:C284(Str_LeadSpaces; $0)
C_TEXT:C284(Str_LeadSpaces; $1)
C_LONGINT:C283(Str_LeadSpaces; $2)

//Str_LeadZeros
C_TEXT:C284(STR_LeadZeros; $0)
C_TEXT:C284(STR_LeadZeros; $1)
C_LONGINT:C283(STR_LeadZeros; $2)

//Str_NumOnly
C_TEXT:C284(Str_NumOnly; $0)
C_TEXT:C284(Str_NumOnly; $1)

//Str_NumOnly2
C_TEXT:C284(Str_NumOnly2; $0)
C_TEXT:C284(Str_NumOnly2; $1)

//Str_NumSpOnly
C_TEXT:C284(Str_NumSpOnly; $0)
C_TEXT:C284(Str_NumSpOnly; $1)

//Str_NumSpOnly2
C_TEXT:C284(Str_NumSpOnly2; $0)
C_TEXT:C284(Str_NumSpOnly2; $1)

//Str_PosDivide
C_LONGINT:C283(Str_PosDivide; $0)
C_TEXT:C284(Str_PosDivide; $1)

//Str_RemQuote
C_TEXT:C284(STR_RemQuote; $0)
C_TEXT:C284(STR_RemQuote; $1)

//Str_SpaceDot
C_TEXT:C284(Str_SpaceDot; $0)
C_TEXT:C284(Str_SpaceDot; $1)

//Str_StripComm
C_TEXT:C284(Str_StripComm; $0)
C_TEXT:C284(Str_StripComm; $1)
C_POINTER:C301(Str_StripComm; $2)

//Str_StripDel
C_TEXT:C284(Str_StripDel; $0)
C_TEXT:C284(Str_StripDel; $1)

//Str_StripDocNam
C_TEXT:C284(Str_StripDocNam; $0)
C_TEXT:C284(Str_StripDocNam; $1)

//Str_StripNonAN
C_TEXT:C284(Str_StripNonAN; $0)
C_TEXT:C284(Str_StripNonAN; $1)

//Str_StripPath
C_TEXT:C284(Str_StripPath; $0)
C_TEXT:C284(Str_StripPath; $1)

//Str_StripSpace
C_TEXT:C284(Str_StripSpace; $0)
C_TEXT:C284(Str_StripSpace; $1)

//Str_StripSuffix
C_TEXT:C284(Str_StripSuffix; $0)
C_TEXT:C284(Str_StripSuffix; $1)

//Str_TelPrefStri
C_TEXT:C284(Str_TelPrefStri; $0)
C_TEXT:C284(Str_TelPrefStri; $1)

//Str_TelStrip
C_TEXT:C284(Str_TelStrip; $0)
C_TEXT:C284(Str_TelStrip; $1)

//Str_toBool
C_BOOLEAN:C305(Str_toBool; $0)
C_TEXT:C284(Str_toBool; $1)

//Str_TrailSpaces
C_TEXT:C284(Str_TrailSpaces; $0)
C_TEXT:C284(Str_TrailSpaces; $1)
C_LONGINT:C283(Str_TrailSpaces; $2)

//Str_ZeroAmt
C_TEXT:C284(Str_ZeroAmt; $0)
C_REAL:C285(Str_ZeroAmt; $1)
C_LONGINT:C283(Str_ZeroAmt; $2)

//String_Prefix
C_TEXT:C284(String_Prefix; $0)
C_TEXT:C284(String_Prefix; $1)

//String_Suffix
C_TEXT:C284(String_Suffix; $0)
C_TEXT:C284(String_Suffix; $1)

//STR_ADDPARAMSTOBLOCK
C_TEXT:C284(STR_AddParamsToBlock; ${2})
C_POINTER:C301(STR_AddParamsToBlock; $1)
C_TEXT:C284(STR_AddParamsToBlock; $2)
C_TEXT:C284(STR_AddParamsToBlock; $3)

//STR_COUNTSTR
C_LONGINT:C283(STR_CountStr; $0)
C_TEXT:C284(STR_CountStr; $1)
C_TEXT:C284(STR_CountStr; $2)

//STR_INQUOTES
C_TEXT:C284(STR_InQuotes; $0)
C_TEXT:C284(STR_InQuotes; $1)

//STR_LEADZEROS
C_TEXT:C284(STR_LeadZeros; $0)
C_TEXT:C284(STR_LeadZeros; $1)
C_LONGINT:C283(STR_LeadZeros; $2)

//STR_NUMERICBOOLEANTOSTRING
C_TEXT:C284(STR_NumericBooleanToString; $0)
C_LONGINT:C283(STR_NumericBooleanToString; $1)

//STR_PARAM
C_TEXT:C284(STR_Param; $0)
C_TEXT:C284(STR_Param; $1)
C_LONGINT:C283(STR_Param; $2)
C_TEXT:C284(STR_Param; $3)

//STR_PARAMBLOCK
C_TEXT:C284(STR_ParamBlock; $0)
C_TEXT:C284(STR_ParamBlock; ${1})
C_TEXT:C284(STR_ParamBlock; $1)
C_TEXT:C284(STR_ParamBlock; $2)
C_TEXT:C284(STR_ParamBlock; $3)
C_TEXT:C284(STR_ParamBlock; $4)
C_TEXT:C284(STR_ParamBlock; $5)
C_TEXT:C284(STR_ParamBlock; $6)
C_TEXT:C284(STR_ParamBlock; $7)
C_TEXT:C284(STR_ParamBlock; $8)

//STR_REMOVELEADTRAILSPACE
C_TEXT:C284(STR_RemoveLeadTrailSpace; $0)
C_TEXT:C284(STR_RemoveLeadTrailSpace; $1)

//STR_REMQUOTE
C_TEXT:C284(STR_RemQuote; $0)
C_TEXT:C284(STR_RemQuote; $1)

//STR_STRINGLITERAL
C_TEXT:C284(STR_StringLiteral; $0)
C_TEXT:C284(STR_StringLiteral; $1)

//STR_STRIPNONNUM
C_TEXT:C284(STR_StripNonNum; $0)
C_TEXT:C284(STR_StripNonNum; $1)

//STR_TEXT2ARRAY
C_TEXT:C284(STR_Text2Array; $1)
C_POINTER:C301(STR_Text2Array; $2)
C_TEXT:C284(STR_Text2Array; $3)

//ST_LOADFUNCTIONS
C_TEXT:C284(ST_LoadFunctions; $1)
C_POINTER:C301(ST_LoadFunctions; $2)

//ST_SAVECODEUSES
C_TEXT:C284(ST_SaveCodeUses; $1)

//ST_SAVESTATE
C_REAL:C285(ST_SaveState; $1)

//Subscript_SDate
C_DATE:C307(Subscript_SDate; $0)
C_DATE:C307(Subscript_SDate; $1)

//Subscript_SelP
C_POINTER:C301(Subscript_SelP; ${3})
C_LONGINT:C283(Subscript_SelP; $1)
C_POINTER:C301(Subscript_SelP; $2)

//Subscriptions_inLPX
C_POINTER:C301(Subscriptions_inLPX; $1)

//Substring_Word
C_TEXT:C284(Substring_Word; $0)
C_TEXT:C284(Substring_Word; $1)
C_LONGINT:C283(Substring_Word; $2)
C_LONGINT:C283(Substring_Word; $3)

//Sum_FieldArr
C_REAL:C285(Sum_FieldArr; $0)
C_POINTER:C301(Sum_FieldArr; $1)

//SuperDiary_InLPX
C_POINTER:C301(SuperDiary_InLPX; $1)
C_TEXT:C284(SuperDiary_InLPX; $2)

//SuperDiary_SaveChk
C_BOOLEAN:C305(SuperDiary_SaveChk; $1)

//SYS_GETCURRENTTIME
C_TEXT:C284(SYS_GetCurrentTime; $0)

//SYS_PARSEFILEPATH
C_TEXT:C284(SYS_ParseFilePath; $0)
C_TEXT:C284(SYS_ParseFilePath; $1)
C_TEXT:C284(SYS_ParseFilePath; $2)
C_TEXT:C284(SYS_ParseFilePath; $3)

//SYS_SEQUENCE
C_LONGINT:C283(SYS_Sequence; $0)

//SYS_SETWEBSERVER
C_TEXT:C284(SYS_SetWebServer; $1)

//Tel_ActiveErr
C_LONGINT:C283(Tel_ActiveErr; $0)
C_LONGINT:C283(Tel_ActiveErr; $1)

//Tel_Answer
C_LONGINT:C283(Tel_Answer; $1)

//Tel_Dial
C_TEXT:C284(Tel_Dial; $0)
C_TEXT:C284(Tel_Dial; $1)

//Tel_DialRes
C_TEXT:C284(Tel_DialRes; $0)
C_LONGINT:C283(Tel_DialRes; $1)

//Tel_DiaryCreat
C_TEXT:C284(Tel_DiaryCreat; $1)
C_TEXT:C284(Tel_DiaryCreat; $2)
C_TEXT:C284(Tel_DiaryCreat; $3)
C_TEXT:C284(Tel_DiaryCreat; $4)

//Tel_DTMFErr
C_LONGINT:C283(Tel_DTMFErr; $0)
C_LONGINT:C283(Tel_DTMFErr; $1)

//Tel_GetDTMF
C_TEXT:C284(Tel_GetDTMF; $0)
C_LONGINT:C283(Tel_GetDTMF; $1)
C_LONGINT:C283(Tel_GetDTMF; $2)
C_TEXT:C284(Tel_GetDTMF; $3)

//Tel_Overdial
C_BOOLEAN:C305(Tel_Overdial; $0)
C_TEXT:C284(Tel_Overdial; $1)

//Tel_PictCode11
C_TEXT:C284(Tel_PictCode11; $0)
C_TEXT:C284(Tel_PictCode11; $1)

//Tel_PictCreat
C_TEXT:C284(Tel_PictCreat; $0)
C_TEXT:C284(Tel_PictCreat; $1)

//Tel_PictFind
C_TEXT:C284(Tel_PictFind; $0)
C_TEXT:C284(Tel_PictFind; $1)

//Tel_Play
C_TEXT:C284(Tel_Play; $1)

//Tel_PlayAbort
C_TEXT:C284(Tel_PlayAbort; $1)
C_LONGINT:C283(Tel_PlayAbort; $2)

//Tel_PlayGetDTMF
C_TEXT:C284(Tel_PlayGetDTMF; $0)
C_TEXT:C284(Tel_PlayGetDTMF; $1)
C_LONGINT:C283(Tel_PlayGetDTMF; $2)
C_LONGINT:C283(Tel_PlayGetDTMF; $3)
C_LONGINT:C283(Tel_PlayGetDTMF; $4)

//Tel_Process
C_TEXT:C284(Tel_Process; $1)

//Tel_Record
C_TEXT:C284(Tel_Record; $0)
C_TEXT:C284(Tel_Record; $1)
C_LONGINT:C283(Tel_Record; $2)
C_LONGINT:C283(Tel_Record; $3)
C_BOOLEAN:C305(Tel_Record; $4)
C_BOOLEAN:C305(Tel_Record; $5)
C_TEXT:C284(Tel_Record; $6)
C_TEXT:C284(Tel_Record; $7)
C_TEXT:C284(Tel_Record; $8)
C_TEXT:C284(Tel_Record; $9)

//Tel_RecordDef
C_TEXT:C284(Tel_RecordDef; $0)
C_TEXT:C284(Tel_RecordDef; $1)
C_TEXT:C284(Tel_RecordDef; $2)
C_TEXT:C284(Tel_RecordDef; $3)
C_TEXT:C284(Tel_RecordDef; $4)
C_TEXT:C284(Tel_RecordDef; $5)

//Tel_Release
C_REAL:C285(Tel_Release; $1)

//Tel_ServerPres
C_BOOLEAN:C305(Tel_ServerPres; $0)

//Tel_SrvrDel
C_TEXT:C284(Tel_SrvrDel; $1)

//Tel_SrvrRecPrmt
C_TEXT:C284(Tel_SrvrRecPrmt; $0)
C_TEXT:C284(Tel_SrvrRecPrmt; $1)

//Tel_SrvrSend
C_TEXT:C284(Tel_SrvrSend; $1)

//Tel_Transfer
C_TEXT:C284(Tel_Transfer; $0)
C_TEXT:C284(Tel_Transfer; $1)

//Tel_WaitResourc
C_LONGINT:C283(Tel_WaitResourc; $0)
C_TEXT:C284(Tel_WaitResourc; $1)
C_LONGINT:C283(Tel_WaitResourc; $2)
C_LONGINT:C283(Tel_WaitResourc; $3)

//Tel_WaitSilence
C_LONGINT:C283(Tel_WaitSilence; $1)
C_LONGINT:C283(Tel_WaitSilence; $2)

//Tel_WaitSpeech
C_LONGINT:C283(Tel_WaitSpeech; $1)
C_LONGINT:C283(Tel_WaitSpeech; $2)

//Term_AllWT
C_TEXT:C284(Term_AllWT; $0)
C_TEXT:C284(Term_AllWT; $1)

//Term_FSWT
C_TEXT:C284(Term_FSWT; $0)
C_TEXT:C284(Term_FSWT; $1)

//Term_NLWT
C_TEXT:C284(Term_NLWT; $0)
C_TEXT:C284(Term_NLWT; $1)

//Term_OrdWT
C_TEXT:C284(Term_OrdWT; $0)
C_TEXT:C284(Term_OrdWT; $1)

//Term_PCWT
C_TEXT:C284(Term_PCWT; $0)
C_TEXT:C284(Term_PCWT; $1)

//Term_Platform
C_TEXT:C284(Term_Platform; $0)
C_TEXT:C284(Term_Platform; $1)

//Term_SLPLWT
C_TEXT:C284(Term_SLPLWT; $0)
C_TEXT:C284(Term_SLPLWT; $1)

//Term_StoWT
C_TEXT:C284(Term_StoWT; $0)
C_TEXT:C284(Term_StoWT; $1)

//Term_VATWT
C_TEXT:C284(Term_VATWT; $0)
C_TEXT:C284(Term_VATWT; $1)

//Text_Expand
C_POINTER:C301(Text_Expand; $1)
C_TEXT:C284(Text_Expand; $2)
C_BOOLEAN:C305(Text_Expand; $3)

//TICK_IMPORT_CREDIT
C_TEXT:C284(TICK_IMPORT_CREDIT; $1)

//TICK_IMPORT_CUSTOMERS
C_TEXT:C284(TICK_IMPORT_CUSTOMERS; $1)

//TICK_IMPORT_INVOICE
C_TEXT:C284(TICK_IMPORT_INVOICE; $1)

//TICK_IMPORT_SUPPLIERS
C_TEXT:C284(TICK_IMPORT_SUPPLIERS; $1)

//Time_Button
C_POINTER:C301(Time_Button; $1)
C_LONGINT:C283(Time_Button; $2)

//Time_ProdCatIn
C_TEXT:C284(Time_ProdCatIn; $1)

//Time_vButton
C_POINTER:C301(Time_vButton; $1)
C_LONGINT:C283(Time_vButton; $2)

//Trans_Check2
C_TEXT:C284(Trans_Check2; $1)

//Trans_Check3
C_POINTER:C301(Trans_Check3; $1)
C_POINTER:C301(Trans_Check3; $2)
C_TEXT:C284(Trans_Check3; $3)

//Trans_IOText
C_TEXT:C284(Trans_IOText; $0)
C_TEXT:C284(Trans_IOText; $1)

//Trans_Sel
C_REAL:C285(Trans_Sel; $1)
C_POINTER:C301(Trans_Sel; $2)
C_POINTER:C301(Trans_Sel; $3)

//Trans_SelLP
C_LONGINT:C283(Trans_SelLP; $0)
C_LONGINT:C283(Trans_SelLP; $1)

//Trans_SubLPCur
C_BOOLEAN:C305(Trans_SubLPCur; $0)
C_POINTER:C301(Trans_SubLPCur; $1)


//Trans_SubLPInv
C_BOOLEAN:C305(Trans_SubLPInv; $0)
C_POINTER:C301(Trans_SubLPInv; $1)
C_POINTER:C301(Trans_SubLPInv; $2)
C_POINTER:C301(Trans_SubLPInv; $3)

//Trans_SubLPIO
C_POINTER:C301(Trans_SubLPIO; $1)
C_POINTER:C301(Trans_SubLPIO; $2)
C_TEXT:C284(Trans_SubLPIO; $3)

//Trans_SubLPIOx
C_POINTER:C301(Trans_SubLPIOx; $1)

C_POINTER:C301(Trans_SubLPIOx; $2)
C_TEXT:C284(Trans_SubLPIOx; $3)

//Trans_SubLPJob
C_BOOLEAN:C305(Trans_SubLPJob; $0)
C_POINTER:C301(Trans_SubLPJob; $1)
C_POINTER:C301(Trans_SubLPJob; $2)

//Trans_SubLPLayer
C_BOOLEAN:C305(Trans_SubLPLayer; $0)
C_POINTER:C301(Trans_SubLPLayer; $1)
C_POINTER:C301(Trans_SubLPLayer; $2)
C_REAL:C285(Trans_SubLPLayer; $3)
C_POINTER:C301(Trans_SubLPLayer; $4)
C_TEXT:C284(Trans_SubLPLayer; $5)
C_POINTER:C301(Trans_SubLPLayer; $6)
C_POINTER:C301(Trans_SubLPLayer; $7)

//Trans_SubLPLayerCode
C_BOOLEAN:C305(Trans_SubLPLayerCode; $0)
C_POINTER:C301(Trans_SubLPLayerCode; $1)
C_POINTER:C301(Trans_SubLPLayerCode; $2)
C_LONGINT:C283(Trans_SubLPLayerCode; $3)
C_POINTER:C301(Trans_SubLPLayerCode; $4)

//Trans_SubLPPER
C_TEXT:C284(Trans_SubLPPer; $1)
C_POINTER:C301(Trans_SubLPPer; $2)
C_POINTER:C301(Trans_SubLPPer; $3)

//Trans_SubLPPur
C_BOOLEAN:C305(Trans_SubLPPur; $0)
C_POINTER:C301(Trans_SubLPPur; $1)
C_POINTER:C301(Trans_SubLPPur; $2)
C_POINTER:C301(Trans_SubLPPur; $3)

//Trans_SubLPPurI
C_BOOLEAN:C305(Trans_SubLPPurI; $0)
C_POINTER:C301(Trans_SubLPPurI; $1)
C_POINTER:C301(Trans_SubLPPurI; $2)
C_POINTER:C301(Trans_SubLPPurI; $3)

//Trans_SubLPVAT
C_TEXT:C284(Trans_SubLPVAT; $1)
C_TEXT:C284(Trans_SubLPVAT; $2)
C_TEXT:C284(Trans_SubLPVAT; $3)
C_TEXT:C284(Trans_SubLPVAT; $4)
C_POINTER:C301(Trans_SubLPVAT; $5)
C_POINTER:C301(Trans_SubLPVAT; $6)
C_POINTER:C301(Trans_SubLPVAT; $7)
C_TEXT:C284(Trans_SubLPVAT; $8)
C_TEXT:C284(Trans_SubLPVAT; $9)

//Transact_End
C_BOOLEAN:C305(Transact_End; $1)

//Transact_SttLck
C_BOOLEAN:C305(Transact_SttLck; $0)
C_POINTER:C301(Transact_SttLck; $1)
C_LONGINT:C283(Transact_SttLck; $2)

//TransB_InCalc
C_BOOLEAN:C305(TransB_InCalc; $1)

//TransB_InLPTot
C_BOOLEAN:C305(TransB_InLPTot; $1)

//TransB_Mod
C_TEXT:C284(TransB_Mod; $1)
C_TEXT:C284(TransB_Mod; $2)
C_TEXT:C284(TransB_Mod; $3)

//TransactionBatch_Post
C_LONGINT:C283(TransactionBatch_Post; $1)

//TransactionBatch_PostCh
C_LONGINT:C283(TransactionBatch_PostCh; $1)

//TransB_SelP
C_REAL:C285(TransB_SelP; $1)
C_POINTER:C301(TransB_SelP; $2)
C_POINTER:C301(TransB_SelP; $3)

//TransT_ChPrefs
C_BOOLEAN:C305(TransT_ChPrefs; $0)
C_TEXT:C284(TransT_ChPrefs; $1)
C_BOOLEAN:C305(TransT_ChPrefs; $2)

//TRANS_BUILDUNIQUETAX
C_TEXT:C284(TRANS_BuildUniqueTAX; $0)

//UNLOADALLRECORDS
C_POINTER:C301(UnloadAllRecords; $1)


//UPD_CHECKCOADDRESS
C_BOOLEAN:C305(UPD_CheckCoAddress; $1)
C_LONGINT:C283(UPD_CheckCoAddress; $2)
C_LONGINT:C283(UPD_CheckCoAddress; $3)

//UPD_CONTACTSOUNDEX
C_BOOLEAN:C305(UPD_ContactSoundex; $1)
C_LONGINT:C283(UPD_ContactSoundex; $2)
C_LONGINT:C283(UPD_ContactSoundex; $3)

//UPD_MOVEMENTTYPENUMBERS
C_BOOLEAN:C305(UPD_MovementTypeNumbers; $1)
C_LONGINT:C283(UPD_MovementTypeNumbers; $2)
C_LONGINT:C283(UPD_MovementTypeNumbers; $3)

//UPPERS1
C_TEXT:C284(Uppers1; $0)
C_TEXT:C284(Uppers1; $1)

//UPPERS2
C_TEXT:C284(Uppers2; $0)
C_TEXT:C284(Uppers2; $1)
C_LONGINT:C283(Uppers2; $2)

//UPPERS3
C_TEXT:C284(Uppers3; $0)
C_TEXT:C284(Uppers3; $1)
C_REAL:C285(Uppers3; $2)

//UPPERSBETBRACK
C_TEXT:C284(UppersBetBrack; $0)
C_TEXT:C284(UppersBetBrack; $1)

//UPPERSSURNAME
C_TEXT:C284(UppersSurname; $0)
C_TEXT:C284(UppersSurname; $1)

//User_Details
C_LONGINT:C283(User_Details; $1)

//User_DetFiles
C_LONGINT:C283(User_DetFiles; $1)

//User_FontsUp
C_BOOLEAN:C305(User_FontsUp; $1)

//User_InLPChkAcc
C_POINTER:C301(User_InLPChkAcc; $1)

//User_InLPChkTr
C_POINTER:C301(User_InLPChkTr; $1)

//User_Message
C_TEXT:C284(User_Message; $1)

//USER VERSIONUP
C_TEXT:C284(User_VersionUp; $1)
C_TEXT:C284(User_VersionUp; $2)

//USERDETAILSBLOB
C_LONGINT:C283(UserDetailsBLOB; $1)

//Userset_Empty
C_POINTER:C301(Userset_Empty; $1)

//UTI_ARRAYCLEAR
C_POINTER:C301(UTI_ArrayClear; ${-1})
C_POINTER:C301(UTI_ArrayClear; $1)
C_POINTER:C301(UTI_ArrayClear; $2)
C_POINTER:C301(UTI_ArrayClear; $3)

//UTI_ARRAYDELETEELEMENTS
C_POINTER:C301(UTI_ArrayDeleteElements; ${-1})
C_LONGINT:C283(UTI_ArrayDeleteElements; $1)
C_LONGINT:C283(UTI_ArrayDeleteElements; $2)
C_POINTER:C301(UTI_ArrayDeleteElements; $3)
C_POINTER:C301(UTI_ArrayDeleteElements; $4)
C_POINTER:C301(UTI_ArrayDeleteElements; $5)
C_POINTER:C301(UTI_ArrayDeleteElements; $6)

//UTI_ARRAYFINDORINSERT
C_LONGINT:C283(UTI_ArrayFindOrInsert; $0)
C_POINTER:C301(UTI_ArrayFindOrInsert; $1)
C_POINTER:C301(UTI_ArrayFindOrInsert; $2)

//UTI_ARRAYINSERTAT
C_LONGINT:C283(UTI_ArrayInsertAt; $0)
C_POINTER:C301(UTI_ArrayInsertAt; $1)
C_POINTER:C301(UTI_ArrayInsertAt; $2)
C_POINTER:C301(UTI_ArrayInsertAt; $3)

//UTI_ARRAYINSERTELEMENTS
C_POINTER:C301(UTI_ArrayInsertElements; ${-1})
C_LONGINT:C283(UTI_ArrayInsertElements; $1)
C_LONGINT:C283(UTI_ArrayInsertElements; $2)
C_POINTER:C301(UTI_ArrayInsertElements; $3)
C_POINTER:C301(UTI_ArrayInsertElements; $4)
C_POINTER:C301(UTI_ArrayInsertElements; $5)
C_POINTER:C301(UTI_ArrayInsertElements; $6)

//UTI_ARRAYRESIZE
C_POINTER:C301(UTI_ArrayResize; ${2})
C_LONGINT:C283(UTI_ArrayResize; $1)
C_POINTER:C301(UTI_ArrayResize; $2)
C_POINTER:C301(UTI_ArrayResize; $3)
C_POINTER:C301(UTI_ArrayResize; $4)

//UTI_ARRAYSEARCH
C_LONGINT:C283(UTI_ArraySearch; $0)
C_POINTER:C301(UTI_ArraySearch; $1)
C_POINTER:C301(UTI_ArraySearch; $2)
C_POINTER:C301(UTI_ArraySearch; $3)

//UTI_BLOBCLEAR
C_POINTER:C301(UTI_BlobClear; ${1})
C_POINTER:C301(UTI_BlobClear; $1)

//UTI_BUILDBMSKIPTABLE
C_BLOB:C604(UTI_BuildBMSkipTable; $0)
C_TEXT:C284(UTI_BuildBMSkipTable; $1)

//UTI_CLEARSEMAPHORE
C_TEXT:C284(UTI_ClearSemaphore; $1)

//UTI_DATETIMESTAMP
C_TEXT:C284(UTI_DateTimeStamp; $0)

//UTI_DATETIMETONUM
C_LONGINT:C283(UTI_DateTimeToNum; $0)
C_DATE:C307(UTI_DateTimeToNum; $1)
C_TIME:C306(UTI_DateTimeToNum; $2)

//UTI_FIELDPOINTERFROMSTRING
C_POINTER:C301(UTI_FieldPointerFromString; $0)
C_TEXT:C284(UTI_FieldPointerFromString; $1)

//UTI_FINDINBLOB
C_LONGINT:C283(UTI_FindInBlob; $0)
C_TEXT:C284(UTI_FindInBlob; $1)
C_POINTER:C301(UTI_FindInBlob; $2)
C_LONGINT:C283(UTI_FindInBlob; $3)
C_BLOB:C604(UTI_FindInBlob; $4)

//UTI_GETFOLDERNAME
C_TEXT:C284(UTI_GetFolderName; $0)
C_TEXT:C284(UTI_GetFolderName; $1)

//UTI_PROCESSNAME
C_TEXT:C284(UTI_ProcessName; $0)
C_LONGINT:C283(UTI_ProcessName; $1)

//UTI_PROCESSSTATE
C_TEXT:C284(UTI_ProcessState; $0)
C_LONGINT:C283(UTI_ProcessState; $1)

//UTI_REPLACEINBLOB
C_TEXT:C284(UTI_ReplaceInBlob; $1)
C_TEXT:C284(UTI_ReplaceInBlob; $2)
C_POINTER:C301(UTI_ReplaceInBlob; $3)

//UTI_SEMAPHORE
C_BOOLEAN:C305(UTI_Semaphore; $0)
C_TEXT:C284(UTI_Semaphore; $1)
C_LONGINT:C283(UTI_Semaphore; $2)

//UTI_TABLEPOINTERFROMSTRING
C_POINTER:C301(UTI_TablePointerFromString; $0)
C_TEXT:C284(UTI_TablePointerFromString; $1)

//UTI_WINBOTTOMLEFT
C_LONGINT:C283(UTI_WinBottomLeft; $1)
C_LONGINT:C283(UTI_WinBottomLeft; $2)
C_LONGINT:C283(UTI_WinBottomLeft; $3)
C_TEXT:C284(UTI_WinBottomLeft; $4)
C_TEXT:C284(UTI_WinBottomLeft; $5)

//UTI_WINBOTTOMLEFTXY
C_LONGINT:C283(UTI_WinBottomLeftXY; $1)
C_LONGINT:C283(UTI_WinBottomLeftXY; $2)
C_LONGINT:C283(UTI_WinBottomLeftXY; $3)
C_LONGINT:C283(UTI_WinBottomLeftXY; $4)
C_LONGINT:C283(UTI_WinBottomLeftXY; $5)
C_TEXT:C284(UTI_WinBottomLeftXY; $6)
C_TEXT:C284(UTI_WinBottomLeftXY; $7)

//UTI_WINCENTER
C_LONGINT:C283(UTI_WinCenter; $1)
C_LONGINT:C283(UTI_WinCenter; $2)
C_LONGINT:C283(UTI_WinCenter; $3)
C_TEXT:C284(UTI_WinCenter; $4)
C_TEXT:C284(UTI_WinCenter; $5)

//VARTONAME
C_TEXT:C284(VarToName; $0)
C_POINTER:C301(VarToName; $1)

//VER_4DServer
C_BOOLEAN:C305(VER_4DServer; $0)

//VER_CENTER WINDOW
C_LONGINT:C283(VER_CENTERWINDOW; $1)
C_LONGINT:C283(VER_CENTERWINDOW; $2)
C_LONGINT:C283(VER_CENTERWINDOW; $3)
C_TEXT:C284(VER_CENTERWINDOW; $4)
C_TEXT:C284(VER_CENTERWINDOW; $5)
C_LONGINT:C283(VER_CENTERWINDOW; $6)

//VER_DB Developer
C_BOOLEAN:C305(VER_DBDeveloper; $0)

//VER_DefaultLicenceVersion
C_TEXT:C284(VER_DefaultLicenceVersion; $0)

//VER_GetLicenceVersion
C_TEXT:C284(VER_GetLicenceVersion; $0)

//VER_GET VERSION
C_TEXT:C284(VER_GetVersion; $0)
C_LONGINT:C283(VER_GetVersion; $1)

//VER_GET VERSIONBITS
C_LONGINT:C283(Ver_GetVersionBits; $1)
C_POINTER:C301(Ver_GetVersionBits; $2)
C_POINTER:C301(Ver_GetVersionBits; $3)
C_POINTER:C301(Ver_GetVersionBits; $4)
C_POINTER:C301(Ver_GetVersionBits; $5)
C_POINTER:C301(Ver_GetVersionBits; $6)
C_POINTER:C301(Ver_GetVersionBits; $7)

//VER_GETBUILDNUMBER
C_LONGINT:C283(VER_GetBuildNumber; $0)

//VER_MACINTOSH
//C_BOOLEAN(VER_Macintosh;$0)

//VER_SETVERSION
C_TEXT:C284(VER_SETVERSION; $0)
C_TEXT:C284(VER_SETVERSION; $1)
C_TEXT:C284(VER_SETVERSION; $2)
C_TEXT:C284(VER_SETVERSION; $3)
C_TEXT:C284(VER_SETVERSION; $4)
C_LONGINT:C283(VER_SETVERSION; $5)
C_TEXT:C284(VER_SETVERSION; $6)
C_LONGINT:C283(VER_SETVERSION; $7)
C_LONGINT:C283(VER_SETVERSION; $8)
C_LONGINT:C283(VER_SETVERSION; $9)
C_TEXT:C284(VER_SETVERSION; $10)
C_TEXT:C284(VER_SETVERSION; $11)

//VER_STRING
C_TEXT:C284(VER_String; $0)
C_TEXT:C284(VER_String; $1)
C_TEXT:C284(VER_String; $2)
C_TEXT:C284(VER_String; $3)
C_TEXT:C284(VER_String; $4)
C_LONGINT:C283(VER_String; $5)

//VER_UPDATEVERSION
C_TEXT:C284(VER_UPDATEVERSION; $1)
C_TEXT:C284(VER_UPDATEVERSION; $2)
C_TEXT:C284(VER_UPDATEVERSION; $3)
C_TEXT:C284(VER_UPDATEVERSION; $4)
C_LONGINT:C283(VER_UPDATEVERSION; $5)
C_TEXT:C284(VER_UPDATEVERSION; $6)
C_LONGINT:C283(VER_UPDATEVERSION; $7)
C_LONGINT:C283(VER_UPDATEVERSION; $8)
C_LONGINT:C283(VER_UPDATEVERSION; $9)
C_TEXT:C284(VER_UPDATEVERSION; $10)
C_TEXT:C284(VER_UPDATEVERSION; $11)

//VER_UPDATEROUTINES
C_BOOLEAN:C305(VER_UpdateRoutines; $1)

//VER_UPDATEROUTINEVALIDATION
C_LONGINT:C283(VER_UpdateRoutineValidation; $1)
C_LONGINT:C283(VER_UpdateRoutineValidation; $2)

//VT2ARRAY
C_POINTER:C301(vT2array; $1)
C_TEXT:C284(vT2array; $2)
C_LONGINT:C283(vT2array; $3)

//Week_No
C_LONGINT:C283(Week_No; $0)
C_DATE:C307(Week_No; $1)

//WIN_SETFORMSIZE
C_LONGINT:C283(WIn_SetFormSize; $1)
C_POINTER:C301(WIn_SetFormSize; $2)
C_TEXT:C284(WIn_SetFormSize; $3)

//WS_AC_MAN


//WS_ADDDIARYITEMOWNER

//WS_AUTOSCREENSIZE
C_LONGINT:C283(WS_AutoscreenSize; $1)
C_LONGINT:C283(WS_AutoscreenSize; $2)
C_LONGINT:C283(WS_AutoscreenSize; $3)
C_TEXT:C284(WS_AutoscreenSize; $4)

//WS_BUILDADDRESS
C_TEXT:C284(WS_BUILDADDRESS; $0)
C_TEXT:C284(WS_BUILDADDRESS; $1)
C_TEXT:C284(WS_BUILDADDRESS; $2)
C_TEXT:C284(WS_BUILDADDRESS; $3)
C_TEXT:C284(WS_BUILDADDRESS; $4)
C_TEXT:C284(WS_BUILDADDRESS; $5)
C_TEXT:C284(WS_BUILDADDRESS; $6)

//WS_CUSTOMLABELS
C_POINTER:C301(WS_CustomLabels; $1)

//WS_CUSTOMLABELSHARE
C_TEXT:C284(WS_CustomLabelShare; $1)
C_LONGINT:C283(WS_CustomLabelShare; $2)

//WS_EUROCONVERTOR
C_REAL:C285(WS_EuroConvertor; $0)
C_REAL:C285(WS_EuroConvertor; $1)
C_TEXT:C284(WS_EuroConvertor; $2)

//WS_LINKDIARYITEM
C_BOOLEAN:C305(WS_LINKDIARYITEM; $0)
C_TEXT:C284(WS_LINKDIARYITEM; $1)
C_TEXT:C284(WS_LINKDIARYITEM; $2)

//WS_LINKEDCURRENCYCONVERSION
C_REAL:C285(WS_LinkedCurrencyConversion; $0)
C_REAL:C285(WS_LinkedCurrencyConversion; $1)
C_TEXT:C284(WS_LinkedCurrencyConversion; $2)
C_TEXT:C284(WS_LinkedCurrencyConversion; $3)
C_TEXT:C284(WS_LinkedCurrencyConversion; $4)


//WS_SETEASTER
C_DATE:C307(WS_SetEaster; $0)
C_LONGINT:C283(WS_SetEaster; $1)

//WS_SETPALLETTEBUTTONS
C_REAL:C285(WS_SETPALLETTEBUTTONS; ${-1})
C_BOOLEAN:C305(WS_SETPALLETTEBUTTONS; $1)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $2)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $3)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $4)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $5)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $6)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $7)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $8)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $9)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $10)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $11)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $12)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $13)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $14)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $15)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $16)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $17)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $18)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $19)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $20)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $21)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $22)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $23)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $24)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $25)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $26)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $27)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $28)
C_REAL:C285(WS_SETPALLETTEBUTTONS; $29)

//WS_UKBANKHOLS
C_DATE:C307(WS_UKBankHols; $1)

//WT_SORT_TABLE_2
C_POINTER:C301(WT_SORT_TABLE_2; $1)
C_POINTER:C301(WT_SORT_TABLE_2; $2)
C_POINTER:C301(WT_SORT_TABLE_2; $3)
C_BOOLEAN:C305(WT_SORT_TABLE_2; $4)
C_LONGINT:C283(WT_SORT_TABLE_2; $5)

//WT_SORT_TABLE_3
C_POINTER:C301(WT_SORT_TABLE_3; $1)
C_TEXT:C284(WT_SORT_TABLE_3; $2)
C_POINTER:C301(WT_SORT_TABLE_3; $3)

//Year_Close2
C_DATE:C307(Year_Close2; $1)

//ZDiary_InEmail
C_TEXT:C284(zDiary_inEmail; $1)
C_TEXT:C284(zDiary_inEmail; $2)
C_TEXT:C284(zDiary_inEmail; $3)

//ZPROC
C_TEXT:C284(ZProc; $1)
C_LONGINT:C283(ZProc; $2)
C_TEXT:C284(ZProc; $3)
C_TEXT:C284(ZProc; $4)
C_TEXT:C284(ZProc; $5)
C_TEXT:C284(ZProc; $6)
C_TEXT:C284(ZProc; $7)
C_TEXT:C284(ZProc; $8)
C_TEXT:C284(ZProc; $9)

//ZSALESPIPELINE
C_TEXT:C284(ZSalesPipeline; $1)
C_LONGINT:C283(ZSalesPipeline; $2)
C_LONGINT:C283(ZSalesPipeline; $3)
C_LONGINT:C283(ZSalesPipeline; $4)
C_TEXT:C284(ZSalesPipeline; $5)
C_DATE:C307(ZSalesPipeline; $6)
C_DATE:C307(ZSalesPipeline; $7)
C_LONGINT:C283(ZSalesPipeline; $8)
C_LONGINT:C283(ZSalesPipeline; $9)

//ZScrnSav_Proc
C_LONGINT:C283(ZScrnSav_Proc; $0)


//SDIARY_HL_QUERYDIARYONSERVER
C_LONGINT:C283(SDiary_HL_QueryDiaryONSERVER; $1)
C_DATE:C307(SDiary_HL_QueryDiaryONSERVER; $2)
C_DATE:C307(SDiary_HL_QueryDiaryONSERVER; $3)
C_LONGINT:C283(SDiary_HL_QueryDiaryONSERVER; $4)
C_BOOLEAN:C305(SDiary_HL_QueryDiaryONSERVER; $5)
C_LONGINT:C283(SDiary_HL_QueryDiaryONSERVER; $6)
C_LONGINT:C283(SDiary_HL_QueryDiaryONSERVER; $7)
C_TEXT:C284(SDiary_HL_QueryDiaryONSERVER; $8)
C_LONGINT:C283(SDiary_HL_QueryDiaryONSERVER; $9)

//SD_DIARYTRIGGERPUTINQUEUE
C_LONGINT:C283(SD_DiaryTriggerPutInQueue; $1)

//SD_GETSETFROMSERVER
C_REAL:C285(SD_GetSetFromServer; $1)
C_POINTER:C301(SD_GetSetFromServer; $2)
C_POINTER:C301(SD_GetSetFromServer; $3)
C_POINTER:C301(SD_GetSetFromServer; $4)
C_POINTER:C301(SD_GetSetFromServer; $5)
C_POINTER:C301(SD_GetSetFromServer; $6)
C_POINTER:C301(SD_GetSetFromServer; $7)
C_POINTER:C301(SD_GetSetFromServer; $8)
C_REAL:C285(SD_GetSetFromServer; $9)
C_TEXT:C284(SD_GetSetFromServer; $10)

//INV_CHECKMULTIALLOCATIONS
C_TEXT:C284(INV_CheckMultiAllocations; $1)
C_TEXT:C284(INV_CheckMultiAllocations; $2)
C_TEXT:C284(INV_CheckMultiAllocations; $3)
C_TEXT:C284(INV_CheckMultiAllocations; $4)
C_REAL:C285(INV_CheckMultiAllocations; $5)

//INV_ALLOCATIONFIND
C_TEXT:C284(INV_AllocationFind; $1)
C_TEXT:C284(INV_AllocationFind; $2)
C_DATE:C307(INV_AllocationFind; $3)
C_REAL:C285(INV_AllocationFind; $4)
C_TEXT:C284(INV_AllocationFind; $5)

//SI_CREDITALLOCATIONFIX
C_TEXT:C284(SI_CreditAllocationFix; $1)

//INV_FINDDEPOSIT
C_LONGINT:C283(INV_FindDeposit; $1)
C_LONGINT:C283(INV_FindDeposit; $2)

//CCM_ADDRECORD
C_BOOLEAN:C305(CCM_AddRecord; $0)
C_LONGINT:C283(CCM_AddRecord; $1)
C_LONGINT:C283(CCM_AddRecord; $2)
C_TEXT:C284(CCM_AddRecord; $3)
C_LONGINT:C283(CCM_AddRecord; $4)

//CCM_BATCHADDCCCHARGING
C_REAL:C285(CCM_BatchAddCCCharging; $1)

//CCM_BUILDCARDNUMBER
C_TEXT:C284(CCM_BuildCardNumber; $0)
C_TEXT:C284(CCM_BuildCardNumber; $1)

//CCM_CARDSELECTION
C_LONGINT:C283(CCM_CardSelection; $0)
C_LONGINT:C283(CCM_CardSelection; $1)
C_LONGINT:C283(CCM_CardSelection; $2)
C_TEXT:C284(CCM_CardSelection; $3)

//CCM_CHECKSUM
C_BOOLEAN:C305(CCM_CheckSum; $0)
C_TEXT:C284(CCM_CheckSum; $1)

//CCM_CREATEPAYMENT
C_REAL:C285(CCM_CreatePayment; $0)
C_TEXT:C284(CCM_CreatePayment; $1)
C_TEXT:C284(CCM_CreatePayment; $2)
C_LONGINT:C283(CCM_CreatePayment; $3)
C_REAL:C285(CCM_CreatePayment; $4)

//CCM_DECRYPTCARDNAME
C_TEXT:C284(CCM_DecryptCardName; $0)

//CCM_ENCRYPTCARDNAME
C_TEXT:C284(CCM_EncryptCardName; $1)

//CCM_ENCRYPTCARDNUMBER
C_TEXT:C284(CCM_EncryptCardNumber; $1)

//CCM_GETTRANSTYPE
C_TEXT:C284(CCM_GettransType; $0)

//CCM_LOADORDERAUTHS
C_REAL:C285(CCM_LoadOrderAuths; $1)

//CCM_LOADRELATEDCARDS
C_POINTER:C301(CCM_LoadRelatedCards; ${3})
C_LONGINT:C283(CCM_LoadRelatedCards; $1)
C_LONGINT:C283(CCM_LoadRelatedCards; $2)
C_POINTER:C301(CCM_LoadRelatedCards; $3)
C_POINTER:C301(CCM_LoadRelatedCards; $4)
C_POINTER:C301(CCM_LoadRelatedCards; $5)
C_POINTER:C301(CCM_LoadRelatedCards; $6)
C_POINTER:C301(CCM_LoadRelatedCards; $7)
C_POINTER:C301(CCM_LoadRelatedCards; $8)
C_POINTER:C301(CCM_LoadRelatedCards; $9)
C_POINTER:C301(CCM_LoadRelatedCards; $10)
C_POINTER:C301(CCM_LoadRelatedCards; $11)
C_POINTER:C301(CCM_LoadRelatedCards; $12)
C_POINTER:C301(CCM_LoadRelatedCards; $13)
C_POINTER:C301(CCM_LoadRelatedCards; $14)

//CCM_ORDERAUTHORIZE
C_TEXT:C284(CCM_OrderAuthorize; $1)
C_LONGINT:C283(CCM_OrderAuthorize; $2)
C_TEXT:C284(CCM_OrderAuthorize; $3)
C_TEXT:C284(CCM_OrderAuthorize; $4)
C_REAL:C285(CCM_OrderAuthorize; $5)
C_TEXT:C284(CCM_OrderAuthorize; $6)

C_LONGINT:C283(CCM_OrderAuthorize; $7)

//CCM_PROCESSCARD
C_LONGINT:C283(CCM_ProcessCard; $0)
C_TEXT:C284(CCM_ProcessCard; $1)

C_REAL:C285(CCM_ProcessCard; $2)
C_LONGINT:C283(CCM_ProcessCard; $3)
C_LONGINT:C283(CCM_ProcessCard; $4)
C_LONGINT:C283(CCM_ProcessCard; $5)

//ORD_INVCCPAYMENT
C_LONGINT:C283(ORD_InvCCPayment; $1)
C_TEXT:C284(ORD_InvCCPayment; $2)
C_TEXT:C284(ORD_InvCCPayment; $3)


//ACC_PERIODMOD
C_TEXT:C284(ACC_PeriodMod; $1)
C_REAL:C285(ACC_PeriodMod; $2)

//ORD_INVDEPOSITPAYMENT
C_LONGINT:C283(ORD_invDepositPayment; $1)
C_TEXT:C284(ORD_invDepositPayment; $2)
C_REAL:C285(ORD_invDepositPayment; $3)
C_REAL:C285(ORD_invDepositPayment; $4)

//CCM_GETCCTRANSTYPE
C_TEXT:C284(CCM_GetCCTransType; $0)
C_REAL:C285(CCM_GetCCTransType; $1)


C_BOOLEAN:C305(CCM_LoadServiceProviders; $1)

//CCM_EDITPROVIDERS
C_BOOLEAN:C305(CCM_EditProviders; $1)

//CCMGETAUTH
C_LONGINT:C283(CCMGetAuth; $0)
C_REAL:C285(CCMGetAuth; $1)
C_TEXT:C284(CCMGetAuth; $2)
C_LONGINT:C283(CCMGetAuth; $3)
C_LONGINT:C283(CCMGetAuth; $4)
//ETRANS_SEC_CREATE_DIRECT

//SM_LOADSEARCHPARAMETERNAMES
C_LONGINT:C283(SM_LoadSearchParameterNames; $1)
C_LONGINT:C283(SM_LoadSearchParameterNames; $2)
C_LONGINT:C283(SM_LoadSearchParameterNames; $3)

//SM_SEARCHVARSTOBLOB
C_POINTER:C301(SM_SearchVarsToBlob; ${2})
C_POINTER:C301(SM_SearchVarsToBlob; $1)
C_POINTER:C301(SM_SearchVarsToBlob; $2)
C_POINTER:C301(SM_SearchVarsToBlob; $3)
C_POINTER:C301(SM_SearchVarsToBlob; $4)
C_POINTER:C301(SM_SearchVarsToBlob; $5)
C_POINTER:C301(SM_SearchVarsToBlob; $6)
C_POINTER:C301(SM_SearchVarsToBlob; $7)
C_POINTER:C301(SM_SearchVarsToBlob; $8)
C_POINTER:C301(SM_SearchVarsToBlob; $9)
C_POINTER:C301(SM_SearchVarsToBlob; $10)
C_POINTER:C301(SM_SearchVarsToBlob; $11)
C_POINTER:C301(SM_SearchVarsToBlob; $12)
C_POINTER:C301(SM_SearchVarsToBlob; $13)
C_POINTER:C301(SM_SearchVarsToBlob; $14)
C_POINTER:C301(SM_SearchVarsToBlob; $15)
C_POINTER:C301(SM_SearchVarsToBlob; $16)
C_POINTER:C301(SM_SearchVarsToBlob; $17)
C_POINTER:C301(SM_SearchVarsToBlob; $18)
C_POINTER:C301(SM_SearchVarsToBlob; $19)
C_POINTER:C301(SM_SearchVarsToBlob; $20)
C_POINTER:C301(SM_SearchVarsToBlob; $21)
C_POINTER:C301(SM_SearchVarsToBlob; $22)
C_POINTER:C301(SM_SearchVarsToBlob; $23)
C_POINTER:C301(SM_SearchVarsToBlob; $24)
C_POINTER:C301(SM_SearchVarsToBlob; $25)
C_POINTER:C301(SM_SearchVarsToBlob; $26)
C_POINTER:C301(SM_SearchVarsToBlob; $27)
C_POINTER:C301(SM_SearchVarsToBlob; $28)
C_POINTER:C301(SM_SearchVarsToBlob; $29)
C_POINTER:C301(SM_SearchVarsToBlob; $30)
C_POINTER:C301(SM_SearchVarsToBlob; $31)



//SM_SAVESEARCHPARAMETERS
C_LONGINT:C283(SM_SaveSearchParameters; $0)
C_LONGINT:C283(SM_SaveSearchParameters; $1)
C_TEXT:C284(SM_SaveSearchParameters; $2)
C_LONGINT:C283(SM_SaveSearchParameters; $3)
C_LONGINT:C283(SM_SaveSearchParameters; $4)
C_POINTER:C301(SM_SaveSearchParameters; $5)

//SM_LOADSEARCHPARAMETERS
C_LONGINT:C283(SM_LoadSearchParameters; $0)
C_LONGINT:C283(SM_LoadSearchParameters; $1)
C_BOOLEAN:C305(SM_LoadSearchParameters; $2)

//SM_SETUSERSEARCHPREFS
C_REAL:C285(Sm_SetUserSearchPrefs; $0)
C_BOOLEAN:C305(Sm_SetUserSearchPrefs; $1)
C_REAL:C285(Sm_SetUserSearchPrefs; $2)
C_REAL:C285(Sm_SetUserSearchPrefs; $3)
C_REAL:C285(Sm_SetUserSearchPrefs; $4)

//SM_CROSSFILESEARCH
C_LONGINT:C283(SM_CrossFileSearch; $1)
C_LONGINT:C283(SM_CrossFileSearch; $2)
C_POINTER:C301(SM_CrossFileSearch; $3)
C_POINTER:C301(SM_CrossFileSearch; $4)
C_POINTER:C301(SM_CrossFileSearch; $5)

//SM_l_AUTOSEARCHBYID
C_LONGINT:C283(SM_L_AutoSearchbyID; $1)
C_POINTER:C301(SM_L_AutoSearchbyID; $2)
C_POINTER:C301(SM_L_AutoSearchbyID; $3)
C_LONGINT:C283(SM_L_AutoSearchbyID; $4)

//SM_CREATEAUTOSEARCH
C_LONGINT:C283(SM_CreateAutoSearch; $1)

//Gen_Set_enterable
C_POINTER:C301(Gen_Set_enterable; ${2})
C_BOOLEAN:C305(Gen_Set_enterable; $1)
C_POINTER:C301(Gen_Set_enterable; $2)
C_POINTER:C301(Gen_Set_enterable; $3)
C_POINTER:C301(Gen_Set_enterable; $4)
C_POINTER:C301(Gen_Set_enterable; $5)
C_POINTER:C301(Gen_Set_enterable; $6)
C_POINTER:C301(Gen_Set_enterable; $7)
C_POINTER:C301(Gen_Set_enterable; $8)
C_POINTER:C301(Gen_Set_enterable; $9)
C_POINTER:C301(Gen_Set_enterable; $10)
C_POINTER:C301(Gen_Set_enterable; $11)
C_POINTER:C301(Gen_Set_enterable; $12)
C_POINTER:C301(Gen_Set_enterable; $13)
C_POINTER:C301(Gen_Set_enterable; $14)
C_POINTER:C301(Gen_Set_enterable; $15)
C_POINTER:C301(Gen_Set_enterable; $16)
C_POINTER:C301(Gen_Set_enterable; $17)
C_POINTER:C301(Gen_Set_enterable; $18)
C_POINTER:C301(Gen_Set_enterable; $19)
C_POINTER:C301(Gen_Set_enterable; $20)
C_POINTER:C301(Gen_Set_enterable; $21)
C_POINTER:C301(Gen_Set_enterable; $22)
C_POINTER:C301(Gen_Set_enterable; $23)

//SM_AUTOSEARCHBYID
C_LONGINT:C283(SM_AutoSearchByID; ${1})

//Acc_BalBSHdg
C_REAL:C285(Acc_BalBSHdg; $0)

//Acc_BalPLHdg
C_REAL:C285(Acc_BalPLHdg; $0)

//Acc_BalPLHdg12
C_REAL:C285(Acc_BalPLHdg12; $0)

//Acc_BalRepHdg
C_LONGINT:C283(Acc_BalRepHdg; $0)

//ACC_TrialBalancePrintHeading
C_REAL:C285(ACC_TrialBalancePrintHeading; $0)

//ACC_BATCHITEMENTRY
C_BOOLEAN:C305(ACC_BatchItemEntry; $13)

//ACC_CONVERTFORPROFIT
C_DATE:C307(ACC_ConvertForProfit; $11)

//ACC_TRANSVALIDATEBATCH
C_BOOLEAN:C305(ACC_TransValidateBatch; $6)


//Check_Company2
C_LONGINT:C283(Check_Company2; $1)
C_LONGINT:C283(Check_Company2; $2)

//Check_Prod2
C_LONGINT:C283(Check_Prod2; $1)
C_LONGINT:C283(Check_Prod2; $2)

//Comp_RenumApp
C_LONGINT:C283(Comp_RenumApp; $3)
C_LONGINT:C283(Comp_RenumApp; $4)

//Companies_vAT2
C_POINTER:C301(Companies_vAT2; $1)

//Company_No
C_TEXT:C284(Company_No; $1)
C_POINTER:C301(Company_No; $2)



//ContComp_SubLP
C_POINTER:C301(ContComp_SubLP; $1)


//Execute_Sel
C_TEXT:C284(Execute_Sel; $2)

//Gen_Export3
C_TEXT:C284(Gen_Export3; $4)
C_LONGINT:C283(Gen_Export3; $5)

//Gen_Import3
C_TEXT:C284(Gen_Import3; $4)
C_LONGINT:C283(Gen_Import3; $5)

//Gen_ModMid
C_TEXT:C284(Gen_ModMid; $8)

//Gen_PayDate
C_TEXT:C284(Gen_PayDate; $5)
C_TEXT:C284(Gen_PayDate; $6)
C_POINTER:C301(Gen_PayDate; $7)
C_REAL:C285(Gen_PayDate; $8)
C_POINTER:C301(Gen_PayDate; $9)
C_POINTER:C301(Gen_PayDate; $10)

//INTERNETCONNECTIONSTATUSCHECK
C_POINTER:C301(InternetConnectionStatusCheck; $1)

//Inv_Accept
C_BOOLEAN:C305(Inv_Accept; $1)

//Inv_PaySel2
C_TEXT:C284(Inv_PaySel2; $4)
C_BOOLEAN:C305(Inv_PaySel2; $5)

//Invoices_InP
C_LONGINT:C283(Invoices_InP; $4)
C_TEXT:C284(Invoices_InP; $5)
C_TEXT:C284(Invoices_InP; $6)
C_TEXT:C284(Invoices_InP; $7)

//Invoices_Pay2
C_BOOLEAN:C305(Invoices_Pay2; $4)
C_BOOLEAN:C305(Invoices_Pay2; $5)

//Invoices_PaySel
C_BOOLEAN:C305(Invoices_PaySel; $4)

//Invoices_PPrint
C_BOOLEAN:C305(Invoices_PPrint; $1)
C_BOOLEAN:C305(Invoices_PPrint; $2)

//INV_ALLOCATIONCREATE
C_TEXT:C284(INV_AllocationCreate; $6)

//INV_CHECKREMAINDER
C_BOOLEAN:C305(INV_CheckRemainder; $2)

//INV_GETALLOCATIONS
C_LONGINT:C283(INV_GetAllocations; $2)

//JobPers_File
C_BOOLEAN:C305(JobPers_File; $0)

//JobStages_File
C_BOOLEAN:C305(JobStages_File; $0)

//Letters_SWMerAL
C_TEXT:C284(Letters_SWMerAL; $2)
C_TEXT:C284(Letters_SWMerAL; $3)

//Minor_Mod
C_TEXT:C284(Minor_Mod; $4)



//Movements_SelLP
C_LONGINT:C283(Movements_SelLP; $2)
C_LONGINT:C283(Movements_SelLP; $3)
C_POINTER:C301(Movements_SelLP; $4)
C_POINTER:C301(Movements_SelLP; $5)

//OrderI_SelLP
C_LONGINT:C283(OrderI_SelLP; $2)
C_LONGINT:C283(OrderI_SelLP; $3)
C_POINTER:C301(OrderI_SelLP; $4)
C_POINTER:C301(OrderI_SelLP; $5)

//OrderI_SubLPB
C_LONGINT:C283(OrderI_SubLPB; $1)

//Orders_InCan
C_TEXT:C284(Orders_InCan; $1)

//Orders_InLPTot
C_BOOLEAN:C305(Orders_InLPTot; $1)

//Orders_SelLP
C_LONGINT:C283(Orders_SelLP; $2)
C_LONGINT:C283(Orders_SelLP; $3)
C_POINTER:C301(Orders_SelLP; $4)
C_POINTER:C301(Orders_SelLP; $5)

//Personnel_SelLP
C_LONGINT:C283(Personnel_SelLP; $1)
C_LONGINT:C283(Personnel_SelLP; $2)
C_LONGINT:C283(Personnel_SelLP; $3)
C_POINTER:C301(Personnel_SelLP; $4)
C_POINTER:C301(Personnel_SelLP; $5)

//PriceT_File
C_BOOLEAN:C305(PriceT_File; $0)

//PRINT_SETSIZE
C_BOOLEAN:C305(PRINT_SetSIZE; $4)

//PROCESSSERVICE_DELETEDUPLICATES
C_LONGINT:C283(ProcessService_DeleteDuplicates; $0)

//Prod_SelLP
C_LONGINT:C283(Prod_SelLP; $2)
C_LONGINT:C283(Prod_SelLP; $3)
C_POINTER:C301(Prod_SelLP; $4)
C_POINTER:C301(Prod_SelLP; $5)

//Products_Mod
C_TEXT:C284(Products_Mod; $1)

//Projects_SelLP
C_REAL:C285(Projects_SelLP; $2)
C_REAL:C285(Projects_SelLP; $3)
C_POINTER:C301(Projects_SelLP; $4)
C_POINTER:C301(Projects_SelLP; $5)

//Purchases_SelLP
C_LONGINT:C283(Purchases_SelLP; $2)
C_LONGINT:C283(Purchases_SelLP; $3)
C_POINTER:C301(Purchases_SelLP; $4)
C_POINTER:C301(Purchases_SelLP; $5)

//PurchOrd_File
C_BOOLEAN:C305(PurchOrd_File; $0)

//PurchOrd_SelLP
C_LONGINT:C283(PurchOrd_SelLP; $2)
C_LONGINT:C283(PurchOrd_SelLP; $3)
C_POINTER:C301(PurchOrd_SelLP; $4)
C_POINTER:C301(PurchOrd_SelLP; $5)

//QuickAdd_Start
C_REAL:C285(QuickAdd_Start; $1)
C_REAL:C285(QuickAdd_Start; $2)
C_REAL:C285(QuickAdd_Start; $3)
C_REAL:C285(QuickAdd_Start; $4)

//Sources_File
C_BOOLEAN:C305(Sources_File; $0)

//Startup_GLOB
C_BOOLEAN:C305(Startup_GLOB; $0)

//Startup_PLOB
C_BOOLEAN:C305(Startup_PLOB; $0)

//Startup_SLOB
C_BOOLEAN:C305(Startup_SLOB; $0)

//Stock_SelLP
C_LONGINT:C283(Stock_SelLP; $2)
C_LONGINT:C283(Stock_SelLP; $3)
C_POINTER:C301(Stock_SelLP; $4)
C_POINTER:C301(Stock_SelLP; $5)

//StockCurr_File
C_BOOLEAN:C305(StockCurr_File; $0)

//StockCurr_SelLP
C_LONGINT:C283(StockCurr_SelLP; $2)
C_LONGINT:C283(StockCurr_SelLP; $3)
C_POINTER:C301(StockCurr_SelLP; $4)
C_POINTER:C301(StockCurr_SelLP; $5)

//StockLev_File
C_BOOLEAN:C305(StockLev_File; $0)

//StockLev_SelLP
C_REAL:C285(StockLev_SelLP; $2)
C_REAL:C285(StockLev_SelLP; $3)
C_POINTER:C301(StockLev_SelLP; $4)
C_POINTER:C301(StockLev_SelLP; $5)

//SuperDiary_File
C_BOOLEAN:C305(SuperDiary_File; $0)

//Trans_File
C_BOOLEAN:C305(Trans_File; $0)

//Trans_SelLP
C_LONGINT:C283(Trans_SelLP; $2)
C_LONGINT:C283(Trans_SelLP; $3)
C_POINTER:C301(Trans_SelLP; $4)
C_POINTER:C301(Trans_SelLP; $5)

//Transact_End
C_BOOLEAN:C305(Transact_End; $2)

//User_SREdit
C_BOOLEAN:C305(User_SREdit; $1)

//ZProducts_Mod
C_TEXT:C284(ZProducts_Mod; $1)

//VCDCEXPORT

//CCM_CARDSELECTION
C_TEXT:C284(CCM_CardSelection; $4)
C_LONGINT:C283(CCM_CardSelection; $5)

//CCM_LOADRELATEDCARDS
C_POINTER:C301(CCM_LoadRelatedCards; $15)
C_POINTER:C301(CCM_LoadRelatedCards; $16)

//CCM_ORDERAUTHORIZE
C_LONGINT:C283(CCM_OrderAuthorize; $8)

//CCM_PROCESSCARD
C_LONGINT:C283(CCM_ProcessCard; $6)
C_TEXT:C284(CCM_ProcessCard; $7)
C_LONGINT:C283(CCM_ProcessCard; $8)
C_LONGINT:C283(CCM_ProcessCard; $9)
C_TEXT:C284(CCM_ProcessCard; $10)
C_TEXT:C284(CCM_ProcessCard; $11)
C_TEXT:C284(CCM_ProcessCard; $12)

//CCMGETAUTH
C_LONGINT:C283(CCMGetAuth; $4)
C_TEXT:C284(CCMGetAuth; $5)
C_TEXT:C284(CCMGetAuth; $6)
C_TEXT:C284(CCMGetAuth; $7)

//SM_LOADSEARCHPARAMETERNAMES
C_LONGINT:C283(SM_LoadSearchParameterNames; $4)

//SM_SEARCHVARSTOBLOB
C_POINTER:C301(SM_SearchVarsToBlob; $32)

//SM_SAVESEARCHPARAMETERS
C_LONGINT:C283(SM_SaveSearchParameters; $6)

//Gen_Set_enterable
C_POINTER:C301(Gen_Set_enterable; $24)
C_POINTER:C301(Gen_Set_enterable; $25)
C_POINTER:C301(Gen_Set_enterable; $26)
C_POINTER:C301(Gen_Set_enterable; $27)
C_POINTER:C301(Gen_Set_enterable; $28)
C_POINTER:C301(Gen_Set_enterable; $29)
C_POINTER:C301(Gen_Set_enterable; $30)
C_POINTER:C301(Gen_Set_enterable; $31)

//SD2_LOADDIARYACTIONCLASSES
C_BOOLEAN:C305(SD2_LoadDiaryActionClasses; $1)

//SD2_LOADTABSETTING
C_BOOLEAN:C305(SD2_LoadTabSetting; $1)
C_LONGINT:C283(SD2_LoadTabSetting; $2)
C_POINTER:C301(SD2_LoadTabSetting; $3)
C_POINTER:C301(SD2_LoadTabSetting; $4)
C_POINTER:C301(SD2_LoadTabSetting; $5)
C_POINTER:C301(SD2_LoadTabSetting; $6)

//SM_EDITMACRO
C_LONGINT:C283(SM_EditMacro; $1)
C_TEXT:C284(SM_EditMacro; $2)
C_TEXT:C284(SM_EditMacro; $3)
C_TEXT:C284(SM_EditMacro; $4)
C_LONGINT:C283(SM_EditMacro; $5)

//REP_GROUPS
C_BOOLEAN:C305(REP_Groups; $1)

//POFINDFF
C_POINTER:C301(POFindFF; $1)

//STOCKMOVITEMDEL
C_BOOLEAN:C305(StockMovItemDel; $0)


//SD2_LOADACTIONGROUPS
C_BOOLEAN:C305(SD2_LoadActionGroups; $1)
C_POINTER:C301(SD2_LoadActionGroups; $2)
C_POINTER:C301(SD2_LoadActionGroups; $3)
C_POINTER:C301(SD2_LoadActionGroups; $4)

//CCM_SHOWCONTACTCARDS
C_TEXT:C284(CCM_ShowContactCards; $1)
C_LONGINT:C283(CCM_ShowContactCards; $2)
C_TEXT:C284(CCM_ShowContactCards; $3)

//CCM_EDITRECORD
C_BOOLEAN:C305(CCM_EditRecord; $0)
C_LONGINT:C283(CCM_EditRecord; $1)

//CCM_ISOCURRENCYCODES
C_TEXT:C284(CCM_ISOCurrencyCodes; $1)

//Currency_File
C_BOOLEAN:C305(Currency_File; $0)

//CCM_EXTRACTFIELD
C_TEXT:C284(CCM_ExtractField; $0)
C_TEXT:C284(CCM_ExtractField; $1)
C_TEXT:C284(CCM_ExtractField; $2)
C_TEXT:C284(CCM_ExtractField; $3)
C_TEXT:C284(CCM_ExtractField; $4)

//CCM_VERIFYLICENCE
C_BOOLEAN:C305(CCM_VerifyLicence; $0)

//CCM_CREATETRANSACTIONRECORD
C_LONGINT:C283(CCM_CreateTransactionRecord; $0)
C_TEXT:C284(CCM_CreateTransactionRecord; $1)
C_LONGINT:C283(CCM_CreateTransactionRecord; $2)
C_POINTER:C301(CCM_CreateTransactionRecord; $3)
C_POINTER:C301(CCM_CreateTransactionRecord; $4)
C_TEXT:C284(CCM_CreateTransactionRecord; $5)
C_TEXT:C284(CCM_CreateTransactionRecord; $6)
C_LONGINT:C283(CCM_CreateTransactionRecord; $7)
C_LONGINT:C283(CCM_CreateTransactionRecord; $8)
C_TEXT:C284(CCM_CreateTransactionRecord; $9)
C_TEXT:C284(CCM_CreateTransactionRecord; $10)
C_TEXT:C284(CCM_CreateTransactionRecord; $11)
C_TEXT:C284(CCM_CreateTransactionRecord; $12)

//CCM_GETAUTHCODEFROMTRANS
C_TEXT:C284(CCM_GetAuthCodeFromTrans; $0)
C_LONGINT:C283(CCM_GetAuthCodeFromTrans; $1)

//INV_DEPOSITREFUND2
C_BOOLEAN:C305(INV_DepositRefund2; $1)
C_REAL:C285(INV_DepositRefund2; $2)
C_LONGINT:C283(INV_DepositRefund2; $3)

//INV_REFUNDSEL
C_BOOLEAN:C305(INV_RefundSel; $1)
C_REAL:C285(INV_RefundSel; $2)

//CCM_INVOICEAUTHORIZE
C_REAL:C285(CCM_InvoiceAuthorize; $0)
C_TEXT:C284(CCM_InvoiceAuthorize; $1)
C_TEXT:C284(CCM_InvoiceAuthorize; $2)
C_TEXT:C284(CCM_InvoiceAuthorize; $3)
C_REAL:C285(CCM_InvoiceAuthorize; $4)
C_TEXT:C284(CCM_InvoiceAuthorize; $5)
C_LONGINT:C283(CCM_InvoiceAuthorize; $6)
C_BOOLEAN:C305(CCM_InvoiceAuthorize; $7)

//CCM_GETSENDSTRING
C_TEXT:C284(CCM_GetSendString; $0)
C_TEXT:C284(CCM_GetSendString; $1)
C_TEXT:C284(CCM_GetSendString; $2)

//CCM_GETAUTHAMOUNTFROMTRANS
C_REAL:C285(CCM_GetAuthAmountFromTrans; $0)
C_LONGINT:C283(CCM_GetAuthAmountFromTrans; $1)

//PUR_GETFILESTATE
C_TEXT:C284(PUR_GetFileState; $0)
C_TEXT:C284(PUR_GetFileState; $1)

//PUR_SETFILESTATE
C_LONGINT:C283(PUR_SetFileState; $1)
C_TEXT:C284(PUR_SetFileState; $2)

//PRT_GETPRINTERPAPEROPTIONS
C_TEXT:C284(PRT_GetPrinterPaperOptions; $1)
C_TEXT:C284(PRT_GetPrinterPaperOptions; $2)

//PRT_LOAD_SETPREFERENCES
C_BOOLEAN:C305(PRT_Load_SetPreferences; $1)

//PRT_SETPRINTERPAPEROPTIONS
C_TEXT:C284(PRT_SetPrinterPaperOptions; $1)

//CCM_GETRESPONSEVALIDFROMTRANS
C_BOOLEAN:C305(CCM_GetResponseValidFromTrans; $0)
C_LONGINT:C283(CCM_GetResponseValidFromTrans; $1)

//INV_RECEIPTREFUND2
C_BOOLEAN:C305(INV_ReceiptRefund2; $1)
C_REAL:C285(INV_ReceiptRefund2; $2)
C_LONGINT:C283(INV_ReceiptRefund2; $3)

//INV_UNDOSEL
C_BOOLEAN:C305(INV_UndoSel; $1)
C_REAL:C285(INV_UndoSel; $2)
C_LONGINT:C283(INV_UndoSel; $3)

//INV_ALLOCATEDEPOSIT
C_LONGINT:C283(INV_AllocateDeposit; $1)

//PUR_SETDUEAMOUNT
C_REAL:C285(PUR_SetDueAmount; $0)

//ACC_AUTOPOSTPROFIT
C_TEXT:C284(ACC_AutoPostProfit; $1)
C_TEXT:C284(ACC_AutoPostProfit; $2)
C_TEXT:C284(ACC_AutoPostProfit; $3)
C_TEXT:C284(ACC_AutoPostProfit; $4)


//SD2_QUERYDIARYSERVERSIDE
C_POINTER:C301(SD2_QueryDiaryserverside; $1)
C_POINTER:C301(SD2_QueryDiaryserverside; $2)
C_POINTER:C301(SD2_QueryDiaryserverside; $3)
C_POINTER:C301(SD2_QueryDiaryserverside; $4)
C_POINTER:C301(SD2_QueryDiaryserverside; $5)
C_POINTER:C301(SD2_QueryDiaryserverside; $6)
C_POINTER:C301(SD2_QueryDiaryserverside; $7)
C_LONGINT:C283(SD2_QueryDiaryserverside; $8)

//ACC_PROFITCALCULATORNEW
C_TEXT:C284(ACC_ProfitCalculatorNEW; $1)

//Macro_AccTypeDEF
C_BOOLEAN:C305(Macro_AccTypeDEF; $0)
C_TEXT:C284(Macro_AccTypeDEF; $1)

//Diary_DelBut
C_TEXT:C284(Diary_DelBut; $1)

//Orders_DelBut
C_TEXT:C284(Orders_DelBut; $1)

//ACC_AUTOPOSTBFPROFIT
C_TEXT:C284(ACC_AutoPostBFProfit; $1)
C_TEXT:C284(ACC_AutoPostBFProfit; $2)
C_TEXT:C284(ACC_AutoPostBFProfit; $3)
C_TEXT:C284(ACC_AutoPostBFProfit; $4)

//SD2_LOADDIARYTYPES
C_BOOLEAN:C305(SD2_LoadDiaryTypes; $1)

//SD2_LOADDIARYLOCATIONS
C_POINTER:C301(SD2_LoadDiaryLocations; $1)
C_POINTER:C301(SD2_LoadDiaryLocations; $2)

//SD2_LOADTEMPLATEACTIONSETTINGS
C_BOOLEAN:C305(SD2_LoadTemplateActionSettings; $1)
C_REAL:C285(SD2_LoadTemplateActionSettings; $2)

//SD2_EDITACTIONOWNER
C_POINTER:C301(SD2_EditActionOwner; $1)

//SI_CHECKSUBRECORDS
C_BOOLEAN:C305(SI_CheckSubrecords; $0)

//DB_FORCEAL
C_LONGINT:C283(DB_ForceAL; $1)

//SD2_UPDATEDIARYRELATIONS
C_LONGINT:C283(SD2_UpdateDiaryRelations; $1)

//SD2_MODIFYTABLES
C_POINTER:C301(SD2_ModifyTables; $1)

//SD2_MODIFYMACROS
C_POINTER:C301(SD2_ModifyMacros; $1)
C_POINTER:C301(SD2_ModifyMacros; $2)

//CCM_LOADCOMPANYCONTACTS
C_LONGINT:C283(CCM_LoadCompanyContacts; $1)
C_LONGINT:C283(CCM_LoadCompanyContacts; $2)

//CCM_GETADDRESS
C_BOOLEAN:C305(CCM_GetAddress; $0)
C_REAL:C285(CCM_GetAddress; $1)
C_POINTER:C301(CCM_GetAddress; $2)
C_POINTER:C301(CCM_GetAddress; $3)
C_POINTER:C301(CCM_GetAddress; $4)
C_POINTER:C301(CCM_GetAddress; $5)
C_POINTER:C301(CCM_GetAddress; $6)

//Country_File
C_BOOLEAN:C305(Country_File; $0)

//GEN_CHOICEPOPUPCALL
C_BOOLEAN:C305(GEN_ChoicePopupCall; $0)
C_POINTER:C301(GEN_ChoicePopupCall; $1)
C_POINTER:C301(GEN_ChoicePopupCall; $2)
C_BOOLEAN:C305(GEN_ChoicePopupCall; $3)
C_TEXT:C284(GEN_ChoicePopupCall; $4)
C_TEXT:C284(GEN_ChoicePopupCall; $5)
C_TEXT:C284(GEN_ChoicePopupCall; $6)

//SD2_MODIFYRESULTS
C_POINTER:C301(SD2_ModifyResults; $1)

//SD2_OPENDIARYFORM
C_TEXT:C284(SD2_OpenDiaryForm; $1)

//SD2_LOADDIARYFORMNAMES
C_REAL:C285(SD2_LoadDiaryFormNames; $1)
C_REAL:C285(SD2_LoadDiaryFormNames; $2)
C_TEXT:C284(SD2_LoadDiaryFormNames; $3)
C_POINTER:C301(SD2_LoadDiaryFormNames; $4)

//CCM_SHOWDETAILS
C_LONGINT:C283(CCM_ShowDetails; $1)
C_POINTER:C301(CCM_ShowDetails; $2)
C_DATE:C307(CCM_ShowDetails; $3)
C_DATE:C307(CCM_ShowDetails; $4)
C_TEXT:C284(CCM_ShowDetails; $5)

//CCM_FINDPSPACTIVITY
C_LONGINT:C283(CCM_FindPSPActivity; $1)
C_POINTER:C301(CCM_FindPSPActivity; $2)
C_DATE:C307(CCM_FindPSPActivity; $3)
C_DATE:C307(CCM_FindPSPActivity; $4)
C_TEXT:C284(CCM_FindPSPActivity; $5)

//PICTURE_EXPAND
C_POINTER:C301(Picture_expand; $1)
C_TEXT:C284(Picture_expand; $2)

//ORD_INV_DEPOSITED
C_LONGINT:C283(ORD_INV_Deposited; $1)
C_TEXT:C284(ORD_INV_Deposited; $2)
C_POINTER:C301(ORD_INV_Deposited; $3)
C_POINTER:C301(ORD_INV_Deposited; $4)

//SSI_UNKNOWNXMLHANDLER
C_LONGINT:C283(SSI_UnknownXMLHandler; $1)
C_TEXT:C284(SSI_UnknownXMLHandler; $2)
C_POINTER:C301(SSI_UnknownXMLHandler; $3)

//SSI_FUNCTIONGETCARDAUTH
C_LONGINT:C283(SSI_FunctionGetCardAuth; $1)
C_TEXT:C284(SSI_FunctionGetCardAuth; $2)
C_REAL:C285(SSI_FunctionGetCardAuth; $3)
C_BOOLEAN:C305(SSI_FunctionGetCardAuth; $4)
C_TEXT:C284(SSI_FunctionGetCardAuth; $5)
C_TEXT:C284(SSI_FunctionGetCardAuth; $6)

//SSI_SOAPFAULT
C_LONGINT:C283(SSI_SoapFault; $1)
C_LONGINT:C283(SSI_SoapFault; $2)
C_TEXT:C284(SSI_SoapFault; $3)
C_TEXT:C284(SSI_SoapFault; $4)

//DM_CONFIGUREXMLSCHEMA
C_BOOLEAN:C305(DM_ConfigureXMLSchema; $0)
C_TEXT:C284(DM_ConfigureXMLSchema; $1)
C_POINTER:C301(DM_ConfigureXMLSchema; $2)
C_BOOLEAN:C305(DM_ConfigureXMLSchema; $3)
C_TEXT:C284(DM_ConfigureXMLSchema; $4)

//DM_LOADXMLSTRUCTUREELEMENTS
C_TEXT:C284(DM_LoadXMLStructureElements; $1)
C_LONGINT:C283(DM_LoadXMLStructureElements; $2)
C_POINTER:C301(DM_LoadXMLStructureElements; $3)
C_POINTER:C301(DM_LoadXMLStructureElements; $4)
C_POINTER:C301(DM_LoadXMLStructureElements; $5)
C_POINTER:C301(DM_LoadXMLStructureElements; $6)


//CCM_LOADCARDNUMBER
C_TEXT:C284(CCM_LoadCardNumber; $0)

//CCM_VOIDTRANSACTION
C_REAL:C285(CCM_VoidTransaction; $0)
C_REAL:C285(CCM_VoidTransaction; $1)
C_TEXT:C284(CCM_VoidTransaction; $2)
C_DATE:C307(CCM_VoidTransaction; $3)

//CCM_LOADINVAUTHS
C_TEXT:C284(CCM_LoadInvAuths; $1)

//SSI_CREATEDTDBLOCK
C_LONGINT:C283(SSI_CreateDTDBlock; $1)

//SSI_LOADMAP
C_REAL:C285(SSI_LoadMap; $1)

//SSI_GETSUBFIELDPROPERTIES
C_LONGINT:C283(SSI_GETSUBFIELDPROPERTIES; $1)
C_REAL:C285(SSI_GETSUBFIELDPROPERTIES; $2)


//COMPANY_DOCPRINTPREFGET
C_BOOLEAN:C305(Company_docPrintPrefGet; $0)
C_TEXT:C284(Company_docPrintPrefGet; $1)
C_TEXT:C284(Company_docPrintPrefGet; $2)
C_POINTER:C301(Company_docPrintPrefGet; $3)

//COMPANY_DOCPRINTPREFSET
C_TEXT:C284(Company_docPrintPrefSet; $1)
C_TEXT:C284(Company_docPrintPrefSet; $2)
C_BOOLEAN:C305(Company_docPrintPrefSet; $3)
C_TEXT:C284(Company_docPrintPrefSet; $4)

//COMPRESS_BLOBPTR
C_POINTER:C301(Compress_BlobPtr; $1)

//DOCUMENT_EMAILPDF
C_TEXT:C284(Document_EmailPDF; $1)
C_TEXT:C284(Document_EmailPDF; $2)

//DOC_PREFERENCESFILENAMEGET
C_TEXT:C284(Doc_preferencesFileNameGet; $0)
C_TEXT:C284(Doc_preferencesFileNameGet; $1)

//DOC_USERGETREPORTTYPES
C_POINTER:C301(Doc_userGetReportTypes; $1)

//DOC_USERPREFERENCESINDEXGET
C_TEXT:C284(Doc_userPreferencesIndexGet; $0)
C_TEXT:C284(Doc_userPreferencesIndexGet; $1)

//DOC_USERPREFERENCESMAPGET
C_TEXT:C284(Doc_userPreferencesMapGet; $0)
C_TEXT:C284(Doc_userPreferencesMapGet; $1)
C_POINTER:C301(Doc_userPreferencesMapGet; $2)

//EMAIL_SENDQUITELY
C_TEXT:C284(Email_sendQuitely; $1)
C_TEXT:C284(Email_sendQuitely; $2)
C_TEXT:C284(Email_sendQuitely; $3)
C_TEXT:C284(Email_sendQuitely; $4)
C_POINTER:C301(Email_sendQuitely; $5)
C_BOOLEAN:C305(Email_sendQuitely; $6)
C_TEXT:C284(Email_sendQuitely; $7)

//EXPAND_BLOBPTR
C_POINTER:C301(Expand_BlobPtr; $1)

//REPORTS_INTERNALPREFSLOAD
C_TEXT:C284(Reports_InternalPrefsLoad; $1)

//REPORTS_PREFSLOAD
C_TEXT:C284(Reports_prefsLoad; $1)

//SHELL_TABHLISTGETREF
C_LONGINT:C283(Shell_tabHlistGetRef; $0)
C_LONGINT:C283(Shell_tabHlistGetRef; $1)


//SUPERREPORTTOPDF
C_BOOLEAN:C305(SuperReportToPDF; $0)
C_POINTER:C301(SuperReportToPDF; $1)
C_TEXT:C284(SuperReportToPDF; $2)

//USER_IN13ADDPREFERENCE
C_TEXT:C284(User_inAddPreference; $1)
C_LONGINT:C283(User_inAddPreference; $2)

//PDF995_CLEAREMPTYELEMENTS
C_POINTER:C301(PDF995_clearEmptyElements; $1)


//PDF995_FILECONTENTGET
C_BOOLEAN:C305(PDF995_fileContentGet; $0)
C_TEXT:C284(PDF995_fileContentGet; $1)
C_POINTER:C301(PDF995_fileContentGet; $2)

//PDF995_INIFILEPATHGET
C_TEXT:C284(PDF995_iNIFilePathGet; $0)

//PDF995_INICONFIGSETPARAM
C_BOOLEAN:C305(PDF995_iNIConfigSetParam; $0)
C_TEXT:C284(PDF995_iNIConfigSetParam; $1)
C_TEXT:C284(PDF995_iNIConfigSetParam; $2)

//PDF995_INIFILEPATHSET
C_TEXT:C284(PDF995_iNIFilePathSet; $1)

//PDF995_TARGETPATHSET
C_TEXT:C284(PDF995_targetPathSet; $1)
C_BOOLEAN:C305(PDF995_targetPathSet; $2)

//PDF995_PROCESSINGFILEGET
C_TEXT:C284(PDF995_processingFileGet; $0)

//PDF995_TEXT2ARRAY
C_TEXT:C284(PDF995_text2Array; $1)
C_POINTER:C301(PDF995_text2Array; $2)
C_TEXT:C284(PDF995_text2Array; $3)
C_BOOLEAN:C305(PDF995_text2Array; $4)

//PDF995_ISPRINTERINSTALLED
C_BOOLEAN:C305(PDF995_isPrinterInstalled; $0)
C_TEXT:C284(PDF995_isPrinterInstalled; $1)

//PDF995_AUTOLAUNCHGET
C_BOOLEAN:C305(PDF995_autoLaunchGet; $0)


//PDF995_BATCHFILEGET
C_TEXT:C284(PDF995_batchFileGet; $0)

//PDF995_ISENABLED
C_BOOLEAN:C305(PDF995_isEnabled; $0)

//PDF995_FILEDIRPATHSET
C_TEXT:C284(PDF995_fileDirPathSet; $1)

//PDF995_PRINTERNAMESET
C_TEXT:C284(PDF995_printerNameSet; $1)

//PDF995_PRINTERNAMEGET
C_TEXT:C284(PDF995_printerNameGet; $0)

//PDF995_COLLECTOUTPUT
C_TEXT:C284(PDF995_collectOutput; $1)

//PDF995_ROOTDIRNAMEGET
C_TEXT:C284(PDF995_rootDirNameGet; $0)

//PDF995_ROOTDIRPATHSET
C_TEXT:C284(PDF995_rootDirPathSet; $1)

//PDF995_INICONFIGCOMMIT
C_BOOLEAN:C305(PDF995_iNIConfigCommit; $0)

//PDF995_ERRORSET
C_TEXT:C284(PDF995_errorSet; $1)

//PDF995_INIFILEPATHGETDEFAULT
C_TEXT:C284(PDF995_iNIFilePathGetDefault; $0)

//PDF995_PRINTERFULLNAMEGET
C_TEXT:C284(PDF995_printerFullNameGet; $0)
C_TEXT:C284(PDF995_printerFullNameGet; $1)

//PDF995_FILEPATHTODIRPATH
C_TEXT:C284(PDF995_filePathToDirPath; $0)
C_TEXT:C284(PDF995_filePathToDirPath; $1)

//PDF995_AUTOLAUNCHSET
C_BOOLEAN:C305(PDF995_autoLaunchSet; $1)
C_BOOLEAN:C305(PDF995_autoLaunchSet; $2)

//PDF995_FILEPATHTONAME
C_TEXT:C284(PDF995_filePathToName; $0)
C_TEXT:C284(PDF995_filePathToName; $1)

//PDF995_ROOTDIRNAMESET
C_TEXT:C284(PDF995_rootDirNameSet; $1)

//PDF995_PROCESSINGFILESET
C_TEXT:C284(PDF995_processingFileSet; $1)

//PDF995_TARGETPATHGET
C_TEXT:C284(PDF995_targetPathGet; $0)

//PDF995_INICONFIGINIT
C_BOOLEAN:C305(PDF995_iNIConfigInit; $0)

//PDF995_GETREADY
C_BOOLEAN:C305(PDF995_getReady; $1)
C_BOOLEAN:C305(PDF995_getReady; $2)
C_BOOLEAN:C305(PDF995_getReady; $3)

//PDF995_FILECONTENTSET
C_BOOLEAN:C305(PDF995_fileContentSet; $0)
C_TEXT:C284(PDF995_fileContentSet; $1)
C_POINTER:C301(PDF995_fileContentSet; $2)

//PDF995_ISTARGETREADY
C_BOOLEAN:C305(PDF995_isTargetReady; $0)

//PDF995_BATCHFILESET
C_TEXT:C284(PDF995_batchFileSet; $1)
C_TEXT:C284(PDF995_batchFileSet; $2)
C_BOOLEAN:C305(PDF995_batchFileSet; $3)

//PDF995_DEFAULTPRINTERGET
C_TEXT:C284(PDF995_defaultPrinterGet; $0)
C_TEXT:C284(PDF995_defaultPrinterGet; $1)

//PDF995_ROOTDIRPATHGET
C_TEXT:C284(PDF995_rootDirPathGet; $0)

//PDF995_DEFAULTPRINTERSET
C_BOOLEAN:C305(PDF995_defaultPrinterSet; $0)
C_TEXT:C284(PDF995_defaultPrinterSet; $1)
C_BOOLEAN:C305(PDF995_defaultPrinterSet; $2)


//PERSONNEL_PDF_ADDMENU
C_LONGINT:C283(Personnel_PDF_addMenu; $1)

//REPORTS_PREFSSAVE
C_TEXT:C284(Reports_PrefsSave; $1)

//REPORTS_SETPREFINTERFACE
C_BOOLEAN:C305(Reports_SetPrefInterface; $1)

//LOADVIRTUALRELATIONS
C_LONGINT:C283(LoadVirtualRelations; $1)
C_TEXT:C284(LoadVirtualRelations; $2)
C_LONGINT:C283(LoadVirtualRelations; $3)
C_LONGINT:C283(LoadVirtualRelations; $4)
C_TEXT:C284(LoadVirtualRelations; $5)
C_TEXT:C284(LoadVirtualRelations; $6)
C_TEXT:C284(LoadVirtualRelations; $7)
C_POINTER:C301(LoadVirtualRelations; $8)

//SEL_VREL
C_POINTER:C301(Sel_vRel; $1)
C_POINTER:C301(Sel_vRel; $2)
C_LONGINT:C283(Sel_vRel; $3)
C_POINTER:C301(Sel_vRel; $4)

//SAVEVIRTUALRELATIONS
C_POINTER:C301(SaveVirtualrelations; $1)
C_POINTER:C301(SaveVirtualrelations; $2)
C_LONGINT:C283(SaveVirtualrelations; $3)
C_POINTER:C301(SaveVirtualrelations; $4)

//Set_Fonts_ByPointer
C_POINTER:C301(Set_Fonts_ByPointer; ${2})
C_LONGINT:C283(Set_Fonts_ByPointer; $1)
C_POINTER:C301(Set_Fonts_ByPointer; $2)
C_POINTER:C301(Set_Fonts_ByPointer; $3)
C_POINTER:C301(Set_Fonts_ByPointer; $4)
C_POINTER:C301(Set_Fonts_ByPointer; $5)
C_POINTER:C301(Set_Fonts_ByPointer; $6)
C_POINTER:C301(Set_Fonts_ByPointer; $7)
C_POINTER:C301(Set_Fonts_ByPointer; $8)
C_POINTER:C301(Set_Fonts_ByPointer; $9)

//Set_FontFS_ByPointer
C_POINTER:C301(Set_FontFS_ByPointer; ${-1})
C_TEXT:C284(Set_FontFS_ByPointer; $1)
C_LONGINT:C283(Set_FontFS_ByPointer; $2)
C_POINTER:C301(Set_FontFS_ByPointer; $3)
C_POINTER:C301(Set_FontFS_ByPointer; $4)
C_POINTER:C301(Set_FontFS_ByPointer; $5)
C_POINTER:C301(Set_FontFS_ByPointer; $6)
C_POINTER:C301(Set_FontFS_ByPointer; $7)
C_POINTER:C301(Set_FontFS_ByPointer; $8)

//SD2_LOADDIARY
C_TEXT:C284(SD2_LoadDiary; $1)

//SD2_LOADDIARYACTIONTYPE
C_POINTER:C301(SD2_LoadDiaryActionType; $1)
C_POINTER:C301(SD2_LoadDiaryActionType; $2)

//DF_LOADPRODPRICESETTINGS
C_BOOLEAN:C305(DF_LoadProdPriceSettings; $1)

//SYNCH_CREATESYNCHRECORD
C_LONGINT:C283(SYNCH_CreateSynchRecord; $1)
C_LONGINT:C283(SYNCH_CreateSynchRecord; $2)
C_POINTER:C301(SYNCH_CreateSynchRecord; $3)

//DB_SETMENUBAR
C_TEXT:C284(DB_SetMenuBar; $1)
C_LONGINT:C283(DB_SetMenuBar; $2)
C_LONGINT:C283(DB_SetMenuBar; $3)

//DB_GETDOCUMENTPATH
C_TEXT:C284(DB_GetDocumentPath; $0)

//ORD_TEMP_EXPORDERNOS
C_REAL:C285(ORD_Temp_ExpOrderNos; $1)

//ORDI_GETSORTREF
C_LONGINT:C283(ORDI_GetSortRef; $0)
C_TEXT:C284(ORDI_GetSortRef; $1)
C_LONGINT:C283(ORDI_GetSortRef; $2)

//DB_DELETIONCONTROL
C_REAL:C285(DB_DeletionControl; $0)
C_POINTER:C301(DB_DeletionControl; $1)
C_TEXT:C284(DB_DeletionControl; $2)

//WEBSERV_RECORDCREATE
C_TEXT:C284(WebServ_recordCreate; $1)
C_TEXT:C284(WebServ_recordCreate; $2)
C_POINTER:C301(WebServ_recordCreate; $3)
C_POINTER:C301(WebServ_recordCreate; $4)

//DM_GETWEBSERVSOURCE
C_BOOLEAN:C305(DM_GetWebServSource; $0)
C_TEXT:C284(DM_GetWebServSource; $1)
C_POINTER:C301(DM_GetWebServSource; $2)
C_POINTER:C301(DM_GetWebServSource; $3)
C_POINTER:C301(DM_GetWebServSource; $4)

//DM_SAVEWEBDATA
C_LONGINT:C283(DM_SAVEWEBDATA; $1)
C_POINTER:C301(DM_SAVEWEBDATA; $2)
C_POINTER:C301(DM_SAVEWEBDATA; $3)
C_POINTER:C301(DM_SAVEWEBDATA; $4)

//DM_VALIDATEDIARY
C_BOOLEAN:C305(DM_VALIDATEDIARY; $0)
C_LONGINT:C283(DM_VALIDATEDIARY; $1)
C_LONGINT:C283(DM_VALIDATEDIARY; $2)
C_LONGINT:C283(DM_VALIDATEDIARY; $3)
C_TEXT:C284(DM_VALIDATEDIARY; $4)
C_TEXT:C284(DM_VALIDATEDIARY; $5)
C_POINTER:C301(DM_VALIDATEDIARY; $6)
C_POINTER:C301(DM_VALIDATEDIARY; $7)

//DM_SETDIARYDEFAULTS
C_REAL:C285(DM_SetDiaryDefaults; $1)
C_TEXT:C284(DM_SetDiaryDefaults; $2)
C_TEXT:C284(DM_SetDiaryDefaults; $3)

//DM_CREATEDIARY
C_REAL:C285(DM_CreateDiary; $1)
C_REAL:C285(DM_CreateDiary; $2)
C_TEXT:C284(DM_CreateDiary; $3)
C_TEXT:C284(DM_CreateDiary; $4)
C_POINTER:C301(DM_CreateDiary; $5)
C_POINTER:C301(DM_CreateDiary; $6)

//DM_MODIFYDIARY
C_REAL:C285(DM_MODIFYDIARY; $1)
C_TEXT:C284(DM_MODIFYDIARY; $2)
C_TEXT:C284(DM_MODIFYDIARY; $3)
C_TEXT:C284(DM_MODIFYDIARY; $4)

//DM_HANDLEWEBDIADATA
C_REAL:C285(DM_HandleWebDIAdata; $1)
C_POINTER:C301(DM_HandleWebDIAdata; $2)
C_POINTER:C301(DM_HandleWebDIAdata; $3)

//JOBS_GETSORTREF
C_LONGINT:C283(JOBs_GetSortref; $0)
C_TEXT:C284(JOBs_GetSortref; $1)
C_TEXT:C284(JOBs_GetSortref; $2)
C_LONGINT:C283(JOBs_GetSortref; $3)
C_TEXT:C284(JOBs_GetSortref; $4)

//DM_CREATEWEBSERVSOURCE
C_TEXT:C284(DM_CreateWebServSource; $1)

//QV_BUILDGROUPING
C_LONGINT:C283(QV_BuildGrouping; $1)
C_TEXT:C284(QV_BuildGrouping; $2)



//Cont_SelAUTO
C_TEXT:C284(Cont_SelAUTO; $1)

//EW_LBI_SETUP
C_POINTER:C301(EW_LBI_Setup; ${4})
C_POINTER:C301(EW_LBI_Setup; $1)
C_TEXT:C284(EW_LBI_Setup; $2)
C_LONGINT:C283(EW_LBI_Setup; $3)
C_POINTER:C301(EW_LBI_Setup; $4)
C_POINTER:C301(EW_LBI_Setup; $5)
C_POINTER:C301(EW_LBI_Setup; $6)
C_POINTER:C301(EW_LBI_Setup; $7)
C_POINTER:C301(EW_LBI_Setup; $8)
C_POINTER:C301(EW_LBI_Setup; $9)

//FLD_LBI_DEFITEMS
C_BOOLEAN:C305(FLD_LBI_DefItems; $0)

//FURTH_LBI_MOD
C_POINTER:C301(Furth_LBI_Mod; $1)
C_LONGINT:C283(Furth_LBI_Mod; $2)
C_LONGINT:C283(Furth_LBI_Mod; $3)

//PO_LBI_POITEMS
C_BOOLEAN:C305(PO_LBI_PoItems; $0)

//PROD_LBI_SUPPLIERS
C_BOOLEAN:C305(PROD_LBI_Suppliers; $0)

//SD_LBI_ARROWCLICK
C_POINTER:C301(SD_LBi_ArrowClick; $1)
C_TEXT:C284(SD_LBi_ArrowClick; $2)

//LBI_DELALLELEMß
C_POINTER:C301(LBi_DelAllElemß; $1)
C_POINTER:C301(LBi_DelAllElemß; $2)
C_POINTER:C301(LBi_DelAllElemß; $3)
C_POINTER:C301(LBi_DelAllElemß; $4)
C_POINTER:C301(LBi_DelAllElemß; $5)

//LBI_DELBCKGRDELEM
C_POINTER:C301(LBi_DelBckgrdElem; $1)

//LBI_DELETEELEM
C_POINTER:C301(LBi_DeleteElem; $1)
C_LONGINT:C283(LBi_DeleteElem; $2)
C_LONGINT:C283(LBi_DeleteElem; $3)

//LBI_DIARYITEMVIEW
C_POINTER:C301(LBi_DiaryItemView; $1)
C_BOOLEAN:C305(LBi_DiaryItemView; $2)
C_TEXT:C284(LBi_DiaryItemView; $3)

//LBI_DRAGCOL
C_POINTER:C301(LBi_DragCol; $1)

//LBI_DRAGCOPY
C_POINTER:C301(LBi_DragCopy; $1)

//LBI_DRAGROW
C_POINTER:C301(LBi_DragRow; $1)

//LBI_EDITLISTLAY
C_POINTER:C301(LBi_EditListLay; $1)
C_POINTER:C301(LBi_EditListLay; $2)
C_POINTER:C301(LBi_EditListLay; $3)
C_POINTER:C301(LBi_EditListLay; $4)


//LBI_EDITLISTUPD
C_POINTER:C301(LBi_EditListUpd; $1)
C_POINTER:C301(LBi_EditListUpd; $2)
C_POINTER:C301(LBi_EditListUpd; $3)

//LBI_EDITRECORD
C_LONGINT:C283(LBi_EditRecord; $1)
C_TEXT:C284(LBi_EditRecord; $2)
C_POINTER:C301(LBi_EditRecord; $3)
C_BOOLEAN:C305(LBi_EditRecord; $4)
C_LONGINT:C283(LBi_EditRecord; $5)
C_LONGINT:C283(LBi_EditRecord; $6)
C_LONGINT:C283(LBi_EditRecord; $7)
C_LONGINT:C283(LBi_EditRecord; $8)

//LBI_FINDELEM
C_LONGINT:C283(LBi_FindElem; $0)
C_POINTER:C301(LBi_FindElem; $1)

//LBI_FINDIFAL
C_BOOLEAN:C305(LBi_FindIfAL; $0)
C_POINTER:C301(LBi_FindIfAL; $1)

//LBI_FINDLINE
C_BOOLEAN:C305(LBi_FindLine; $0)
C_POINTER:C301(LBi_FindLine; $1)

//LBI_FINDLINES
C_BOOLEAN:C305(LBi_FindLines; $0)
C_POINTER:C301(LBi_FindLines; $1)

//LBI_FINDLINESUB
C_BOOLEAN:C305(LBi_FindLineSub; $0)
C_POINTER:C301(LBi_FindLineSub; $1)

//LBI_FINDSIFAL
C_BOOLEAN:C305(LBi_FindsifAl; $0)
C_POINTER:C301(LBi_FindsifAl; $1)
C_BOOLEAN:C305(LBi_FindsifAl; $2)

//LBI_FMULREPLACE
C_TEXT:C284(LBi_FmulReplace; $0)
C_POINTER:C301(LBi_FmulReplace; $1)
C_TEXT:C284(LBi_FmulReplace; $2)
C_LONGINT:C283(LBi_FmulReplace; $3)

//LBI_GETPTRBOOLEAN
C_POINTER:C301(LBi_GetPtrBoolean; $0)
C_TEXT:C284(LBi_GetPtrBoolean; $1)
C_LONGINT:C283(LBi_GetPtrBoolean; $2)

//LBI_GETPTRDATE
C_POINTER:C301(LBi_GetPtrDate; $0)
C_TEXT:C284(LBi_GetPtrDate; $1)
C_LONGINT:C283(LBi_GetPtrDate; $2)

//LBI_GETPTRINTEGER
C_POINTER:C301(LBi_GetPtrInteger; $0)
C_TEXT:C284(LBi_GetPtrInteger; $1)
C_LONGINT:C283(LBi_GetPtrInteger; $2)

//LBI_GETPTRLONG
C_POINTER:C301(LBi_GetPtrLong; $0)
C_TEXT:C284(LBi_GetPtrLong; $1)
C_LONGINT:C283(LBi_GetPtrLong; $2)

//LBI_GETPTRREAL
C_POINTER:C301(LBi_GetPtrReal; $0)
C_TEXT:C284(LBi_GetPtrReal; $1)
C_LONGINT:C283(LBi_GetPtrReal; $2)

//LBI_GETPTRSTRI
C_POINTER:C301(LBi_GetPtrStri; $0)
C_TEXT:C284(LBi_GetPtrStri; $1)
C_LONGINT:C283(LBi_GetPtrStri; $2)

//LBI_GETPTRTEXT
C_POINTER:C301(LBi_GetPtrTEXT; $0)
C_TEXT:C284(LBi_GetPtrTEXT; $1)
C_LONGINT:C283(LBi_GetPtrTEXT; $2)

//LBI_INCLEDIT
C_POINTER:C301(LBi_InclEdit; $1)
C_BOOLEAN:C305(LBi_InclEdit; $2)
C_TEXT:C284(LBi_InclEdit; $3)
C_REAL:C285(LBi_InclEdit; $4)

//LBI_INCLEDIT_INPROCESS
C_LONGINT:C283(LBi_InclEdit_inProcess; $1)
C_LONGINT:C283(LBi_InclEdit_inProcess; $2)
C_TEXT:C284(LBi_InclEdit_inProcess; $3)
C_LONGINT:C283(LBi_InclEdit_inProcess; $4)
C_LONGINT:C283(LBi_InclEdit_inProcess; $5)
C_TEXT:C284(LBi_InclEdit_inProcess; $6)

//LBI_INCLFIELDARR
C_POINTER:C301(LBi_InclFIeldArr; $1)
C_LONGINT:C283(LBi_InclFIeldArr; $2)

//LBI_INCLFIELDS
C_POINTER:C301(LBi_InclFields; $1)
C_BOOLEAN:C305(LBi_InclFields; $2)

//LBI_INCLFIND
C_POINTER:C301(LBi_InclFind; $1)

//LBI_INCLFLDDEL
C_TEXT:C284(LBi_InclFldDel; $0)
C_TEXT:C284(LBi_InclFldDel; $1)
C_POINTER:C301(LBi_InclFldDel; $2)
C_LONGINT:C283(LBi_InclFldDel; $3)

//LBI_INCLSETUP
C_POINTER:C301(LBi_inclSetup; $1)

//LBI_INCLSETUPCLHE
C_POINTER:C301(LBi_InclSetupClHe; $1)

//LBI_INCLSETUPJUSTSTYLE
C_POINTER:C301(LBi_InclSetupJustStyle; $1)

//LBI_INCLSETUPQ
C_POINTER:C301(LBi_InclSetupQ; $1)

//LBI_INSERTELEM
C_POINTER:C301(LBI_InsertElem; $1)
C_LONGINT:C283(LBI_InsertElem; $2)
C_LONGINT:C283(LBI_InsertElem; $3)

//LBI_LISTFINDDUP
C_TEXT:C284(LBi_ListFindDup; $1)
C_TEXT:C284(LBi_ListFindDup; $2)

//LBI_LISTLAY
C_TEXT:C284(LBi_ListLay; $1)

//LBI_LOADARRAYP
C_TEXT:C284(LBi_LoadArrayP; $1)

//LBI_LOADARRAYS
C_POINTER:C301(LBi_LoadArrays; $1)
C_POINTER:C301(LBi_LoadArrays; $2)
C_BOOLEAN:C305(LBi_LoadArrays; $3)

//LBI_LOADARRSUB
C_POINTER:C301(LBi_LoadArrSub; $1)

//LBI_LOADFMUL
C_POINTER:C301(LBi_LoadFmul; $1)

//LBI_LOADFTRS
C_POINTER:C301(LBi_LoadFtrs; $1)
C_REAL:C285(LBi_LoadFtrs; $2)

//LBI_LOADSETUP
C_POINTER:C301(LBi_LoadSetup; $1)
C_TEXT:C284(LBi_LoadSetup; $2)
C_LONGINT:C283(LBi_LoadSetup; $3)

//LBI_LOADSRN
C_POINTER:C301(LBi_LoadSRN; $1)
C_POINTER:C301(LBi_LoadSRN; $2)

//LBI_LOCKUPDATE
C_POINTER:C301(LBi_LockUpdate; $1)

//LBI_MAXOF
C_REAL:C285(LBi_Maxof; $0)
C_REAL:C285(LBi_Maxof; ${8})
C_REAL:C285(LBi_Maxof; $1)
C_REAL:C285(LBi_Maxof; $2)
C_REAL:C285(LBi_Maxof; $3)
C_REAL:C285(LBi_Maxof; $4)
C_REAL:C285(LBi_Maxof; $5)
C_REAL:C285(LBi_Maxof; $6)
C_REAL:C285(LBi_Maxof; $7)

//LBI_MINOF
C_REAL:C285(LBi_Minof; $0)
C_REAL:C285(LBi_Minof; ${5})
C_REAL:C285(LBi_Minof; $1)
C_REAL:C285(LBi_Minof; $2)
C_REAL:C285(LBi_Minof; $3)
C_REAL:C285(LBi_Minof; $4)

//LBI_MODCLEAR
C_LONGINT:C283(LBi_ModClear; $1)
C_LONGINT:C283(LBi_ModClear; $2)

//LBI_MODESIMPLE
C_POINTER:C301(LBi_ModeSimple; $1)
C_POINTER:C301(LBi_ModeSimple; $2)

//LBI_MODINCL
C_BOOLEAN:C305(LBi_ModIncl; $0)
C_POINTER:C301(LBi_ModIncl; $1)
C_REAL:C285(LBi_ModIncl; $2)
C_REAL:C285(LBi_ModIncl; $3)

//LBI_MODINCLSUB
C_BOOLEAN:C305(LBi_ModInclSub; $0)
C_POINTER:C301(LBi_ModInclSub; $1)
C_REAL:C285(LBi_ModInclSub; $2)
C_REAL:C285(LBi_ModInclSub; $3)

//LBI_MODUPDATE
C_POINTER:C301(LBi_ModUpdate; $1)
C_BOOLEAN:C305(LBi_ModUpdate; $2)
C_POINTER:C301(LBi_ModUpdate; $3)
C_REAL:C285(LBi_ModUpdate; $4)
C_REAL:C285(LBi_ModUpdate; $5)

//LBI_MODUPIFAL
C_POINTER:C301(LBi_ModUpifAl; $1)

//LBI_PREFS11
C_POINTER:C301(LBi_Prefs11; $1)
C_POINTER:C301(LBi_Prefs11; $2)
C_POINTER:C301(LBi_Prefs11; $3)
C_POINTER:C301(LBi_Prefs11; $4)
C_POINTER:C301(LBi_Prefs11; $5)

//LBI_PREFS4SORT
C_POINTER:C301(LBi_Prefs4Sort; $1)

//LBI_PREFS4UPD
C_POINTER:C301(LBi_pRefs4upd; $1)

//LBI_REMOVEALL
C_POINTER:C301(LBi_RemoveAll; $1)

//LBI_RESIZE
C_POINTER:C301(LBi_Resize; $1)

//LBI_SCPT_ARROWCLICK
C_POINTER:C301(LBi_SCPT_ArrowClick; $1)
C_TEXT:C284(LBi_SCPT_ArrowClick; $2)

//LBI_SCPT_DIARYITEMVIEW
C_POINTER:C301(LBi_SCPT_DiaryItemView; $1)
C_BOOLEAN:C305(LBi_SCPT_DiaryItemView; $2)
C_TEXT:C284(LBi_SCPT_DiaryItemView; $3)

//LBI_SCPT_MANAGEEVENT
C_POINTER:C301(LBi_SCPT_ManageEvent; $1)
C_LONGINT:C283(LBi_SCPT_ManageEvent; $2)
C_POINTER:C301(LBi_SCPT_ManageEvent; $3)

//LBI_SETDRGPAIR
C_REAL:C285(LBI_SetDRGPair; $1)
C_POINTER:C301(LBI_SetDRGPair; $2)
C_TEXT:C284(LBI_SetDRGPair; $3)

//LBI_SETSCROLL0
C_POINTER:C301(LBi_SetScroll0; $1)

//LBI_SETSCROLL0S
C_POINTER:C301(LBi_SetScroll0s; $1)
C_POINTER:C301(LBi_SetScroll0s; $2)
C_POINTER:C301(LBi_SetScroll0s; $3)
C_POINTER:C301(LBi_SetScroll0s; $4)
C_POINTER:C301(LBi_SetScroll0s; $5)

//LBI_SETSELECT1
C_POINTER:C301(LBi_SetSelect1; $1)
C_LONGINT:C283(LBi_SetSelect1; $2)

//LBI_SIMPLELPB2
C_POINTER:C301(LBi_SimpleLPB2; $1)
C_TEXT:C284(LBi_SimpleLPB2; $2)

//LBI_STARTBACK2
C_TEXT:C284(LBi_StartBack2; $1)
C_BOOLEAN:C305(LBi_StartBack2; $2)
C_POINTER:C301(LBi_StartBack2; $3)
C_TEXT:C284(LBi_StartBack2; $4)

//LBI_STARTBACKDEL
C_TEXT:C284(LBi_StartBackDel; $0)
C_TEXT:C284(LBi_StartBackDel; $1)
C_LONGINT:C283(LBi_StartBackDel; $2)
C_LONGINT:C283(LBi_StartBackDel; $3)

//LBI_SUBKEYUP
C_POINTER:C301(LBi_SubKeyUp; $1)
C_LONGINT:C283(LBi_SubKeyUp; $2)

//LBI_XMINUS
C_POINTER:C301(LBi_Xminus; $1)

//LBI_XMINUSES
C_POINTER:C301(LBi_Xminuses; $1)

//LBI_XPLUS
C_POINTER:C301(LBi_xPlus; $1)
C_POINTER:C301(LBi_xPlus; $2)
C_REAL:C285(LBi_xPlus; $3)
C_REAL:C285(LBi_xPlus; $4)
C_POINTER:C301(LBi_xPlus; $5)

//LBI_ZNEG
C_REAL:C285(LBi_zNeg; $0)
C_REAL:C285(LBi_zNeg; $1)

//LB_GETCOLUMN
C_LONGINT:C283(LB_GetColumn; $0)
C_POINTER:C301(LB_GetColumn; $1)
C_TEXT:C284(LB_GetColumn; $2)
C_TEXT:C284(LB_GetColumn; $3)

//LB_GETFORMCOLOUR
C_REAL:C285(LB_GetFormcolour; $0)
C_LONGINT:C283(LB_GetFormcolour; $1)
C_TEXT:C284(LB_GetFormcolour; $2)
C_POINTER:C301(LB_GetFormcolour; $3)
C_POINTER:C301(LB_GetFormcolour; $4)

//LB_GETSELECT
C_POINTER:C301(LB_GetSelect; $1)
C_POINTER:C301(LB_GetSelect; $2)

//LB_GETWIDTHS
C_POINTER:C301(LB_GetWidths; ${-1})
C_POINTER:C301(LB_GetWidths; $1)
C_LONGINT:C283(LB_GetWidths; $2)
C_POINTER:C301(LB_GetWidths; $3)
C_POINTER:C301(LB_GetWidths; $4)
C_POINTER:C301(LB_GetWidths; $5)
C_POINTER:C301(LB_GetWidths; $6)
C_POINTER:C301(LB_GetWidths; $7)
C_POINTER:C301(LB_GetWidths; $8)
C_POINTER:C301(LB_GetWidths; $9)

//LB_GOTOCELL
C_POINTER:C301(LB_GoToCell; $1)
C_LONGINT:C283(LB_GoToCell; $2)
C_LONGINT:C283(LB_GoToCell; $3)

//LB_SETCHOICELIST
C_TEXT:C284(LB_SetChoiceList; $1)
C_POINTER:C301(LB_SetChoiceList; $2)
C_POINTER:C301(LB_SetChoiceList; $3)

//LB_SETCOLOURS
C_POINTER:C301(LB_SetColours; $1)
C_LONGINT:C283(LB_SetColours; $2)
C_LONGINT:C283(LB_SetColours; $3)
C_LONGINT:C283(LB_SetColours; $4)

//LB_SETCOLUMNHEADERS
C_TEXT:C284(LB_SetColumnHeaders; ${4})
C_POINTER:C301(LB_SetColumnHeaders; $1)
C_TEXT:C284(LB_SetColumnHeaders; $2)
C_LONGINT:C283(LB_SetColumnHeaders; $3)
C_TEXT:C284(LB_SetColumnHeaders; $4)
C_TEXT:C284(LB_SetColumnHeaders; $5)
C_TEXT:C284(LB_SetColumnHeaders; $6)
C_TEXT:C284(LB_SetColumnHeaders; $7)
C_TEXT:C284(LB_SetColumnHeaders; $8)
C_TEXT:C284(LB_SetColumnHeaders; $9)
C_TEXT:C284(LB_SetColumnHeaders; $10)
C_TEXT:C284(LB_SetColumnHeaders; $11)
C_TEXT:C284(LB_SetColumnHeaders; $12)
C_TEXT:C284(LB_SetColumnHeaders; $13)
C_TEXT:C284(LB_SetColumnHeaders; $14)
C_TEXT:C284(LB_SetColumnHeaders; $15)
C_TEXT:C284(LB_SetColumnHeaders; $16)
C_TEXT:C284(LB_SetColumnHeaders; $17)
C_TEXT:C284(LB_SetColumnHeaders; $18)
C_TEXT:C284(LB_SetColumnHeaders; $19)

//LB_SETCOLUMNWIDTHS
C_REAL:C285(LB_SetColumnWidths; ${-1})
C_POINTER:C301(LB_SetColumnWidths; $1)
C_TEXT:C284(LB_SetColumnWidths; $2)
C_LONGINT:C283(LB_SetColumnWidths; $3)
C_REAL:C285(LB_SetColumnWidths; $4)
C_REAL:C285(LB_SetColumnWidths; $5)
C_REAL:C285(LB_SetColumnWidths; $6)
C_REAL:C285(LB_SetColumnWidths; $7)
C_REAL:C285(LB_SetColumnWidths; $8)
C_REAL:C285(LB_SetColumnWidths; $9)
C_REAL:C285(LB_SetColumnWidths; $10)
C_REAL:C285(LB_SetColumnWidths; $11)
C_REAL:C285(LB_SetColumnWidths; $12)
C_REAL:C285(LB_SetColumnWidths; $13)
C_REAL:C285(LB_SetColumnWidths; $14)
C_REAL:C285(LB_SetColumnWidths; $15)

//LB_SETDIVIDERS
C_POINTER:C301(LB_Setdividers; $1)
C_LONGINT:C283(LB_Setdividers; $2)
C_LONGINT:C283(LB_Setdividers; $3)

//LB_SETENTERABLE
C_POINTER:C301(LB_SetEnterable; $1)
C_BOOLEAN:C305(LB_SetEnterable; $2)
C_REAL:C285(LB_SetEnterable; $3)
C_TEXT:C284(LB_SetEnterable; $4)

//LB_SETENTRYOPTIONS
C_POINTER:C301(LB_SETENTRYOPTIONS; $1)
C_LONGINT:C283(LB_SETENTRYOPTIONS; $2)

//LB_SETFONT
C_POINTER:C301(LB_SETFONT; $1)
C_TEXT:C284(LB_SETFONT; $2)
C_LONGINT:C283(LB_SETFONT; $3)
C_TEXT:C284(LB_SETFONT; $4)
C_LONGINT:C283(LB_SETFONT; $5)
C_LONGINT:C283(LB_SETFONT; $6)
C_LONGINT:C283(LB_SETFONT; $7)
C_LONGINT:C283(LB_SETFONT; $8)
C_LONGINT:C283(LB_SETFONT; $9)

//LB_SETFONTSIZE
C_POINTER:C301(LB_SetFontSize; $1)
C_TEXT:C284(LB_SetFontSize; $2)
C_LONGINT:C283(LB_SetFontSize; $3)
C_LONGINT:C283(LB_SetFontSize; $4)
C_LONGINT:C283(LB_SetFontSize; $5)
C_LONGINT:C283(LB_SetFontSize; $6)

//LB_SETFONTSTYLE
C_POINTER:C301(LB_SetFontStyle; $1)
C_TEXT:C284(LB_SetFontStyle; $2)
C_LONGINT:C283(LB_SetFontStyle; $3)
C_LONGINT:C283(LB_SetFontStyle; $4)
C_LONGINT:C283(LB_SetFontStyle; $5)
C_LONGINT:C283(LB_SetFontStyle; $6)

//LB_SETFOOTERS
C_LONGINT:C283(LB_SetFooters; $0)
C_TEXT:C284(LB_SetFooters; ${5})
C_POINTER:C301(LB_SetFooters; $1)
C_LONGINT:C283(LB_SetFooters; $2)
C_LONGINT:C283(LB_SetFooters; $3)
C_LONGINT:C283(LB_SetFooters; $4)
C_TEXT:C284(LB_SetFooters; $5)
C_TEXT:C284(LB_SetFooters; $6)
C_TEXT:C284(LB_SetFooters; $7)
C_TEXT:C284(LB_SetFooters; $8)
C_TEXT:C284(LB_SetFooters; $9)
C_TEXT:C284(LB_SetFooters; $10)
C_TEXT:C284(LB_SetFooters; $11)
C_TEXT:C284(LB_SetFooters; $12)

//LB_SETFORMAT
C_POINTER:C301(LB_SetFormat; $1)
C_LONGINT:C283(LB_SetFormat; $2)
C_TEXT:C284(LB_SetFormat; $3)
C_LONGINT:C283(LB_SetFormat; $4)
C_LONGINT:C283(LB_SetFormat; $5)
C_LONGINT:C283(LB_SetFormat; $6)
C_POINTER:C301(LB_SetFormat; $7)

//LB_SETLINE
C_POINTER:C301(LB_SetLine; $1)
C_LONGINT:C283(LB_SetLine; $2)

//LB_SETSCROLL
C_POINTER:C301(LB_SetScroll; $1)
C_LONGINT:C283(LB_SetScroll; $2)
C_LONGINT:C283(LB_SetScroll; $3)

//LB_SETSELECT
C_POINTER:C301(LB_SetSelect; $1)
C_POINTER:C301(LB_SetSelect; $2)

//LB_SETSORTOPTIONS
C_POINTER:C301(LB_SetSortOptions; $1)
C_LONGINT:C283(LB_SetSortOptions; $2)
C_LONGINT:C283(LB_SetSortOptions; $3)
C_LONGINT:C283(LB_SetSortOptions; $4)

//LB_SETUPLISTBOX
C_POINTER:C301(LB_SetupListbox; ${18})
C_POINTER:C301(LB_SetupListbox; $1)
C_TEXT:C284(LB_SetupListbox; $2)
C_TEXT:C284(LB_SetupListbox; $3)
C_LONGINT:C283(LB_SetupListbox; $4)
C_POINTER:C301(LB_SetupListbox; $5)
C_POINTER:C301(LB_SetupListbox; $6)
C_POINTER:C301(LB_SetupListbox; $7)
C_POINTER:C301(LB_SetupListbox; $8)
C_POINTER:C301(LB_SetupListbox; $9)
C_POINTER:C301(LB_SetupListbox; $10)
C_POINTER:C301(LB_SetupListbox; $11)
C_POINTER:C301(LB_SetupListbox; $12)
C_POINTER:C301(LB_SetupListbox; $13)
C_POINTER:C301(LB_SetupListbox; $14)
C_POINTER:C301(LB_SetupListbox; $15)
C_POINTER:C301(LB_SetupListbox; $16)
C_POINTER:C301(LB_SetupListbox; $17)
C_POINTER:C301(LB_SetupListbox; $18)
C_POINTER:C301(LB_SetupListbox; $19)
C_POINTER:C301(LB_SetupListbox; $20)
C_POINTER:C301(LB_SetupListbox; $21)
C_POINTER:C301(LB_SetupListbox; $22)
C_POINTER:C301(LB_SetupListbox; $23)
C_POINTER:C301(LB_SetupListbox; $24)
C_POINTER:C301(LB_SetupListbox; $25)
C_POINTER:C301(LB_SetupListbox; $26)
C_POINTER:C301(LB_SetupListbox; $27)
C_POINTER:C301(LB_SetupListbox; $28)

//LB_STYLESETTINGS
C_POINTER:C301(LB_StyleSettings; $1)
C_TEXT:C284(LB_StyleSettings; $2)
C_LONGINT:C283(LB_StyleSettings; $3)
C_TEXT:C284(LB_StyleSettings; $4)
C_POINTER:C301(LB_StyleSettings; $5)

//LBI_AREASORT
C_LONGINT:C283(LBi_AreaSort; $0)
C_TEXT:C284(LBi_AreaSort; $1)
C_LONGINT:C283(LBi_AreaSort; $2)
C_POINTER:C301(LBi_AreaSort; $3)
C_BOOLEAN:C305(LBi_AreaSort; $4)

//LBI_ARRAYFILLN
C_LONGINT:C283(LBi_ArrayFillN; ${2})
C_POINTER:C301(LBi_ArrayFillN; $1)

//LBI_ARRAYFILLP
C_POINTER:C301(LBi_ArrayFillp; ${2})
C_LONGINT:C283(LBi_ArrayFillp; $1)
C_POINTER:C301(LBi_ArrayFillp; $2)
C_POINTER:C301(LBi_ArrayFillp; $3)
C_POINTER:C301(LBi_ArrayFillp; $4)
C_POINTER:C301(LBi_ArrayFillp; $5)

//LBI_ARRAYFILLT
C_LONGINT:C283(LBi_ArrayFillT; $2)
C_POINTER:C301(LBi_ArrayFillT; $1)

C_TEXT:C284(LBi_ArrayFillT; $3)
C_TEXT:C284(LBi_ArrayFillT; $4)
C_TEXT:C284(LBi_ArrayFillT; $5)
C_TEXT:C284(LBi_ArrayFillT; $6)
C_TEXT:C284(LBi_ArrayFillT; $7)
C_TEXT:C284(LBi_ArrayFillT; $8)
C_TEXT:C284(LBi_ArrayFillT; $9)
C_TEXT:C284(LBi_ArrayFillT; $10)
C_TEXT:C284(LBi_ArrayFillT; $11)
C_TEXT:C284(LBi_ArrayFillT; $12)
C_TEXT:C284(LBi_ArrayFillT; $13)
//LBI_ARRDEFCLEAR
C_POINTER:C301(LBi_ArrDefClear; $1)

//LBI_ARRDEFFILL
C_POINTER:C301(LBi_ArrDefFill; $1)
C_POINTER:C301(LBi_ArrDefFill; $2)
C_POINTER:C301(LBi_ArrDefFill; $3)
C_POINTER:C301(LBi_ArrDefFill; $4)
C_TEXT:C284(LBi_ArrDefFill; $5)
C_TEXT:C284(LBi_ArrDefFill; $6)
C_LONGINT:C283(LBi_ArrDefFill; $7)
C_TEXT:C284(LBi_ArrDefFill; $8)
C_TEXT:C284(LBi_ArrDefFill; $9)
C_TEXT:C284(LBi_ArrDefFill; $10)
C_BOOLEAN:C305(LBi_ArrDefFill; $11)

//LBI_ARRDEFFILL01
C_POINTER:C301(LBi_ArrDefFill01; $1)
C_POINTER:C301(LBi_ArrDefFill01; $2)
C_POINTER:C301(LBi_ArrDefFill01; $3)
C_POINTER:C301(LBi_ArrDefFill01; $4)
C_TEXT:C284(LBi_ArrDefFill01; $5)
C_TEXT:C284(LBi_ArrDefFill01; $6)
C_TEXT:C284(LBi_ArrDefFill01; $7)
C_TEXT:C284(LBi_ArrDefFill01; $8)
C_TEXT:C284(LBi_ArrDefFill01; $9)
C_TEXT:C284(LBi_ArrDefFill01; $10)
C_TEXT:C284(LBi_ArrDefFill01; $11)
C_TEXT:C284(LBi_ArrDefFill01; $12)
C_TEXT:C284(LBi_ArrDefFill01; $13)
C_POINTER:C301(LBi_ArrDefFill01; $14)
C_POINTER:C301(LBi_ArrDefFill01; $15)

//LBI_ARRDEFFILLQ
C_POINTER:C301(LBi_ArrDefFillQ; $1)
C_POINTER:C301(LBi_ArrDefFillQ; $2)
C_POINTER:C301(LBi_ArrDefFillQ; $3)
C_POINTER:C301(LBi_ArrDefFillQ; $4)
C_TEXT:C284(LBi_ArrDefFillQ; $5)
C_TEXT:C284(LBi_ArrDefFillQ; $6)
C_TEXT:C284(LBi_ArrDefFillQ; $7)
C_TEXT:C284(LBi_ArrDefFillQ; $8)
C_TEXT:C284(LBi_ArrDefFillQ; $9)
C_TEXT:C284(LBi_ArrDefFillQ; $10)
C_TEXT:C284(LBi_ArrDefFillQ; $11)
C_TEXT:C284(LBi_ArrDefFillQ; $12)
C_TEXT:C284(LBi_ArrDefFillQ; $13)
C_POINTER:C301(LBi_ArrDefFillQ; $14)
C_POINTER:C301(LBi_ArrDefFillQ; $15)
C_LONGINT:C283(LBi_ArrDefFillQ; $16)

//LBI_ARRUPD2
C_POINTER:C301(LBi_ArrUpd2; $1)

//LBI_ARRUPDATE
C_POINTER:C301(LBi_ArrUpdate; $1)
C_LONGINT:C283(LBi_ArrUpdate; $2)
C_BOOLEAN:C305(LBi_ArrUpdate; $3)

//LBI_DELALLELEM
C_POINTER:C301(LBi_DelAllElem; $1)

//LBI_AREASCRIPT
C_POINTER:C301(LBi_AreaScript; $1)
C_LONGINT:C283(LBi_AreaScript; $2)
C_TEXT:C284(LBi_AreaScript; $3)
C_POINTER:C301(LBi_AreaScript; $4)
C_REAL:C285(LBi_AreaScript; $5)
C_TEXT:C284(LBi_AreaScript; $6)
C_TEXT:C284(LBi_AreaScript; $7)
C_LONGINT:C283(LBi_AreaScript; $8)

//LB_GETLINE
C_LONGINT:C283(LB_GetLine; $0)
C_POINTER:C301(LB_GetLine; $1)

//LB_GETROW
C_LONGINT:C283(LB_GetRow; $0)
C_POINTER:C301(LB_GetRow; $1)

//LBI_SCROLLONRESIZE
C_POINTER:C301(LBI_Scrollonresize; $1)

//LBI_SETFOOTERBYARRAY
C_POINTER:C301(LBI_SetFooterByArray; $1)
C_POINTER:C301(LBI_SetFooterByArray; $2)
C_POINTER:C301(LBI_SetFooterByArray; $3)
C_POINTER:C301(LBI_SetFooterByArray; $4)
C_LONGINT:C283(LBI_SetFooterByArray; $5)

//DOCUMENT_GETEMAILADDRESSES
C_TEXT:C284(Document_GetEmailAddresses; $0)
C_TEXT:C284(Document_GetEmailAddresses; $1)
C_TEXT:C284(Document_GetEmailAddresses; $2)
C_TEXT:C284(Document_GetEmailAddresses; $3)

//FILELAUNCH
C_BOOLEAN:C305(FileLaunch; $0)
C_TEXT:C284(FileLaunch; $1)

//PAL_DISPLAYPOPUP
C_LONGINT:C283(PAL_DisplayPopUp; $1)
C_LONGINT:C283(PAL_DisplayPopUp; $2)
C_LONGINT:C283(PAL_DisplayPopUp; $3)
C_LONGINT:C283(PAL_DisplayPopUp; $4)
C_TEXT:C284(PAL_DisplayPopUp; $5)

//SD2_CREATELINKEDDIARYTHREAD
C_LONGINT:C283(SD2_CreateLinkedDiaryThread; $1)
C_LONGINT:C283(SD2_CreateLinkedDiaryThread; $2)

//SD2_CHECKDEFAULTACTION
C_TEXT:C284(SD2_CheckDefaultAction; $1)

//SVS_LOADPROBLEMTYPES
C_BOOLEAN:C305(SVS_LoadproblemTypes; $1)
C_POINTER:C301(SVS_LoadproblemTypes; $2)
C_POINTER:C301(SVS_LoadproblemTypes; $3)
C_POINTER:C301(SVS_LoadproblemTypes; $4)

//QV_PALLETTESETOBJECTPOSITIONS
C_REAL:C285(QV_PalletteSetobjectPositions; $1)

//JOB_LOADSTAGETYPELINKS
C_BOOLEAN:C305(JOB_LoadStageTypeLinks; $1)

//INT_GETDOCK
C_LONGINT:C283(INT_GetDock; $0)
C_TEXT:C284(INT_GetDock; $1)

//SVS_CONTRACTTYPELOADRULES
C_BOOLEAN:C305(SVS_ContractTypeLoadRules; $1)

//SVS_CONTRACTLOADRULES
C_BOOLEAN:C305(SVS_ContractLoadRules; $1)

//SC_LOADDIARYRECORD
C_TEXT:C284(SC_LoadDiaryRecord; $1)

//SC_CREATEDIARYITEM
C_TEXT:C284(SC_CreateDiaryItem; $1)
C_TEXT:C284(SC_CreateDiaryItem; $2)

//SD2_LOADDIARYTABPREFS
C_REAL:C285(SD2_LoadDiaryTabPrefs; $0)
C_BOOLEAN:C305(SD2_LoadDiaryTabPrefs; $1)
C_POINTER:C301(SD2_LoadDiaryTabPrefs; $2)
C_POINTER:C301(SD2_LoadDiaryTabPrefs; $3)
C_POINTER:C301(SD2_LoadDiaryTabPrefs; $4)

//SD2_SEARCHFORWORKFLOW
C_POINTER:C301(SD2_SearchforWorkFlow; $1)
C_LONGINT:C283(SD2_SearchforWorkFlow; $2)

//SD2_GETSETFROMSERVER
C_POINTER:C301(SD2_GetSetFromServer; $1)
C_POINTER:C301(SD2_GetSetFromServer; $2)
C_LONGINT:C283(SD2_GetSetFromServer; $3)
C_DATE:C307(SD2_GetSetFromServer; $4)
C_DATE:C307(SD2_GetSetFromServer; $5)
C_TIME:C306(SD2_GetSetFromServer; $6)
C_TIME:C306(SD2_GetSetFromServer; $7)
C_LONGINT:C283(SD2_GetSetFromServer; $8)
C_POINTER:C301(SD2_GetSetFromServer; $9)
C_POINTER:C301(SD2_GetSetFromServer; $10)
C_POINTER:C301(SD2_GetSetFromServer; $11)
C_POINTER:C301(SD2_GetSetFromServer; $12)
C_POINTER:C301(SD2_GetSetFromServer; $13)
C_POINTER:C301(SD2_GetSetFromServer; $14)

//SD2_DIARYSETINITIALIZE
C_LONGINT:C283(SD2_DiarySetInitialize; $1)

//VCDC_SENDVIA4D




//CRYPT_CONVERT_TEA_X_TO_Z


//NVP_SET_VALUE_BY_NAME_S


//RES_LOAD_PICT

//FILE_CREATE_FULLPATH_FOLDER

//DTS_GET_MONTHDAY_X

//DTS_SUBTRACT_NORMALIZE
//DATE_GET_RFC_GMT

//XML_GET_LINEAGE_BY_INDEX
//ENV_GET_HTTPCD_HARDNAME_LONG

//HTTPCD_QI_INITED

//HTTPCD_RETRIEVE_OBJECT


//ENV_GET_HTTPCD_HARDNAME_SHORT
//HTTPCD_EXTRACT_RESPONSECODE

//HTTPCD_POST_SIMPLE


//HTTPCD_EXTRACT_CONTENTTYPE

//HTTPCD_ERROR

//HTTPCD_PARSE_HEADER_F_RESPONSE

//HTTPCD_HEAD_SIMPLE


//HTTPCD_GET_SIMPLE

//TCPD_CLOSE_STREAMS_BY_PROTOCOL

//TCPD_GET_STREAM_INFORMATION

//ENV_GET_TCPD_HARDNAME_LONG

//TCPD_OPEN_STREAM

//TCPD_GET_LOCALPORT_BY_INDEX_S

//ENV_GET_TCPD_HARDNAME_SHORT

//TCPD_COPY_S

//TCPD_QI_INITED


//TCPD_GET_STATUS


//TCPD_QI_ITK


//TCPD_QI_IC

//TCPD_GET_PROCESSID_BY_INDEX_S

//TCPD_SEND_FILE


//TCPD_OPEN_LISTENER


//TCPD_RELEASE_STREAM

//TCPD_QI_PROTOCOL_W_SSL

//TCPD_ERROR

//TCPD_RECEIVE_TO_BLOB


//TCPD_SEND_BLOB


//TCPD_QI_PLUGIN_W_SSLSTREAMS

//TCPD_CLOSE_STREAM_NOWAIT

//TCPD_GET_STATUS_S

//TCPD_QI_HANDLER_BUSY_S


//RES_OPEN_TCPD

//TCPD_GET_PROTOCOL_S

//TCPD_SET_STATUS_BY_INDEX_S

//TCPD_GET_STATUS_BY_INDEX_S

//TCPD_GET_IPADDRESS_S

//TCPD_CLOSERELEASE_STREAM

//INIT_TCPD


//TCPD_WAIT_FOR_NOTSTATUS

//TCPD_GET_INDEX_BY_PROCESSID_S

//TCPD_GET_PLUGIN_IN_USE

//TCPD_GET_LOCALPORT_S

//TCPD_SEND_TEXT

//TCPD_UPDATE_STATUSES_BY_PROT_S

//TCPD_SET_PROCESSID_BY_INDEX_S

//TCPD_GET_IPADDRESS_BY_INDEX_S

//TCPD_GET_PROTOCOL_COUNT_S

//TCPD_COUNT_ROWS_S

//TCPD_UPDATE_STATUSES_BY_TYPE_S


//TCPD_GET_PROCESSID_S

//TCPD_GET_STREAMREF_BY_INDEX_S

//TCPD_GET_INDEX_S

//TCPD_RECEIVE_FILE

//TCPD_GET_PROTOCOL_BY_INDEX_S

//TCPD_GET_TCP_INFO

//TCPD_WAIT_FOR_STATUS

//TCPD_GET_DNSLOOKUP_REVERSE

//TCPD_GET_DNSLOOKUP


//ETRANS_SET_FIELD_TR

//ENV_GET_ETRANS_HARDNAME_SHORT

//ETRANS_PP_CREATE_EXCHANGE

//ETRANS_IG_CREATE_RELAY

//ETRANS_PP_CHECK_EXCHANGE_RATES

//ETRANS_PPEC_CREATE_DIRECT

//ETRANS_RETURN_TR

//ETRANS_WP_CHECK_EXCHANGE_RATES

//ETRANS_FP_CREATE_DIRECT

//ETRANS_ANEC_CREATE_RELAY

//ETRANS_EX_CREATE_RELAY

//ETRANS_ANEC_CREATE_DIRECT

//ETRANS_LP_CREATE_DIRECT

//ETRANS_PP_CREATE_RELAY

//ETRANS_ERROR

//ETRANS_SP_CREATE_DIRECT

//ETRANS_WP_CREATE_EXCHANGE

//ETRANS_PP_CREATE_DIRECT

//ETRANS_AN_CREATE_RELAY

//ETRANS_TRANSACT



//INIT_ETRANS

//ETRANS_WP_CREATE_RELAY

//ETRANS_IG_CREATE_DIRECT

//ETRANS_SEC_CREATE_DIRECT

//ETRANS_OG_CREATE_DIRECT

//VCDC_XMLCOMPLIANCE2
C_TEXT:C284(VCDC_XMLCOMPLIANCE2; $0)
C_TEXT:C284(VCDC_XMLCOMPLIANCE2; $1)

//LBI_LISTFINDDUP
C_TEXT:C284(LBi_ListFindDup; $3)

//SD2_GETREOCCOURING
C_DATE:C307(SD2_GetReOccouring; $1)
C_DATE:C307(SD2_GetReOccouring; $2)

//SD2_QUERYSUBTABLE
C_LONGINT:C283(SD2_QuerySubtable; $1)
C_LONGINT:C283(SD2_QuerySubtable; $2)
C_TEXT:C284(SD2_QuerySubtable; $3)
C_TEXT:C284(SD2_QuerySubtable; $4)

//SD2_GETIDFIELDNUM
C_LONGINT:C283(SD2_GetIDFieldNum; $0)
C_LONGINT:C283(SD2_GetIDFieldNum; $1)

//AA_GETIDFIELDNUM
C_LONGINT:C283(AA_GetIDFieldNum; $0)
C_LONGINT:C283(AA_GetIDFieldNum; $1)

//EXP_ADDXMLCDATAELEMENT
C_TIME:C306(EXP_AddXMLcDataElement; $1)
C_TEXT:C284(EXP_AddXMLcDataElement; $2)
C_POINTER:C301(EXP_AddXMLcDataElement; $3)
C_BOOLEAN:C305(EXP_AddXMLcDataElement; $4)

//EXP_ADDSUBTABLEDATA
C_TIME:C306(EXP_ADDSubtableData; $1)
C_LONGINT:C283(EXP_ADDSubtableData; $2)
C_LONGINT:C283(EXP_ADDSubtableData; $3)
C_BOOLEAN:C305(EXP_ADDSubtableData; $4)
C_BOOLEAN:C305(EXP_ADDSubtableData; $5)
C_BOOLEAN:C305(EXP_ADDSubtableData; $6)

//EXP_XMLCOMPLIANCE
C_TEXT:C284(EXP_XMLCOMPLIANCE; $0)
C_TEXT:C284(EXP_XMLCOMPLIANCE; $1)

//JobStagesJC_inLPX
C_POINTER:C301(JobStagesJC_inLPX; $1)

//LB_GETCOLUMNNUMFROMFIELD
C_LONGINT:C283(LB_GetColumnNumFromField; $0)
C_POINTER:C301(LB_GetColumnNumFromField; $1)
C_POINTER:C301(LB_GetColumnNumFromField; $2)

//LB_SETFILTER
C_POINTER:C301(LB_SetFilter; $1)
C_LONGINT:C283(LB_SetFilter; $2)
C_TEXT:C284(LB_SetFilter; $3)
C_LONGINT:C283(LB_SetFilter; $4)
C_LONGINT:C283(LB_SetFilter; $5)

//PROCESSSERVICE_JOBPERSONNEL
C_BOOLEAN:C305(ProcessService_JobPersonnel; $0)

//PROCESSSERVICE_JOBSTAGES
C_BOOLEAN:C305(ProcessService_JobStages; $0)

//PER_LOADSMTPAUTH
C_BOOLEAN:C305(Per_LOADSMTPAUTH; $0)

//SYS_LOADSMTPAUTH
C_BOOLEAN:C305(SYS_LOADSMTPAUTH; $1)
C_POINTER:C301(SYS_LOADSMTPAUTH; $2)
//APPLICATIONTYPE_ISSINGLEUSER
C_BOOLEAN:C305(ApplicationType_isSingleUser; $0)

//STRUCTUREFILEPATH
C_TEXT:C284(StructureFilePath; $0)

//AA_LISTITEMADDPROPERTY
C_TEXT:C284(AA_ListItemAddProperty; $4)

//AA_LOADLIST
C_POINTER:C301(AA_LoadList; $6)
C_POINTER:C301(AA_LoadList; $7)
C_POINTER:C301(AA_LoadList; $8)

//AA_LOADLISTBYID
C_POINTER:C301(AA_LoadListbyID; $6)
C_POINTER:C301(AA_LoadListbyID; $7)
C_POINTER:C301(AA_LoadListbyID; $8)

//AA_LOADLISTBYNAME
C_POINTER:C301(AA_LoadListByName; $6)
C_POINTER:C301(AA_LoadListByName; $7)
C_POINTER:C301(AA_LoadListByName; $8)
C_POINTER:C301(AA_LoadListByName; $9)

//Acc_BalBSHdg
C_POINTER:C301(Acc_BalBSHdg; $1)

//ACC_BalInLP
C_REAL:C285(ACC_BalInLP; $1)

//Acc_BalPLBHdg
C_POINTER:C301(Acc_BalPLBHdg; $1)

//Acc_BalPLHdg
C_POINTER:C301(Acc_BalPLHdg; $1)

//Acc_BalPLHdg12
C_POINTER:C301(Acc_BalPLHdg12; $1)

//ACC_TrialBalancePrintHeading
C_POINTER:C301(ACC_TrialBalancePrintHeading; $1)

//Accounts_InLP
C_REAL:C285(Accounts_InLP; $1)

//ACC_TRANSACTIONMATCHPAIRS
C_LONGINT:C283(ACC_TRANSACTIONMATCHPAIRS; $0)

//Actions_InLP
C_REAL:C285(Actions_InLP; $1)

//AddTypes_InLP
C_REAL:C285(AddTypes_InLP; $1)

//ALZNEG
C_REAL:C285(ALZNeg; $0)
C_REAL:C285(ALZNeg; $1)

//Analyses_InLP
C_REAL:C285(Analyses_InLP; $1)

//Areas_InLP
C_REAL:C285(Areas_InLP; $1)


//BP_COPYDOCUMENTS
C_BOOLEAN:C305(BP_CopyDocuments; $1)
C_TEXT:C284(BP_CopyDocuments; $2)
C_TEXT:C284(BP_CopyDocuments; $3)

//Calls_InLP
C_REAL:C285(Calls_InLP; $1)

//Companies_Arr
C_LONGINT:C283(Companies_Arr; $1)

//Companies_Arr2
C_LONGINT:C283(Companies_Arr2; $3)

//Companies_InLP
C_REAL:C285(Companies_InLP; $1)

//Contact_List2
C_REAL:C285(Contact_List2; $1)

//Contracts_InLP
C_LONGINT:C283(Contracts_InLP; $1)

//Countries_InLP
C_REAL:C285(Countries_InLP; $1)

//Currencies_InLP
C_REAL:C285(Currencies_InLP; $1)

//CurrRates_InLP
C_REAL:C285(CurrRates_InLP; $1)

//Diary_Diary
C_LONGINT:C283(Diary_Diary; $1)

//Diary_DiaryHist
C_LONGINT:C283(Diary_DiaryHist; $1)

//Diary_DiaryHistSD
C_LONGINT:C283(Diary_DiaryHistSD; $1)

//Diary_DiaryPr
C_REAL:C285(Diary_DiaryPr; $1)

//Diary_HistFind
C_POINTER:C301(Diary_HistFind; $2)

//Diary_HistSrch
C_TEXT:C284(Diary_HistSrch; $1)

//Diary_HistSrchSD
C_TEXT:C284(Diary_HistSrchSD; $1)

//Diary_In
C_TEXT:C284(Diary_In; $8)

//Diary_InEmail
C_TEXT:C284(Diary_InEmail; $5)

//Diary_InL
C_TEXT:C284(Diary_InL; $5)

//Diary_InTLP
C_REAL:C285(Diary_InTLP; $1)

//DOCUMENTLIST
C_BOOLEAN:C305(DocumentList; $7)

//DS_DOCSTOSERVER
C_LONGINT:C283(DS_DocstoServer; $2)


//First_Param
C_POINTER:C301(First_Param; $2)

//Gen_Message
C_BOOLEAN:C305(Gen_Message; $2)

//Gen_PPSingle
C_LONGINT:C283(Gen_PPSingle; $0)

//Gen_PPSingleEmail
C_LONGINT:C283(Gen_PPSingleEmail; $0)

//GEN_GETMODULES
C_BOOLEAN:C305(GEN_GetModules; $1)

//IME_IMAPlay
C_POINTER:C301(IME_IMAPlay; $2)
C_POINTER:C301(IME_IMAPlay; $3)

//IME_ITXPlay
C_POINTER:C301(IME_ITXPlay; $2)
C_POINTER:C301(IME_ITXPlay; $3)

//In_ButtCall
C_BOOLEAN:C305(In_ButtCall; $15)

//In_ButtChkDis
C_TEXT:C284(In_ButtChkDis; ${2})
C_TEXT:C284(In_ButtChkDis; $2)
C_TEXT:C284(In_ButtChkDis; $3)

//Input_Buttons
C_TEXT:C284(Input_Buttons; ${3})
C_TEXT:C284(Input_Buttons; $3)
C_TEXT:C284(Input_Buttons; $4)

//INT_LOADFORMSIZES
C_BOOLEAN:C305(INT_LoadFormSizes; $3)

//Inv_PaySel2
C_BOOLEAN:C305(Inv_PaySel2; $6)

//Invoices_InLP
C_LONGINT:C283(Invoices_InLP; $1)

//InvStages_InLP
C_LONGINT:C283(InvStages_InLP; $1)

//IWS_HANDLER
C_LONGINT:C283(IWS_Handler; $1)

//IWS_RCVREQUEST
C_LONGINT:C283(IWS_RcvRequest; $0)

//IWS_REDIRECT
C_TEXT:C284(IWS_Redirect; $1)

//Jobs_InLP
C_REAL:C285(Jobs_InLP; $1)

//Letter_Date
C_DATE:C307(Letter_Date; $1)

//Letter_Print
C_TEXT:C284(Letter_Print; $3)

//Macro_AccType
C_BOOLEAN:C305(Macro_AccType; $3)

//Master_UseSS
C_BOOLEAN:C305(Master_UseSS; $2)

//MASTER2
C_BOOLEAN:C305(Master2; $2)

//Modules_ArrStar
C_REAL:C285(Modules_ArrStar; $1)

//Move_InLP
C_LONGINT:C283(Move_InLP; $1)

//Open_Flo_Window
C_LONGINT:C283(Open_Flo_Window; $2)
C_LONGINT:C283(Open_Flo_Window; $3)
C_POINTER:C301(Open_Flo_Window; $4)
C_TEXT:C284(Open_Flo_Window; $5)
C_TEXT:C284(Open_Flo_Window; $6)
C_LONGINT:C283(Open_Flo_Window; $7)

//Open_Pro_Window
C_LONGINT:C283(Open_Pro_Window; $7)

//OPEN_THERMOMETER
C_BOOLEAN:C305(OPEN_THERMOMETER; $2)

//OPEN_THERMOMETER1
C_BOOLEAN:C305(OPEN_THERMOMETER1; $2)

//Path_Check
C_BOOLEAN:C305(Path_Check; $1)

//Path_TestDlog
C_BOOLEAN:C305(Path_TestDlog; $1)

//Products_Arr
C_REAL:C285(Products_Arr; $1)

//PROD_COPYHIGHLIGHTED
C_LONGINT:C283(PROD_CopyHighlighted; $1)

//PROD_SAVESUBENITITIES
C_LONGINT:C283(PROD_SaveSubEnitities; $1)

//Projects_InLP
C_LONGINT:C283(Projects_InLP; $1)

//Public_InLP
C_LONGINT:C283(Public_InLP; $1)

//Purch_InLP
C_LONGINT:C283(Purch_InLP; $1)

//Purch_InPLP
C_REAL:C285(Purch_InPLP; $1)

//PurchOrd_InLP
C_LONGINT:C283(PurchOrd_InLP; $1)

//QV_SHOWQUALITIES
C_POINTER:C301(QV_ShowQualities; $5)
C_BOOLEAN:C305(QV_ShowQualities; $6)

//SD_AUTOADDREC
C_BOOLEAN:C305(SD_AutoAddRec; $5)

//Sel_LProc2
C_LONGINT:C283(Sel_LProc2; $2)

//Sequences_InLP
C_LONGINT:C283(Sequences_InLP; $1)

//Sources_InLP
C_LONGINT:C283(Sources_InLP; $1)

//SD2_DATASORT
C_LONGINT:C283(SD2_DataSort; $0)
C_TEXT:C284(SD2_DataSort; $1)
C_LONGINT:C283(SD2_DataSort; $2)
C_POINTER:C301(SD2_DataSort; $3)
C_BOOLEAN:C305(SD2_DataSort; $4)

//SD2_CONTROLOUTPUTDATA
C_DATE:C307(SD2_ControlOutputData; $0)

//SD2_DIARYVIEWMANAGEVIEW
C_LONGINT:C283(SD2_DiaryVIewManageView; $1)
C_TEXT:C284(SD2_DiaryVIewManageView; $2)

//SD2_DIARYVIEWMANAGESELECTION
C_BOOLEAN:C305(SD2_DiaryViewManageSelection; $1)
C_BOOLEAN:C305(SD2_DiaryViewManageSelection; $2)

//SD2_DIARYVIEWCOUNTRECORDS
C_REAL:C285(SD2_DiaryViewCountRecords; $0)

//SD2_POPUPDIARY
C_LONGINT:C283(SD2_PopUpDiary; $1)
C_DATE:C307(SD2_PopUpDiary; $2)
C_TEXT:C284(SD2_PopUpDiary; $3)
C_TEXT:C284(SD2_PopUpDiary; $4)
C_REAL:C285(SD2_PopUpDiary; $5)
C_REAL:C285(SD2_PopUpDiary; $6)
C_REAL:C285(SD2_PopUpDiary; $7)

//SD2_WORKFLOW_MOD
C_TEXT:C284(SD2_Workflow_Mod; $1)

//LBI_INSERTARRPICTURE
C_REAL:C285(LBI_InsertarrPicture; $0)
C_POINTER:C301(LBI_InsertarrPicture; $1)
C_POINTER:C301(LBI_InsertarrPicture; $2)
C_LONGINT:C283(LBI_InsertarrPicture; $3)
C_REAL:C285(LBI_InsertarrPicture; $4)

//LBI_ARRAYDEFPIC
C_LONGINT:C283(LBI_ArrayDefPic; $1)

//LBI_SETPICTURE
C_PICTURE:C286(LBI_SetPicture; $0)

//WIN_GETFORMSIZE
C_LONGINT:C283(WIN_GetFormSize; $1)
C_POINTER:C301(WIN_GetFormSize; $2)
C_TEXT:C284(WIN_GetFormSize; $3)
C_POINTER:C301(WIN_GetFormSize; $4)
C_POINTER:C301(WIN_GetFormSize; $5)
C_LONGINT:C283(WIN_GetFormSize; $6)
C_LONGINT:C283(WIN_GetFormSize; $7)
C_LONGINT:C283(WIN_GetFormSize; $8)
C_LONGINT:C283(WIN_GetFormSize; $9)

//WIN_GETAUTOSCREENSIZE
C_LONGINT:C283(WIN_GetAutoScreenSize; $1)
C_LONGINT:C283(WIN_GetAutoScreenSize; $2)
C_LONGINT:C283(WIN_GetAutoScreenSize; $3)
C_TEXT:C284(WIN_GetAutoScreenSize; $4)
C_POINTER:C301(WIN_GetAutoScreenSize; $5)
C_POINTER:C301(WIN_GetAutoScreenSize; $6)
C_REAL:C285(WIN_GetAutoScreenSize; $7)
C_REAL:C285(WIN_GetAutoScreenSize; $8)
C_REAL:C285(WIN_GetAutoScreenSize; $9)
C_REAL:C285(WIN_GetAutoScreenSize; $10)

//LBI_INSERTARR
C_POINTER:C301(LBI_InsertArr; $1)
C_POINTER:C301(LBI_InsertArr; $2)
C_LONGINT:C283(LBI_InsertArr; $3)
C_POINTER:C301(LBI_InsertArr; $4)
C_LONGINT:C283(LBI_InsertArr; $5)

//SD2_WORKFLOWSETTHREADS
C_POINTER:C301(SD2_WorkflowSetThreads; $1)
C_POINTER:C301(SD2_WorkflowSetThreads; $2)

//SD2_SETINFOVISIBLE
C_POINTER:C301(SD2_SetInfoVisible; $1)
C_POINTER:C301(SD2_SetInfoVisible; $2)

//SD2_EDITDIARYRECORD
C_TEXT:C284(SD2_EditDiaryRecord; $1)

//JC_TIMEUPDATETOTALS
C_BOOLEAN:C305(JC_TimeUpdateTotals; $0)
C_LONGINT:C283(JC_TimeUpdateTotals; $1)
C_TEXT:C284(JC_TimeUpdateTotals; $2)

//JC_TIMEUPDATEWIP
C_BOOLEAN:C305(JC_TimeUpdateWIP; $0)
C_LONGINT:C283(JC_TimeUpdateWIP; $1)
C_TEXT:C284(JC_TimeUpdateWIP; $2)

//LL_LOADFIELDNAMEPREFS
C_LONGINT:C283(LL_LoadFieldNamePrefs; $1)

//LL_SETHUMANFIELDNAME
C_TEXT:C284(LL_SetHumanFieldName; $0)
C_LONGINT:C283(LL_SetHumanFieldName; $1)
C_LONGINT:C283(LL_SetHumanFieldName; $2)
C_TEXT:C284(LL_SetHumanFieldName; $3)

//ZPROC_WITHREPLY
C_REAL:C285(ZProc_withReply; $0)
C_TEXT:C284(ZProc_withReply; $1)
C_REAL:C285(ZProc_withReply; $2)
C_TEXT:C284(ZProc_withReply; $3)
C_TEXT:C284(ZProc_withReply; $4)
C_TEXT:C284(ZProc_withReply; $5)
C_TEXT:C284(ZProc_withReply; $6)
C_TEXT:C284(ZProc_withReply; $7)
C_TEXT:C284(ZProc_withReply; $8)
C_TEXT:C284(ZProc_withReply; $9)
C_TEXT:C284(ZProc_withReply; $10)

//DYN_STEXT
C_LONGINT:C283(DYN_STEXT; $1)
C_POINTER:C301(DYN_STEXT; $2)

//SD2_OPENDIARYINFOPALLETTE
C_TEXT:C284(SD2_OpenDiaryInfoPallette; $1)
C_LONGINT:C283(SD2_OpenDiaryInfoPallette; $2)

//EXP_RECORDASXML
C_TIME:C306(EXP_RecordasXML; $1)
C_LONGINT:C283(EXP_RecordasXML; $2)
C_BOOLEAN:C305(EXP_RecordasXML; $3)
C_BOOLEAN:C305(EXP_RecordasXML; $4)
C_BOOLEAN:C305(EXP_RecordasXML; $5)
C_LONGINT:C283(EXP_RecordasXML; $6)

//EXP_ADDXMLELEMENT
C_TIME:C306(EXP_AddXMLelement; $1)
C_TEXT:C284(EXP_AddXMLelement; $2)
C_TEXT:C284(EXP_AddXMLelement; $3)
C_BOOLEAN:C305(EXP_AddXMLelement; $4)


//ZAreas_Mod
C_POINTER:C301(ZAreas_Mod; $3)
C_TEXT:C284(ZAreas_Mod; $1)
C_TEXT:C284(ZAreas_Mod; $2)




//ZBrands_Mod
C_POINTER:C301(ZBrands_Mod; $3)
C_TEXT:C284(ZBrands_Mod; $1)
C_TEXT:C284(ZBrands_Mod; $2)

//ZCalls_Mod
C_POINTER:C301(ZCalls_Mod; $0)
C_TEXT:C284(ZCalls_Mod; $1)
C_TEXT:C284(ZCalls_Mod; $2)

//ZCompanies_Mod
C_POINTER:C301(ZCompanies_Mod; $3)
C_TEXT:C284(ZCompanies_Mod; $1)
C_TEXT:C284(ZCompanies_Mod; $2)

//ZContacts_Mod
C_POINTER:C301(ZContacts_Mod; $3)
C_TEXT:C284(ZContacts_Mod; $1)
C_TEXT:C284(ZContacts_Mod; $2)

//ZContTypes_Mod
C_POINTER:C301(ZContTypes_Mod; $0)
C_TEXT:C284(ZContTypes_Mod; $1)
C_TEXT:C284(ZContTypes_Mod; $2)

//ZCountries_Mod
C_POINTER:C301(ZCountries_Mod; $0)
C_TEXT:C284(ZCountries_Mod; $1)
C_TEXT:C284(ZCountries_Mod; $2)

//ZCurrencies_Mod
C_POINTER:C301(ZCurrencies_Mod; $3)
C_TEXT:C284(ZCurrencies_Mod; $1)
C_TEXT:C284(ZCurrencies_Mod; $2)

//ZDiary_ModL
C_POINTER:C301(ZDiary_ModL; $3)
C_TEXT:C284(ZDiary_ModL; $1)
C_TEXT:C284(ZDiary_ModL; $2)


//ZInvoices_Mod
C_POINTER:C301(ZInvoices_Mod; $3)
C_TEXT:C284(ZInvoices_Mod; $1)
C_TEXT:C284(ZInvoices_Mod; $2)

//ZInvStages_Mod
C_POINTER:C301(ZInvStages_Mod; $3)
C_TEXT:C284(ZInvStages_Mod; $1)
C_TEXT:C284(ZInvStages_Mod; $2)

//ZJobPers_Mod
C_POINTER:C301(ZJobPers_Mod; $3)
C_TEXT:C284(ZJobPers_Mod; $1)
C_TEXT:C284(ZJobPers_Mod; $2)

//ZJobs_Mod
C_POINTER:C301(ZJobs_Mod; $3)
C_TEXT:C284(ZJobs_Mod; $1)
C_TEXT:C284(ZJobs_Mod; $2)


//ZJobStages_Mod
C_POINTER:C301(ZJobStages_Mod; $3)
C_TEXT:C284(ZJobStages_Mod; $1)
C_TEXT:C284(ZJobStages_Mod; $2)

//ZOrderI_Mod
C_POINTER:C301(ZOrderI_Mod; $3)
C_TEXT:C284(ZOrderI_Mod; $1)
C_TEXT:C284(ZOrderI_Mod; $2)

//ZOrders_View
C_POINTER:C301(ZOrders_View; $3)

C_TEXT:C284(ZOrders_View; $1)
C_TEXT:C284(ZOrders_View; $2)

//ZProducts_Mod
C_POINTER:C301(ZProducts_Mod; $3)
C_TEXT:C284(ZProducts_Mod; $2)

//ZProjects_Mod
C_POINTER:C301(ZProjects_Mod; $3)
C_TEXT:C284(ZProjects_Mod; $1)
C_TEXT:C284(ZProjects_Mod; $2)

//ZPurchases_Mod
C_POINTER:C301(ZPurchases_Mod; $3)
C_TEXT:C284(ZPurchases_Mod; $1)
C_TEXT:C284(ZPurchases_Mod; $2)

//ZPurchOrd_Mod
C_POINTER:C301(ZPurchOrd_Mod; $3)
C_TEXT:C284(ZPurchOrd_Mod; $1)
C_TEXT:C284(ZPurchOrd_Mod; $2)

//ZStockCurr_Mod
C_POINTER:C301(ZStockCurr_Mod; $3)
C_TEXT:C284(ZStockCurr_Mod; $1)
C_TEXT:C284(ZStockCurr_Mod; $2)



//CCM_LOADORDERAUTHS
C_BOOLEAN:C305(CCM_LoadOrderAuths; $2)












//SD2_Actions_Mod







//Here 2020
//Stages_InLP
C_LONGINT:C283(Stages_InLP; $1)

//Standing_InLP
C_REAL:C285(Standing_InLP; $1)

//StockAss_InLP
C_REAL:C285(StockAss_InLP; $1)

//StockCurr_InLP
C_REAL:C285(StockCurr_InLP; $1)

//StockI_InLP
C_REAL:C285(StockI_InLP; $1)

//StockLev_InLP
C_REAL:C285(StockLev_InLP; $1)

//Time_ProdCatIn
C_POINTER:C301(Time_ProdCatIn; $2)

//Trans_InLP
C_REAL:C285(Trans_InLP; $1)

//TransB_InLP
C_LONGINT:C283(TransB_InLP; $1)

//TransT_InLP
C_LONGINT:C283(TransT_InLP; $1)

//Types_InLP
C_REAL:C285(Types_InLP; $1)

//User_Details
C_BOOLEAN:C305(User_Details; $2)

//USER LICENCE
C_BOOLEAN:C305(User_Licence; $1)

//ZCalls_Mod
C_POINTER:C301(ZCalls_Mod; $3)

//ZContTypes_Mod
C_POINTER:C301(ZContTypes_Mod; $3)

//ZCountries_Mod
C_POINTER:C301(ZCountries_Mod; $3)

//ZOrders_Mod
C_TEXT:C284(ZOrders_Mod; $1)
C_TEXT:C284(ZOrders_Mod; $2)
C_POINTER:C301(ZOrders_Mod; $3)

//ZPROC
C_TEXT:C284(ZProc; $10)
C_TEXT:C284(ZProc; $11)

//VCDCEXPORT

//AAJUNK_4
C_BOOLEAN:C305(AAJUNK_4; $0)

//CODEC_DECODE_HEX_X

//SD2_LOADTABSETTING
C_POINTER:C301(SD2_LoadTabSetting; $7)

//INV_DEPOSITREFUND2
C_BOOLEAN:C305(INV_DepositRefund2; $4)

//INV_REFUNDSEL
C_BOOLEAN:C305(INV_RefundSel; $3)

//INV_CREATEPAYMENT
C_REAL:C285(INV_CreatePayment; $1)

//INV_ALLOCATEDEPOSIT
C_TEXT:C284(INV_AllocateDeposit; $2)
C_BOOLEAN:C305(INV_AllocateDeposit; $3)

//AAJUNK_3
C_TIME:C306(AAJunk_3; $0)
C_TEXT:C284(AAJunk_3; $1)
C_DATE:C307(AAJunk_3; $2)
C_TIME:C306(AAJunk_3; $3)
C_LONGINT:C283(AAJunk_3; $4)

//CCM_VOIDTRANSACTION
C_REAL:C285(CCM_VoidTransaction; $4)

//DOCUMENT_EMAILPDF
C_TEXT:C284(Document_EmailPDF; $3)
C_POINTER:C301(Document_EmailPDF; $4)

//PERSONNEL_PDF_LOADPREFS
C_TEXT:C284(Personnel_PDF_LoadPrefs; $1)

//PERSONNEL_PDF_SAVEPREFS
C_TEXT:C284(Personnel_PDF_SavePrefs; $1)

//LBI_EDITLISTLAY
C_BOOLEAN:C305(LBi_EditListLay; $5)

//LBI_EDITLISTUPD
C_POINTER:C301(LBi_EditListUpd; $4)

//LB_SETCOLUMNWIDTHS
C_REAL:C285(LB_SetColumnWidths; $16)
C_REAL:C285(LB_SetColumnWidths; $17)
C_REAL:C285(LB_SetColumnWidths; $18)

//LBI_ARRAYFILLT
C_TEXT:C284(LBi_ArrayFillT; $14)

//LBI_ARRDEFFILL
C_LONGINT:C283(LBi_ArrDefFill; $12)

//DOCUMENT_GETEMAILADDRESSES
C_TEXT:C284(Document_GetEmailAddresses; $4)

//SD2_GETSETFROMSERVER
C_POINTER:C301(SD2_GetSetFromServer; $15)

//SD2_DIARY_MOD
C_TEXT:C284(SD2_Diary_Mod; $2)
C_TEXT:C284(SD2_Diary_Mod; $3)

//SRCH_SETSEARCHPARAMETERS
C_LONGINT:C283(SRCH_SetSearchParameters; $2)

//SD2_DIARYVIEWMANAGEVIEW
C_BOOLEAN:C305(SD2_DiaryVIewManageView; $3)

//LBI_INSERTARR
C_TEXT:C284(LBI_InsertArr; $6)

//ZPROC_WITHREPLY
C_TEXT:C284(ZProc_withReply; $11)

//PER_LOADSMTPAUTH
C_LONGINT:C283(Per_LOADSMTPAUTH; $1)

//STRUCTUREFILEPATH
C_TEXT:C284(StructureFilePath; $1)

//SD2_GETACTIONCODESBYFORM
C_TEXT:C284(SD2_GetActionCodesbyForm; $1)
C_POINTER:C301(SD2_GetActionCodesbyForm; $2)
C_POINTER:C301(SD2_GetActionCodesbyForm; $3)

//OPENHELP
C_LONGINT:C283(OpenHelp; $1)
C_TEXT:C284(OpenHelp; $2)

//HLP_GETCONTEXTREFERENCE
C_TEXT:C284(HLP_GetContextReference; $0)
C_TEXT:C284(HLP_GetContextReference; $1)
C_TEXT:C284(HLP_GetContextReference; $2)
C_TEXT:C284(HLP_GetContextReference; $3)

//PER_SAVESMTPAUTH
C_LONGINT:C283(Per_SaveSMTPAuth; $1)
C_LONGINT:C283(Per_SaveSMTPAuth; $2)
C_LONGINT:C283(Per_SaveSMTPAuth; $3)
C_TEXT:C284(Per_SaveSMTPAuth; $4)
C_TEXT:C284(Per_SaveSMTPAuth; $5)

//JC_ADDBATCHITEMORDERITEMREL
C_LONGINT:C283(JC_AddBatchItemOrderItemRel; $1)
C_LONGINT:C283(JC_AddBatchItemOrderItemRel; $2)
C_TEXT:C284(JC_AddBatchItemOrderItemRel; $3)

//PROCESSSERVICE_ORDERITEMS
C_BOOLEAN:C305(ProcessService_OrderItems; $0)

//JC_ADDDIARYTIMEBATCHITEMREL
C_LONGINT:C283(JC_AddDiaryTimeBatchItemRel; $1)
C_LONGINT:C283(JC_AddDiaryTimeBatchItemRel; $2)
C_LONGINT:C283(JC_AddDiaryTimeBatchItemRel; $3)
C_TEXT:C284(JC_AddDiaryTimeBatchItemRel; $4)

//JC_ADDDIARYTIMEJSPRELATION
C_LONGINT:C283(JC_AddDiaryTimeJSPRelation; $1)
C_LONGINT:C283(JC_AddDiaryTimeJSPRelation; $2)

//JC_DELDIARYTIMEJSPRELATION
C_LONGINT:C283(JC_DelDiaryTimeJSPRelation; $1)
C_LONGINT:C283(JC_DelDiaryTimeJSPRelation; $2)

//JC_FINDJOBFROMJS
C_LONGINT:C283(JC_FindJobFromJS; $1)
C_TEXT:C284(JC_FindJobFromJS; $2)

//JC_FINDJOBFROMOI
C_LONGINT:C283(JC_FindJobFromOI; $1)
C_TEXT:C284(JC_FindJobFromOI; $2)

//JC_FINDJSFROMJOB
C_LONGINT:C283(JC_FindJSFromJob; $1)
C_TEXT:C284(JC_FindJSFromJob; $2)

//JC_FINDJSFROMJSP
C_LONGINT:C283(JC_FindJSFromJSP; $1)
C_TEXT:C284(JC_FindJSFromJSP; $2)
C_TEXT:C284(JC_FindJSFromJSP; $3)
C_TEXT:C284(JC_FindJSFromJSP; $4)

//JC_FINDJSFROMOI
C_LONGINT:C283(JC_FindJSFromOI; $1)
C_TEXT:C284(JC_FindJSFromOI; $2)
C_TEXT:C284(JC_FindJSFromOI; $3)
C_TEXT:C284(JC_FindJSFromOI; $4)

//JC_FINDJSPFROMJS
C_LONGINT:C283(JC_FindJSPFromJS; $1)
C_TEXT:C284(JC_FindJSPFromJS; $2)
C_TEXT:C284(JC_FindJSPFromJS; $3)
C_TEXT:C284(JC_FindJSPFromJS; $4)

//JC_FINDJSPFROMTIMEDIARY
C_LONGINT:C283(JC_FindJSPFromTimeDiary; $1)
C_TEXT:C284(JC_FindJSPFromTimeDiary; $2)
C_TEXT:C284(JC_FindJSPFromTimeDiary; $3)
C_TEXT:C284(JC_FindJSPFromTimeDiary; $4)

//JC_FINDORDERITEMSFROMJS
C_LONGINT:C283(JC_FindOrderItemsFromJS; $1)
C_TEXT:C284(JC_FindOrderItemsFromJS; $2)
C_TEXT:C284(JC_FindOrderItemsFromJS; $3)
C_TEXT:C284(JC_FindOrderItemsFromJS; $4)

//JC_FINDTIMEDIARYFROMJSP
C_LONGINT:C283(JC_FindTimeDiaryFromJSP; $1)
C_TEXT:C284(JC_FindTimeDiaryFromJSP; $2)
C_TEXT:C284(JC_FindTimeDiaryFromJSP; $3)
C_TEXT:C284(JC_FindTimeDiaryFromJSP; $4)

//JC_POSTREVERSETOWIP
C_LONGINT:C283(JC_PostReverseToWIP; $1)
C_TEXT:C284(JC_PostReverseToWIP; $2)

//JC_POSTTOWIP
C_LONGINT:C283(JC_PostToWIP; $1)
C_TEXT:C284(JC_PostToWIP; $2)

//JC_GETMARGINANDMARGINPERCENT
C_TEXT:C284(JC_GetMarginAndMarginPercent; $1)
C_TEXT:C284(JC_GetMarginAndMarginPercent; $2)
C_POINTER:C301(JC_GetMarginAndMarginPercent; $3)
C_POINTER:C301(JC_GetMarginAndMarginPercent; $4)


//HLP_MERGECONTEXTREFERENCE
C_TEXT:C284(HLP_MergeContextReference; $1)
C_BOOLEAN:C305(HLP_MergeContextReference; $2)

//SD2_ADDDIARYRECORD
C_TEXT:C284(SD2_AddDiaryRecord; $1)
C_TEXT:C284(SD2_AddDiaryRecord; $2)
C_TEXT:C284(SD2_AddDiaryRecord; $3)

//SD2_DIARYENTRY
C_TEXT:C284(SD2_DiaryEntry; $1)
C_LONGINT:C283(SD2_DiaryEntry; $2)
C_TEXT:C284(SD2_DiaryEntry; $3)
C_LONGINT:C283(SD2_DiaryEntry; $4)
C_LONGINT:C283(SD2_DiaryEntry; $5)
C_TEXT:C284(SD2_DiaryEntry; $6)
C_POINTER:C301(SD2_DiaryEntry; $7)
C_POINTER:C301(SD2_DiaryEntry; $8)
C_POINTER:C301(SD2_DiaryEntry; $9)
C_POINTER:C301(SD2_DiaryEntry; $10)
C_POINTER:C301(SD2_DiaryEntry; $11)
C_POINTER:C301(SD2_DiaryEntry; $12)
C_POINTER:C301(SD2_DiaryEntry; $13)
C_POINTER:C301(SD2_DiaryEntry; $14)

//SD2_SETINTERFACE
C_TEXT:C284(SD2_SetInterface; $1)
C_BOOLEAN:C305(SD2_SetInterface; $2)
C_REAL:C285(SD2_SetInterface; $3)

//SD2_FLOOKUPCOMPANY
C_TEXT:C284(SD2_FLookupCompany; $0)

//SD2_FLOOKUPCONTACT
C_TEXT:C284(SD2_FLookupContact; $0)

//SD2_GETMYDIARYITEMS
C_LONGINT:C283(SD2_GetMyDiaryItems; $1)
C_LONGINT:C283(SD2_GetMyDiaryItems; $2)
C_DATE:C307(SD2_GetMyDiaryItems; $3)
C_TIME:C306(SD2_GetMyDiaryItems; $4)
C_TIME:C306(SD2_GetMyDiaryItems; $5)
C_LONGINT:C283(SD2_GetMyDiaryItems; $6)
C_TIME:C306(SD2_GetMyDiaryItems; $7)

//CAL_DISPLAYPOPUP
C_LONGINT:C283(CAL_DisplayPopUp; $1)
C_LONGINT:C283(CAL_DisplayPopUp; $2)
C_LONGINT:C283(CAL_DisplayPopUp; $3)
C_LONGINT:C283(CAL_DisplayPopUp; $4)
C_TEXT:C284(CAL_DisplayPopUp; $5)

//SD2_SETDIARYTIMEFROMDURATION
C_LONGINT:C283(SD2_SetDiaryTimeFromDuration; $1)
C_POINTER:C301(SD2_SetDiaryTimeFromDuration; $2)

//SD2_CHANGEACTIONCODE
C_TEXT:C284(SD2_ChangeActionCode; $1)

//SD2_GETRELATIONSHIPNAME
C_TEXT:C284(SD2_GetRelationshipname; $0)
C_REAL:C285(SD2_GetRelationshipname; $1)
C_REAL:C285(SD2_GetRelationshipname; $2)

//SD2_GETRECORDNAME
C_TEXT:C284(SD2_GetRecordName; $0)
C_POINTER:C301(SD2_GetRecordName; $1)
C_BOOLEAN:C305(SD2_GetRecordName; $2)

//SD2_GETRECORDID
C_LONGINT:C283(SD2_GetRecordID; $0)
C_LONGINT:C283(SD2_GetRecordID; $1)
C_LONGINT:C283(SD2_GetRecordID; $2)
C_TEXT:C284(SD2_GetRecordID; $3)

//SD2_GETRECORDCODE
C_TEXT:C284(SD2_GetRecordCode; $0)
C_LONGINT:C283(SD2_GetRecordCode; $1)
C_LONGINT:C283(SD2_GetRecordCode; $2)
C_LONGINT:C283(SD2_GetRecordCode; $3)

//AA_GETCODEFIELDNUM
C_LONGINT:C283(AA_GetCodeFieldNum; $0)
C_LONGINT:C283(AA_GetCodeFieldNum; $1)

//DOCUMENT_EMAILTOKENS
C_TEXT:C284(Document_EmailTokens; $0)
C_TEXT:C284(Document_EmailTokens; $1)

//JC_ADJUSTJOBWIPCOST
C_BOOLEAN:C305(JC_AdjustJobWIPCost; $1)

//JC_ADJUSTJOBWIPTC
C_BOOLEAN:C305(JC_AdjustJobWIPTC; $1)

//JC_ADJUSTJOBWIPTIME
C_BOOLEAN:C305(JC_AdjustJobWIPTime; $1)

//JC_ADJUSTJSWIPCOST
C_BOOLEAN:C305(JC_AdjustJSWIPCost; $1)

//JC_ADJUSTJSWIPTC
C_BOOLEAN:C305(JC_AdjustJSWIPTC; $1)

//JC_ADJUSTJSWIPTIME
C_BOOLEAN:C305(JC_AdjustJSWIPTime; $1)

//JC_GETNEXTUNIQUEJOBSTAGECODE
C_TEXT:C284(JC_GetNextUniqueJobStageCode; $0)

//SD2_DIARYONEDIT
C_POINTER:C301(SD2_DiaryOnEdit; $1)

//SD2_DIARYINLPX
C_POINTER:C301(SD2_DiaryinLPX; $1)
C_BOOLEAN:C305(SD2_DiaryinLPX; $2)

//Macro_AccTypeSD2
C_POINTER:C301(Macro_AccTypeSD2; $1)
C_TEXT:C284(Macro_AccTypeSD2; $2)

//SD2_GETRELATEDDIARYITEMS
C_LONGINT:C283(SD2_GetRelatedDiaryItems; $1)
C_LONGINT:C283(SD2_GetRelatedDiaryItems; $2)
C_TEXT:C284(SD2_GetRelatedDiaryItems; $3)
C_BOOLEAN:C305(SD2_GetRelatedDiaryItems; $4)
C_BOOLEAN:C305(SD2_GetRelatedDiaryItems; $5)
C_TEXT:C284(SD2_GetRelatedDiaryItems; $6)


//JOB_LOADINFORMATIONGROUPLINKS
C_BOOLEAN:C305(JOB_LoadInformationGroupLinks; $1)
C_POINTER:C301(JOB_LoadInformationGroupLinks; $2)
C_POINTER:C301(JOB_LoadInformationGroupLinks; $3)
C_POINTER:C301(JOB_LoadInformationGroupLinks; $4)

//JOB_INFOEDIT
C_LONGINT:C283(JOB_InfoEdit; $1)
C_LONGINT:C283(JOB_InfoEdit; $2)
C_REAL:C285(JOB_InfoEdit; $3)
C_TEXT:C284(JOB_InfoEdit; $4)
C_TEXT:C284(JOB_InfoEdit; $5)
C_LONGINT:C283(JOB_InfoEdit; $6)
C_TEXT:C284(JOB_InfoEdit; $7)
C_LONGINT:C283(JOB_InfoEdit; $8)


//LBI_SETLISTBOXOPTIONS
C_POINTER:C301(LBi_SetListBoxOptions; $1)
C_POINTER:C301(LBi_SetListBoxOptions; $2)
C_POINTER:C301(LBi_SetListBoxOptions; $3)
C_BOOLEAN:C305(LBi_SetListBoxOptions; $4)

//SD2_SETDIARYPOPUP
C_POINTER:C301(SD2_SetDiaryPopup; $1)
C_POINTER:C301(SD2_SetDiaryPopup; $2)
C_POINTER:C301(SD2_SetDiaryPopup; $3)

//COM_SELECTDIARYRECORDS
C_TEXT:C284(COM_SelectDiaryRecords; $1)

//DB_VALIDATEPARAMETERS
C_BOOLEAN:C305(DB_ValidateParameters; $0)
C_TEXT:C284(DB_ValidateParameters; $1)
C_LONGINT:C283(DB_ValidateParameters; $2)
C_LONGINT:C283(DB_ValidateParameters; $3)
C_LONGINT:C283(DB_ValidateParameters; $4)

//DB_LOADVIEWPREFERENCE
C_BOOLEAN:C305(DB_LoadViewPreference; $1)

//FUR_FIELDSAVAILABLE
C_BOOLEAN:C305(FUR_FieldsAvailable; $0)
C_POINTER:C301(FUR_FieldsAvailable; $1)

//FUR_FIELDSLOAD
C_LONGINT:C283(FUR_FIELDSLOAD; $0)
C_POINTER:C301(FUR_FIELDSLOAD; $1)

//FUR_UPDATEFURTHERFIELDS
C_POINTER:C301(FUR_UpdateFurtherFields; $1)
C_POINTER:C301(FUR_UpdateFurtherFields; $2)

//FUR_FILLLISTBOXAREA
C_POINTER:C301(FUR_FillListBoxArea; $1)

//ORD_GETSUBLEVELALLOCATION
C_TEXT:C284(ORD_GetSubLevelAllocation; $1)
C_LONGINT:C283(ORD_GetSubLevelAllocation; $2)
C_LONGINT:C283(ORD_GetSubLevelAllocation; $3)

//USEINVOICEDETAILSIFPOSSIBLE
C_TEXT:C284(UseInvoiceDetailsIfPossible; $0)

//DOC_ADDEXTERNALDOCUMENT
C_POINTER:C301(DOC_AddExternalDocument; $1)
C_POINTER:C301(DOC_AddExternalDocument; $2)
C_POINTER:C301(DOC_AddExternalDocument; $3)
C_POINTER:C301(DOC_AddExternalDocument; $4)

//DOC_PICKUPDOCS
C_LONGINT:C283(DOC_PickUpDocs; $1)
C_TEXT:C284(DOC_PickUpDocs; $2)

//DOC_LAUNCHEXTERNALDOCUMENT
C_TEXT:C284(DOC_LaunchExternalDocument; $1)

//DOC_GETDOCUMENTFROMSERVER
C_TEXT:C284(DOC_GetDocumentFromServer; $0)
C_TEXT:C284(DOC_GetDocumentFromServer; $1)
C_TEXT:C284(DOC_GetDocumentFromServer; $2)

//DOC_ATTACHMENTTOBLOB
C_TEXT:C284(DOC_attachmenttoBLOB; $1)
C_TEXT:C284(DOC_attachmenttoBLOB; $2)

//LBI_GETPTRPICT
C_POINTER:C301(LBI_GetPtrPICT; $0)
C_TEXT:C284(LBI_GetPtrPICT; $1)
C_LONGINT:C283(LBI_GetPtrPICT; $2)

//SD2_HISTORYSETINFO
C_POINTER:C301(SD2_HistorySetInfo; $1)
C_POINTER:C301(SD2_HistorySetInfo; $2)
C_REAL:C285(SD2_HistorySetInfo; $3)



//CO_NEWS
C_TEXT:C284(CO_News; $1)
C_LONGINT:C283(CO_News; $2)
C_LONGINT:C283(CO_News; $3)
C_TEXT:C284(CO_News; $4)

//CON_SETSUBINFORMATION
C_TEXT:C284(CON_SetSubInformation; $1)
C_LONGINT:C283(CON_SetSubInformation; $2)
C_TEXT:C284(CON_SetSubInformation; $3)

//CON_SHOWSUBINFORMATION
C_TEXT:C284(CON_ShowSubInformation; $1)
C_LONGINT:C283(CON_ShowSubInformation; $2)
C_TEXT:C284(CON_ShowSubInformation; $3)
C_LONGINT:C283(CON_ShowSubInformation; $4)
C_LONGINT:C283(CON_ShowSubInformation; $5)
C_LONGINT:C283(CON_ShowSubInformation; $6)

//Contracts_inLPß
C_TEXT:C284(Contracts_inLPß; $1)

//CONTRACTS_ADDSUBENTITY
C_REAL:C285(Contracts_AddSubentity; $1)

//INV_ADDSUBENTITY
C_REAL:C285(INV_addSubEntity; $1)
//ORDI_LOADSUBAREA
C_REAL:C285(ORDI_LoadSubArea; $1)

//ORDERI_ADDSUBENTITY
C_REAL:C285(ORDERI_AddSubEntity; $1)
C_POINTER:C301(ORDERI_AddSubEntity; $2)


//CONT_SELECTDIARYRECORDS
C_LONGINT:C283(CONT_SelectDiaryRecords; $1)
C_TEXT:C284(CONT_SelectDiaryRecords; $2)

//INV_SELECTDIARYRECORDS
C_LONGINT:C283(INV_SelectDiaryRecords; $1)
C_TEXT:C284(INV_SelectDiaryRecords; $2)


//ORDI_SELECTDIARYRECORDS
C_LONGINT:C283(ORDI_SelectDiaryRecords; $1)
C_TEXT:C284(ORDI_SelectDiaryRecords; $2)

//ORD_SELECTDIARYRECORDS
C_LONGINT:C283(ORD_SelectDiaryRecords; $1)
C_TEXT:C284(ORD_SelectDiaryRecords; $2)

//PO_SELECTDIARYRECORDS
C_LONGINT:C283(PO_SelectDiaryRecords; $1)
C_TEXT:C284(PO_SelectDiaryRecords; $2)

//PI_SELECTDIARYRECORDS
C_LONGINT:C283(PI_SelectDiaryRecords; $1)
C_TEXT:C284(PI_SelectDiaryRecords; $2)

//PI_ADDSUBENTITY
C_REAL:C285(PI_AddSubentity; $1)

//CON_SELECTDIARYRECORDS
C_LONGINT:C283(CON_SelectDiaryRecords; $1)
C_TEXT:C284(CON_SelectDiaryRecords; $2)

//SD2_TESTEMAILRECEIVED
C_BOOLEAN:C305(SD2_TestEmailReceived; $0)
C_TEXT:C284(SD2_TestEmailReceived; $1)

//SD2_PARSEEMAILADDRESS
C_TEXT:C284(SD2_ParseEmailAddress; $1)
C_POINTER:C301(SD2_ParseEmailAddress; $2)
C_POINTER:C301(SD2_ParseEmailAddress; $3)

//SD2_GETDATEANDTIMEFROMSTRING
C_TEXT:C284(SD2_GetDateandTimeFromString; $1)
C_POINTER:C301(SD2_GetDateandTimeFromString; $2)
C_POINTER:C301(SD2_GetDateandTimeFromString; $3)

//SD2_GETMONTHNUMBERFROMNAME
C_LONGINT:C283(SD2_GetMonthNumberFromName; $0)
C_TEXT:C284(SD2_GetMonthNumberFromName; $1)

//SD2_SETDOCUMENTPATH
C_TEXT:C284(SD2_SetDocumentPath; $0)

//SD2_CREATEINCOMINGMAILRECEIPT
C_POINTER:C301(SD2_CreateIncomingMailreceipt; $1)
C_TEXT:C284(SD2_CreateIncomingMailreceipt; $2)
C_DATE:C307(SD2_CreateIncomingMailreceipt; $3)
C_TIME:C306(SD2_CreateIncomingMailreceipt; $4)
C_TEXT:C284(SD2_CreateIncomingMailreceipt; $5)

//SD2_FINDEMAILOWNER
C_TEXT:C284(SD2_FindEmailOwner; $1)
C_TEXT:C284(SD2_FindEmailOwner; $2)
C_POINTER:C301(SD2_FindEmailOwner; $3)

//ACC_BATCHTIMINGTEST
C_REAL:C285(ACC_BatchTimingTest; $0)
C_REAL:C285(ACC_BatchTimingTest; $1)
C_TEXT:C284(ACC_BatchTimingTest; $2)

//DOCUMENT_EMAILFIELDTOKENS
C_TEXT:C284(Document_EmailFieldTokens; $0)
C_TEXT:C284(Document_EmailFieldTokens; $1)

//CO_LOADWEBSEARCHPREFS
C_BOOLEAN:C305(CO_LoadWebsearchPrefs; $1)
C_LONGINT:C283(CO_LoadWebsearchPrefs; $2)
C_POINTER:C301(CO_LoadWebsearchPrefs; $3)
C_POINTER:C301(CO_LoadWebsearchPrefs; $4)

//CO_NEWSEDITSETTINGS
C_POINTER:C301(CO_NewsEditSettings; $1)
C_POINTER:C301(CO_NewsEditSettings; $2)

//CO_LOADWEBSEARCHTOKENS
C_BOOLEAN:C305(CO_LoadWebSearchtokens; $1)
C_LONGINT:C283(CO_LoadWebSearchtokens; $2)
C_POINTER:C301(CO_LoadWebSearchtokens; $3)
C_POINTER:C301(CO_LoadWebSearchtokens; $4)

//CO_NEWSAPPLYTOKENS
C_TEXT:C284(CO_NewsApplyTokens; $0)
C_TEXT:C284(CO_NewsApplyTokens; $1)

//SD2_LOADSCHEDULE
C_REAL:C285(SD2_LoadSchedule; $1)
C_REAL:C285(SD2_LoadSchedule; $2)
C_DATE:C307(SD2_LoadSchedule; $3)
C_DATE:C307(SD2_LoadSchedule; $4)
C_POINTER:C301(SD2_LoadSchedule; $5)
C_LONGINT:C283(SD2_LoadSchedule; $6)
C_LONGINT:C283(SD2_LoadSchedule; $7)
C_TEXT:C284(SD2_LoadSchedule; $8)

//SD2_LOADCURRENTSCHEDULES
C_BOOLEAN:C305(SD2_LoadCurrentSchedules; $1)

//SD2_LOADDIARYSTATI
C_POINTER:C301(SD2_LoadDiaryStati; $1)
C_POINTER:C301(SD2_LoadDiaryStati; $2)
C_POINTER:C301(SD2_LoadDiaryStati; $3)

//SD_SEARCHFORSCHEDULE
C_POINTER:C301(SD_SearchforSchedule; $1)
C_LONGINT:C283(SD_SearchforSchedule; $2)

//SD2_BUILDDIARYDISPLAYRECORDS
C_LONGINT:C283(SD2_BuildDiaryDisplayRecords; $1)
C_DATE:C307(SD2_BuildDiaryDisplayRecords; $2)
C_DATE:C307(SD2_BuildDiaryDisplayRecords; $3)

//SD2_AGENDANEWEVENTHANDLER
C_LONGINT:C283(SD2_AgendaNewEventHandler; $1)
C_LONGINT:C283(SD2_AgendaNewEventHandler; $2)
C_DATE:C307(SD2_AgendaNewEventHandler; $3)
C_TIME:C306(SD2_AgendaNewEventHandler; $4)
C_DATE:C307(SD2_AgendaNewEventHandler; $5)
C_TIME:C306(SD2_AgendaNewEventHandler; $6)
C_LONGINT:C283(SD2_AgendaNewEventHandler; $7)

//GEN_REQUESTAMOUNT
C_REAL:C285(Gen_RequestAmount; $0)
C_TEXT:C284(Gen_RequestAmount; $1)
C_LONGINT:C283(Gen_RequestAmount; $2)
C_REAL:C285(Gen_RequestAmount; $3)
C_TEXT:C284(Gen_RequestAmount; $4)
C_TEXT:C284(Gen_RequestAmount; $5)
C_LONGINT:C283(Gen_RequestAmount; $6)
C_LONGINT:C283(Gen_RequestAmount; $7)
C_TEXT:C284(Gen_RequestAmount; $8)

//SD2_MINICALBUTTONHANDLER
C_POINTER:C301(SD2_MiniCalButtonHandler; $1)

//SD2_MOVEMINCALOBJECTS
C_LONGINT:C283(SD2_MoveMinCalObjects; $1)
C_LONGINT:C283(SD2_MoveMinCalObjects; $2)
C_LONGINT:C283(SD2_MoveMinCalObjects; $3)
C_LONGINT:C283(SD2_MoveMinCalObjects; $4)

//SD_SETSCHEDDIARIES
C_TEXT:C284(SD_SetSchedDiaries; $1)
C_REAL:C285(SD_SetSchedDiaries; $2)

//SD2_ADDSCHEDULERECORD
C_TEXT:C284(SD2_AddScheduleRecord; $1)
C_DATE:C307(SD2_AddScheduleRecord; $2)
C_TIME:C306(SD2_AddScheduleRecord; $3)
C_BOOLEAN:C305(SD2_AddScheduleRecord; $4)
C_BOOLEAN:C305(SD2_AddScheduleRecord; $5)

//SD2_EDITSCHEDULEDIARY
C_REAL:C285(SD2_EditScheduleDiary; $1)
C_REAL:C285(SD2_EditScheduleDiary; $2)

//SD2_POPCALENDERSELECT
C_LONGINT:C283(SD2_PopCalenderSelect; $1)
C_REAL:C285(SD2_PopCalenderSelect; $2)
C_REAL:C285(SD2_PopCalenderSelect; $3)

//GEN_CREDITCHECKINPROCESS
C_LONGINT:C283(Gen_CreditCheckinprocess; $1)
C_TEXT:C284(Gen_CreditCheckinprocess; $2)
C_BOOLEAN:C305(Gen_CreditCheckinprocess; $3)

//GEN_CHECKFIELDTOARRAY
C_BOOLEAN:C305(Gen_CheckFieldToArray; $0)
C_POINTER:C301(Gen_CheckFieldToArray; ${-1})
C_POINTER:C301(Gen_CheckFieldToArray; $1)
C_POINTER:C301(Gen_CheckFieldToArray; $2)
C_POINTER:C301(Gen_CheckFieldToArray; $3)
C_POINTER:C301(Gen_CheckFieldToArray; $4)
C_POINTER:C301(Gen_CheckFieldToArray; $5)
C_POINTER:C301(Gen_CheckFieldToArray; $6)
C_POINTER:C301(Gen_CheckFieldToArray; $7)
C_POINTER:C301(Gen_CheckFieldToArray; $8)
C_POINTER:C301(Gen_CheckFieldToArray; $9)
C_POINTER:C301(Gen_CheckFieldToArray; $10)
C_POINTER:C301(Gen_CheckFieldToArray; $11)
C_POINTER:C301(Gen_CheckFieldToArray; $12)
C_POINTER:C301(Gen_CheckFieldToArray; $13)
C_POINTER:C301(Gen_CheckFieldToArray; $14)

//SD2_CONTACTCHOICE
C_LONGINT:C283(SD2_ContactChoice; $1)
C_LONGINT:C283(SD2_ContactChoice; $2)
C_LONGINT:C283(SD2_ContactChoice; $3)
C_LONGINT:C283(SD2_ContactChoice; $4)

//DOC_MAKELETTERFROMTEMPLATE
C_TEXT:C284(DOC_MakeLetterFromTemplate; $0)
C_TEXT:C284(DOC_MakeLetterFromTemplate; $1)
C_TEXT:C284(DOC_MakeLetterFromTemplate; $2)

//DB_TESTRECORDCODEISUNIQUE
C_LONGINT:C283(DB_TestRecordCodeisUnique; $1)

//ERROR_EXTENDEDREPORT
C_TEXT:C284(Error_ExtendedReport; $1)
C_TEXT:C284(Error_ExtendedReport; $2)
C_TEXT:C284(Error_ExtendedReport; $3)
C_REAL:C285(Error_ExtendedReport; $4)
C_TEXT:C284(Error_ExtendedReport; $5)
C_TEXT:C284(Error_ExtendedReport; $6)
C_TEXT:C284(Error_ExtendedReport; $7)

//STK_POSTTRACKER
C_TEXT:C284(STK_PostTracker; $1)

//DB_GETMODULESETTING
C_LONGINT:C283(DB_GetModuleSetting; $0)
C_TEXT:C284(DB_GetModuleSetting; $1)
C_REAL:C285(DB_GetModuleSetting; $2)

//LB_CHECKLAYOUTS
C_LONGINT:C283(LB_CheckLayouts; $1)

//PROC_SETPROCESS
C_REAL:C285(PROC_SetProcess; $1)
C_REAL:C285(PROC_SetProcess; $2)
C_REAL:C285(PROC_SetProcess; $3)
C_REAL:C285(PROC_SetProcess; $4)

//DB_LOADDISPLAY
C_LONGINT:C283(DB_LoadDisplay; $1)
C_POINTER:C301(DB_LoadDisplay; $2)
C_POINTER:C301(DB_LoadDisplay; $3)

//AA_GETTOPLEVELLISTNAMES
C_POINTER:C301(AA_GetTopLevelListNames; $1)
C_POINTER:C301(AA_GetTopLevelListNames; $2)

//AA_GETLISTITEMPROPERTIES
C_POINTER:C301(AA_GetListItemProperties; $1)
C_POINTER:C301(AA_GetListItemProperties; $2)
C_POINTER:C301(AA_GetListItemProperties; $3)

//AA_GETLISTITEMPROPERTY
C_TEXT:C284(AA_GetListItemProperty; $1)
C_POINTER:C301(AA_GetListItemProperty; $2)
C_POINTER:C301(AA_GetListItemProperty; $3)

//AA_GETLISTPROPERTIES
C_POINTER:C301(AA_GetListProperties; $1)
C_POINTER:C301(AA_GetListProperties; $2)
C_POINTER:C301(AA_GetListProperties; $3)

//AA_GETLISTPROPERTYNUM
C_LONGINT:C283(AA_GetListPropertyNUM; $0)
C_LONGINT:C283(AA_GetListPropertyNUM; $1)
C_TEXT:C284(AA_GetListPropertyNUM; $2)

//AA_SETLISTITEMPROPERTY
C_TEXT:C284(AA_SetListItemProperty; $1)
C_REAL:C285(AA_SetListItemProperty; $2)
C_TEXT:C284(AA_SetListItemProperty; $3)

//AA_SETLISTPROPERTY
C_TEXT:C284(AA_SetListProperty; $1)
C_REAL:C285(AA_SetListProperty; $2)
C_TEXT:C284(AA_SetListProperty; $3)

//AA_UPDATELISTPROPERTIES
C_BOOLEAN:C305(AA_UpdateListProperties; $1)
C_LONGINT:C283(AA_UpdateListProperties; $2)
C_LONGINT:C283(AA_UpdateListProperties; $3)

//LICENCE_AUTOUPDATECHECK
C_DATE:C307(Licence_AutoUpdateCheck; $1)
C_BOOLEAN:C305(Licence_AutoUpdateCheck; $2)

//LN_WS_REQUESTNEWLICENCE
C_BLOB:C604(LN_WS_RequestNewLicence; $0)
C_TEXT:C284(LN_WS_RequestNewLicence; $1)
C_TEXT:C284(LN_WS_RequestNewLicence; $2)
C_TEXT:C284(LN_WS_RequestNewLicence; $3)
C_TEXT:C284(LN_WS_RequestNewLicence; $4)
C_TEXT:C284(LN_WS_RequestNewLicence; $5)
C_TEXT:C284(LN_WS_RequestNewLicence; $6)

//LR_LICNONSTDATTRBNAMEVALPAIRS
C_POINTER:C301(LR_LicNonStdAttrbNameValPairs; $1)
C_POINTER:C301(LR_LicNonStdAttrbNameValPairs; $2)
C_POINTER:C301(LR_LicNonStdAttrbNameValPairs; $3)

//LR_LICENCEFILEEBLOBTOCLEARTXT
C_TEXT:C284(LR_LicenceFileEBLOBToClearTxt; $0)
C_POINTER:C301(LR_LicenceFileEBLOBToClearTxt; $1)

//LR_LICSTDATTRBNAMEVALPAIRS
C_POINTER:C301(LR_LicStdAttrbNameValPairs; $1)
C_POINTER:C301(LR_LicStdAttrbNameValPairs; $2)
C_POINTER:C301(LR_LicStdAttrbNameValPairs; $3)

//LR_MAIN
C_LONGINT:C283(LR_Main; $1)

//LR_MODNONSTDATTRBNAMEVALPAIRS
C_POINTER:C301(LR_ModNonStdAttrbNameValPairs; $1)
C_POINTER:C301(LR_ModNonStdAttrbNameValPairs; $2)
C_POINTER:C301(LR_ModNonStdAttrbNameValPairs; $3)

//LR_MODSTDATTRBNAMEVALPAIRS
C_POINTER:C301(LR_ModStdAttrbNameValPairs; $1)
C_POINTER:C301(LR_ModStdAttrbNameValPairs; $2)
C_POINTER:C301(LR_ModStdAttrbNameValPairs; $3)

//PREF_GETPREFERENCEID
C_LONGINT:C283(PREF_GetPreferenceID; $0)
C_TEXT:C284(PREF_GetPreferenceID; $1)
C_BOOLEAN:C305(PREF_GetPreferenceID; $2)

//PREF_GETPREFERENCENAME
C_TEXT:C284(PREF_GetPreferenceName; $0)
C_LONGINT:C283(PREF_GetPreferenceName; $1)

//PERSONNEL_PDF_GETPREFSELEMENT
C_REAL:C285(Personnel_PDF_GetPrefsElement; $0)
C_TEXT:C284(Personnel_PDF_GetPrefsElement; $1)

//GEN_ASKSELECTION
C_LONGINT:C283(GEN_AskSelection; $1)
C_LONGINT:C283(GEN_AskSelection; $2)
C_TEXT:C284(GEN_AskSelection; $3)
C_TEXT:C284(GEN_AskSelection; $4)
C_POINTER:C301(GEN_AskSelection; $5)
C_TEXT:C284(GEN_AskSelection; $6)
C_TEXT:C284(GEN_AskSelection; $7)
C_TEXT:C284(GEN_AskSelection; $8)

//DB_SETMODULESETTING
C_LONGINT:C283(DB_SetModuleSetting; $1)
C_LONGINT:C283(DB_SetModuleSetting; $2)

//START_DIARY
C_TEXT:C284(Start_Diary; $1)

//Diary_inLPHead_New
C_TEXT:C284(Diary_inLPHead_New; $1)

//PER_GETEMAILHOSTS
C_TEXT:C284(PER_GetEmailHosts; $1)
C_LONGINT:C283(PER_GetEmailHosts; $2)

//PER_SETEMAILHOSTS
C_TEXT:C284(PER_SetEmailHosts; $1)
C_LONGINT:C283(PER_SetEmailHosts; $2)

//DOCUMENT_EMAILMACROTOKENS
C_TEXT:C284(Document_emailMacroTokens; $0)
C_TEXT:C284(Document_emailMacroTokens; $1)

//LICENCEMODULETONUMBER
C_LONGINT:C283(LIcenceModuletoNumber; $0)
C_TEXT:C284(LIcenceModuletoNumber; $1)

//SD2_DIARYINLLPINTERFACE
C_TEXT:C284(SD2_DiaryINLLPInterface; $1)

//SD2_PERSONADDSEARCH
C_TEXT:C284(SD2_PersonAddSearch; $1)
C_POINTER:C301(SD2_PersonAddSearch; $2)
C_POINTER:C301(SD2_PersonAddSearch; $3)
C_POINTER:C301(SD2_PersonAddSearch; $4)
C_POINTER:C301(SD2_PersonAddSearch; $5)
C_POINTER:C301(SD2_PersonAddSearch; $6)

//GENVALIDATEPOINTER
C_BOOLEAN:C305(GenValidatePointer; $0)
C_POINTER:C301(GenValidatePointer; $1)

//GENFINDBYRELATION
C_LONGINT:C283(GenFindByRelation; $1)
C_POINTER:C301(GenFindByRelation; $2)
C_LONGINT:C283(GenFindByRelation; $3)
C_POINTER:C301(GenFindByRelation; $4)

//MACRO_PARSETEXT
C_TEXT:C284(Macro_ParseText; $1)
C_BOOLEAN:C305(Macro_ParseText; $2)

//MACRO_PARSELINE
C_POINTER:C301(Macro_ParseLine; $1)
C_POINTER:C301(Macro_ParseLine; $2)
C_POINTER:C301(Macro_ParseLine; $3)
C_POINTER:C301(Macro_ParseLine; $4)

//DB_LOADPASSWORDAUTOSETUP
C_BOOLEAN:C305(DB_LoadPasswordAutoSetup; $1)

//AA_LOADUSERVISIBLELISTNAMES
C_POINTER:C301(AA_LoaduserVisibleListNames; $1)
C_POINTER:C301(AA_LoaduserVisibleListNames; $2)

//UPDATE_COMPANYSOUNDEX
C_BOOLEAN:C305(Update_CompanySoundex; $1)
C_LONGINT:C283(Update_CompanySoundex; $2)
C_LONGINT:C283(Update_CompanySoundex; $3)

//MIR_GETFOLDERPATHNAME
C_TEXT:C284(MIR_GetFolderpathName; $0)
C_TEXT:C284(MIR_GetFolderpathName; $1)

//MIR_SETFOLDERPATH
C_TEXT:C284(MIR_SetFolderPath; $1)

//MIR_MIRRORPREFERENCES
C_TEXT:C284(MIR_MirrorPreferences; $1)

//MIR_BACKUPPREFERENCES
C_TEXT:C284(MIR_BackUpPreferences; $1)
C_POINTER:C301(MIR_BackUpPreferences; $2)
C_POINTER:C301(MIR_BackUpPreferences; $3)
C_POINTER:C301(MIR_BackUpPreferences; $4)
C_POINTER:C301(MIR_BackUpPreferences; $5)

//MIR_GETDATETIMESTAMP
C_TEXT:C284(MIR_GetDateTimeStamp; $0)
C_DATE:C307(MIR_GetDateTimeStamp; $1)
C_TIME:C306(MIR_GetDateTimeStamp; $2)

//MIR_MIRRORPATH
C_TEXT:C284(MIR_MirrorPath; $0)
C_TEXT:C284(MIR_MirrorPath; $1)

//MIR_MULTIPLEMIRRORSXML
C_TEXT:C284(MIR_MultipleMirrorsXML; $1)
C_TEXT:C284(MIR_MultipleMirrorsXML; $2)
C_POINTER:C301(MIR_MultipleMirrorsXML; $3)

//MIR_INTEGRATELOGFILE
C_TEXT:C284(MIR_integrateLogFile; $1)

//MIR_SENDLOGFILE
C_LONGINT:C283(MIR_SendLogFile; $0)

//MIR_SOAP_HANDLELOGEVENTS
C_LONGINT:C283(MIR_SOAP_HandleLogEvents; $0)
C_TEXT:C284(MIR_SOAP_HandleLogEvents; $1)
C_TEXT:C284(MIR_SOAP_HandleLogEvents; $2)
C_TEXT:C284(MIR_SOAP_HandleLogEvents; $3)
C_TEXT:C284(MIR_SOAP_HandleLogEvents; $4)

//MIR_SOAP_ERRORHANDLING
C_LONGINT:C283(MIR_SOAP_ErrorHandling; $1)

//MIR_ONBACKUPSTARTUP
C_LONGINT:C283(MIR_onBackupStartup; $0)

//MIR_ONSERVEROPENCONNECT
C_LONGINT:C283(MIR_OnServerOpenConnect; $0)

//MIR_ONWEBAUTHENTICATION
C_BOOLEAN:C305(MIR_onWebAuthentication; $0)

//MIR_SOAPCALLEVENTS
C_REAL:C285(MIR_SoapCallEvents; $0)
C_TEXT:C284(MIR_SoapCallEvents; $1)
C_TEXT:C284(MIR_SoapCallEvents; $2)
C_TEXT:C284(MIR_SoapCallEvents; $3)

//MIR_PROXY_SOAP_HANDLELOGEVENTS
C_LONGINT:C283(MIR_Proxy_SOAP_HandleLogEvents; $0)
C_TEXT:C284(MIR_Proxy_SOAP_HandleLogEvents; $1)
C_TEXT:C284(MIR_Proxy_SOAP_HandleLogEvents; $2)
C_TEXT:C284(MIR_Proxy_SOAP_HandleLogEvents; $3)
C_POINTER:C301(MIR_Proxy_SOAP_HandleLogEvents; $4)
C_TEXT:C284(MIR_Proxy_SOAP_HandleLogEvents; $5)

//MIR_TEXT2ARRAY
C_TEXT:C284(MIR_TEXT2ARRAY; $1)
C_POINTER:C301(MIR_TEXT2ARRAY; $2)
C_TEXT:C284(MIR_TEXT2ARRAY; $3)

//SETFONTSBYSTRINGPARAMETER
C_TEXT:C284(SetfontsbyStringparameter; ${-1})
C_LONGINT:C283(SetfontsbyStringparameter; $1)
C_TEXT:C284(SetfontsbyStringparameter; $2)
C_LONGINT:C283(SetfontsbyStringparameter; $3)
C_TEXT:C284(SetfontsbyStringparameter; $4)
C_TEXT:C284(SetfontsbyStringparameter; $5)
C_TEXT:C284(SetfontsbyStringparameter; $6)
C_TEXT:C284(SetfontsbyStringparameter; $7)
C_TEXT:C284(SetfontsbyStringparameter; $8)
C_TEXT:C284(SetfontsbyStringparameter; $9)
C_TEXT:C284(SetfontsbyStringparameter; $10)
C_TEXT:C284(SetfontsbyStringparameter; $11)

//SETFONTSBYPOINTERPARAMETER
C_POINTER:C301(SetFontsByPointerParameter; ${-1})
C_LONGINT:C283(SetFontsByPointerParameter; $1)
C_TEXT:C284(SetFontsByPointerParameter; $2)
C_LONGINT:C283(SetFontsByPointerParameter; $3)
C_POINTER:C301(SetFontsByPointerParameter; $4)
C_POINTER:C301(SetFontsByPointerParameter; $5)
C_POINTER:C301(SetFontsByPointerParameter; $6)
C_POINTER:C301(SetFontsByPointerParameter; $7)
C_POINTER:C301(SetFontsByPointerParameter; $8)
C_POINTER:C301(SetFontsByPointerParameter; $9)
C_POINTER:C301(SetFontsByPointerParameter; $10)
C_POINTER:C301(SetFontsByPointerParameter; $11)
C_POINTER:C301(SetFontsByPointerParameter; $12)
C_POINTER:C301(SetFontsByPointerParameter; $13)
C_POINTER:C301(SetFontsByPointerParameter; $14)
C_POINTER:C301(SetFontsByPointerParameter; $15)
C_POINTER:C301(SetFontsByPointerParameter; $16)
C_POINTER:C301(SetFontsByPointerParameter; $17)
C_POINTER:C301(SetFontsByPointerParameter; $18)
C_POINTER:C301(SetFontsByPointerParameter; $19)
C_POINTER:C301(SetFontsByPointerParameter; $20)
C_POINTER:C301(SetFontsByPointerParameter; $21)
C_POINTER:C301(SetFontsByPointerParameter; $22)
C_POINTER:C301(SetFontsByPointerParameter; $23)

//LR_CUSTOM
C_BOOLEAN:C305(LR_Custom; $1)

//LR_LICENCEFILEEBLOBTOARRAYS
C_POINTER:C301(LR_LicenceFileEBLOBToArrays; $1)
C_POINTER:C301(LR_LicenceFileEBLOBToArrays; $2)
C_POINTER:C301(LR_LicenceFileEBLOBToArrays; $3)
C_POINTER:C301(LR_LicenceFileEBLOBToArrays; $4)
C_POINTER:C301(LR_LicenceFileEBLOBToArrays; $5)
C_POINTER:C301(LR_LicenceFileEBLOBToArrays; $6)
C_POINTER:C301(LR_LicenceFileEBLOBToArrays; $7)
C_POINTER:C301(LR_LicenceFileEBLOBToArrays; $8)
C_POINTER:C301(LR_LicenceFileEBLOBToArrays; $9)

//GEN_CONFIRM3_WITHHIDEOPTION
C_REAL:C285(Gen_Confirm3_withHideOption; $0)
C_REAL:C285(Gen_Confirm3_withHideOption; $1)
C_TEXT:C284(Gen_Confirm3_withHideOption; $2)
C_TEXT:C284(Gen_Confirm3_withHideOption; $3)
C_TEXT:C284(Gen_Confirm3_withHideOption; $4)
C_TEXT:C284(Gen_Confirm3_withHideOption; $5)

//DB_GETVERSIONNUM
C_TEXT:C284(DB_GetVersionNum; $0)
C_TEXT:C284(DB_GetVersionNum; $1)

//SD2_DIARYEMAILSEND
C_BOOLEAN:C305(SD2_DiaryEmailSend; $0)
C_BOOLEAN:C305(SD2_DiaryEmailSend; $1)
C_BOOLEAN:C305(SD2_DiaryEmailSend; $2)
C_BOOLEAN:C305(SD2_DiaryEmailSend; $3)

//DATE_DATETIMETORFCSTRING
C_TEXT:C284(DATE_DateTimeToRFCString; $0)
C_DATE:C307(DATE_DateTimeToRFCString; $1)
C_TIME:C306(DATE_DateTimeToRFCString; $2)

//DATE_DATETIMETOSECONDS
C_LONGINT:C283(DATE_DateTimeToSeconds; $0)
C_DATE:C307(DATE_DateTimeToSeconds; $1)
C_TIME:C306(DATE_DateTimeToSeconds; $2)

//DATE_SECONDSTODATETIME
C_LONGINT:C283(DATE_SecondsToDateTime; $1)
C_POINTER:C301(DATE_SecondsToDateTime; $2)
C_POINTER:C301(DATE_SecondsToDateTime; $3)

//IME_CGISearch
C_LONGINT:C283(IME_CGISearch; $1)
C_TEXT:C284(IME_CGISearch; $2)

//IME_ReplyNoReplace
C_TEXT:C284(IME_ReplyNoReplace; $1)

//IME_WEBMESSAGESADDERROR
C_TEXT:C284(IME_WebMessagesAddError; $1)
C_TEXT:C284(IME_WebMessagesAddError; $2)

//IME_WEBMESSAGESADDWARNING
C_TEXT:C284(IME_WebMessagesAddWarning; $1)
C_TEXT:C284(IME_WebMessagesAddWarning; $2)

//IWS_GETLOCALIPADDRESS
C_TEXT:C284(IWS_GetLocalIPAddress; $0)

//STR_URLDECODE
C_TEXT:C284(STR_URLDecode; $0)
C_TEXT:C284(STR_URLDecode; $1)

//STR_URLENCODE
C_TEXT:C284(STR_URLEncode; $0)
C_TEXT:C284(STR_URLEncode; $1)

//TCP_GETPAGE
C_LONGINT:C283(TCP_GetPage; $0)
C_TEXT:C284(TCP_GetPage; $1)
C_TEXT:C284(TCP_GetPage; $2)
C_TEXT:C284(TCP_GetPage; $3)
C_POINTER:C301(TCP_GetPage; $4)
C_TEXT:C284(TCP_GetPage; $5)
C_TEXT:C284(TCP_GetPage; $6)
C_LONGINT:C283(TCP_GetPage; $7)
C_LONGINT:C283(TCP_GetPage; $8)

//THREADPOOL_GETTHREADIDS
C_POINTER:C301(ThreadPool_GetThreadIDs; $1)

//THREADPOOL_QUEUE
C_TEXT:C284(ThreadPool_Queue; $1)
C_TEXT:C284(ThreadPool_Queue; $2)

//THREADPOOL_START
C_LONGINT:C283(ThreadPool_Start; $1)
C_LONGINT:C283(ThreadPool_Start; $2)
C_TEXT:C284(ThreadPool_Start; $3)

//UTI_HEXTODECIMAL
C_LONGINT:C283(UTI_HexToDecimal; $0)
C_TEXT:C284(UTI_HexToDecimal; $1)

//UTI_MD5
C_TEXT:C284(UTI_MD5; $0)
C_TEXT:C284(UTI_MD5; $1)

//UTI_MD5BASE64
C_TEXT:C284(UTI_MD5Base64; $0)
C_TEXT:C284(UTI_MD5Base64; $1)

//BAR_t_ButtonMETHOD
C_LONGINT:C283(BAR_ButtonMethod; $1)

//BAR_DISPLAYPOPUP
C_LONGINT:C283(BAR_DisplayPopUp; $1)
C_LONGINT:C283(BAR_DisplayPopUp; $2)
C_LONGINT:C283(BAR_DisplayPopUp; $3)
C_LONGINT:C283(BAR_DisplayPopUp; $4)
C_TEXT:C284(BAR_DisplayPopUp; $5)

//MODULES_POPMENUBUILD
C_TEXT:C284(Modules_PopMenuBuild; $0)
C_TEXT:C284(Modules_PopMenuBuild; $1)

//MOD_UPDATEBUTTONSETTINGS
C_BOOLEAN:C305(MOD_UpdateButtonSettings; $1)
C_LONGINT:C283(MOD_UpdateButtonSettings; $2)
C_LONGINT:C283(MOD_UpdateButtonSettings; $3)

//ARRAY_FINDCASESENSITIVE
C_LONGINT:C283(Array_FindCaseSensitive; $0)
C_POINTER:C301(Array_FindCaseSensitive; $1)
C_TEXT:C284(Array_FindCaseSensitive; $2)
C_LONGINT:C283(Array_FindCaseSensitive; $3)

//BLOBTOPICTURE
C_PICTURE:C286(BLOBtoPicture; $0)
C_BLOB:C604(BLOBtoPicture; $1)

//IME_TEXT2HTML
C_TEXT:C284(IME_Text2HTML; $0)
C_TEXT:C284(IME_Text2HTML; $1)
C_BOOLEAN:C305(IME_Text2HTML; $2)

//IWS_IPADDRESSTOLONGINT
C_LONGINT:C283(IWS_IPAddressToLongint; $0)
C_TEXT:C284(IWS_IPAddressToLongint; $1)

//PICTURETOBLOB
C_BLOB:C604(PictureToBLOB; $0)
C_PICTURE:C286(PictureToBLOB; $1)

//STR_CASECOMPARE
C_BOOLEAN:C305(STR_CaseCompare; $0)
C_TEXT:C284(STR_CaseCompare; $1)
C_TEXT:C284(STR_CaseCompare; $2)

//STR_HTMLDECODECALLBACK
C_TEXT:C284(STR_HTMLDecodeCallback; $0)
C_TEXT:C284(STR_HTMLDecodeCallback; $1)

//STR_HTMLENCODE
C_TEXT:C284(STR_HTMLEncode; $0)
C_TEXT:C284(STR_HTMLEncode; $1)
C_LONGINT:C283(STR_HTMLEncode; $2)

//AA_DBNORMALISEFIELDNAMES
C_TEXT:C284(AA_DBNormaliseFieldNames; $0)
C_REAL:C285(AA_DBNormaliseFieldNames; $1)
C_REAL:C285(AA_DBNormaliseFieldNames; $2)

//ERRORPROCSPECIAL
C_POINTER:C301(ErrorProcSpecial; $1)
C_POINTER:C301(ErrorProcSpecial; $2)
C_POINTER:C301(ErrorProcSpecial; $3)

//ACC_GETCURRENTPERIOD
C_TEXT:C284(ACC_GetCurrentperiod; $0)

//SD2_DIARYVIEWMANAGESELECTIONNEW
C_BOOLEAN:C305(SD2_DiaryViewManageSelectionNEW; $1)
C_BOOLEAN:C305(SD2_DiaryViewManageSelectionNEW; $2)

//LB_REDUCEARRAYBASEDONLBSELECT
C_POINTER:C301(LB_ReduceArrayBasedOnLBSelect; $1)
C_POINTER:C301(LB_ReduceArrayBasedOnLBSelect; $2)
C_BOOLEAN:C305(LB_ReduceArrayBasedOnLBSelect; $3)

//SD2_CREATEDIARYEMAIL
C_BOOLEAN:C305(SD2_CreateDiaryEmail; $1)
C_TEXT:C284(SD2_CreateDiaryEmail; $2)

//PROD_GETFUNCTIONPREF
C_TEXT:C284(PROD_GetFunctionPref; $0)
C_BOOLEAN:C305(PROD_GetFunctionPref; $1)
C_TEXT:C284(PROD_GetFunctionPref; $2)
C_TEXT:C284(PROD_GetFunctionPref; $3)

//GEN_REQUESTWITHLIST
C_TEXT:C284(Gen_RequestWithList; $0)
C_TEXT:C284(Gen_RequestWithList; ${11})
C_TEXT:C284(Gen_RequestWithList; $1)
C_TEXT:C284(Gen_RequestWithList; $2)
C_TEXT:C284(Gen_RequestWithList; $3)
C_TEXT:C284(Gen_RequestWithList; $4)
C_LONGINT:C283(Gen_RequestWithList; $5)
C_LONGINT:C283(Gen_RequestWithList; $6)
C_TEXT:C284(Gen_RequestWithList; $7)
C_LONGINT:C283(Gen_RequestWithList; $8)
C_TEXT:C284(Gen_RequestWithList; $9)
C_TEXT:C284(Gen_RequestWithList; $10)

//DOC_GETCONTACTDETAILS
C_LONGINT:C283(DOC_GetContactDetails; $1)
C_LONGINT:C283(DOC_GetContactDetails; $2)
C_TEXT:C284(DOC_GetContactDetails; $3)

//PROD_CHECKIFDEFAULTFROMITEM
C_POINTER:C301(PROD_CheckIfDefaultFromItem; $1)

//SD2_PERSONADDQUERYPROCESS
C_TEXT:C284(SD2_PersonAddQueryProcess; $1)
C_TEXT:C284(SD2_PersonAddQueryProcess; $2)
C_REAL:C285(SD2_PersonAddQueryProcess; $3)

//INV_GETDEPOSITAMOUNTS
C_TEXT:C284(INV_GetDepositamounts; $1)
C_LONGINT:C283(INV_GetDepositamounts; $2)

//IWS_NTKERRORHANDLER
C_LONGINT:C283(IWS_NTKErrorHandler; $1)
C_LONGINT:C283(IWS_NTKErrorHandler; $2)
C_TEXT:C284(IWS_NTKErrorHandler; $3)

//BP_ONBACKUPSHUTDOWN
C_LONGINT:C283(BP_OnBackupShutdown; $1)

//SD_ALLOWEDITDIARYOWNERSOPTION
C_BOOLEAN:C305(SD_AllowEditDiaryOwnersOption; $1)

//SD2_EMAILBUILDRECIPIENTARRAYS
C_POINTER:C301(SD2_EmailBuildRecipientArrays; $1)
C_POINTER:C301(SD2_EmailBuildRecipientArrays; $2)

//SD2_EMAILBUILDATTACHMENTARRAYS
C_POINTER:C301(SD2_EmailBuildAttachmentArrays; $1)
C_POINTER:C301(SD2_EmailBuildAttachmentArrays; $2)

//DOC_COPYFILESUSINGOS
C_TEXT:C284(DOC_CopyFilesUsingOS; $1)
C_TEXT:C284(DOC_CopyFilesUsingOS; $2)


//PDF995_DODOCUMENT
C_TEXT:C284(PDF995_DoDocument; $1)
C_TEXT:C284(PDF995_DoDocument; $2)
C_TEXT:C284(PDF995_DoDocument; $3)
C_TEXT:C284(PDF995_DoDocument; $4)

//FILEERRORTRANSLATE
C_BOOLEAN:C305(FileErrorTranslate; $0)
C_LONGINT:C283(FileErrorTranslate; $1)
C_POINTER:C301(FileErrorTranslate; $2)

//PDF995_FILEERRORTRANSLATE
C_BOOLEAN:C305(PDF995_FileErrorTranslate; $0)
C_LONGINT:C283(PDF995_FileErrorTranslate; $1)
C_POINTER:C301(PDF995_FileErrorTranslate; $2)

//REPORTS_PREFSLOADNEW
C_TEXT:C284(Reports_PrefsLoadNEW; $1)
C_TEXT:C284(Reports_PrefsLoadNEW; $2)

//REPORTS_PREFSSAVENEW
C_TEXT:C284(Reports_PrefsSaveNEW; $1)
C_TEXT:C284(Reports_PrefsSaveNEW; $2)

//REPORTS_PREFSSETDEFAULTS
C_POINTER:C301(Reports_PrefsSetDefaults; $1)

//ERROR_EVENTTRANSLATE
C_TEXT:C284(Error_EventTranslate; $0)
C_LONGINT:C283(Error_EventTranslate; $1)

//DBP_PREPACKINGLABELS
C_TEXT:C284(DBP_PrePackingLabels; $1)

//BARCODE_CALC_CHECKSUM
C_TEXT:C284(BarCode_Calc_Checksum; $0)
C_TEXT:C284(BarCode_Calc_Checksum; $1)
C_TEXT:C284(BarCode_Calc_Checksum; $2)

//BARCODE_CREATE
C_PICTURE:C286(BarCode_Create; $0)
C_TEXT:C284(BarCode_Create; $1)
C_TEXT:C284(BarCode_Create; $2)
C_BOOLEAN:C305(BarCode_Create; $3)
C_BOOLEAN:C305(BarCode_Create; $4)
C_BOOLEAN:C305(BarCode_Create; $5)
C_LONGINT:C283(BarCode_Create; $6)
ERR_MethodTrackerReturn("Compiler_Methods"; $_t_oldMethodName)

//42012_UPDATE_SETTINGS
C_LONGINT:C283(UPD_42012_update_Settings; $1)
C_POINTER:C301(UPD_42012_update_Settings; $2)

//AA_BUILDLISTFROMDATA
C_POINTER:C301(AA_BUILDLISTFROMDATA; $3)
C_BOOLEAN:C305(AA_BUILDLISTFROMDATA; $4)

//Address_Details
C_POINTER:C301(Address_Details; $1)
C_POINTER:C301(Array_LCStart; ${-1})
C_POINTER:C301(Array_LCStart; $1)
C_POINTER:C301(Array_LCStart; $2)

//CACHE_INITIALISE
C_POINTER:C301(Cache_Initialise; $2)

//CACHE_SCPT_ACACHEDSELECTIONNAME
C_LONGINT:C283(CACHE_SCPT_aCachedSelectionNAME; $1)

//CATALOGUE_PRICES
C_LONGINT:C283(Catalogue_Prices; $1)

//CAT_CONVERTVALUE
C_DATE:C307(Cat_ConvertValue; $4)

//CAT_LOADPRODUCTS
C_LONGINT:C283(CAT_LoadProducts; $4)
C_TEXT:C284(CAT_LoadProducts; $5)

//Check_Company
C_BOOLEAN:C305(Check_Company; $6)

//Check_MinorNC
C_LONGINT:C283(Check_MinorNC; $10)
//C_LONGINT(Check_MinorNC ;$9)


//Comp_SelFBook
C_LONGINT:C283(Comp_SelFBook; $0)
C_LONGINT:C283(Comp_SelFBook; $1)

//Companies_File
C_BOOLEAN:C305(Companies_File; $0)

//Contact_Details
C_POINTER:C301(Contact_Details; $1)
C_POINTER:C301(Contact_Details; $2)

//Diary_InLPA
C_TEXT:C284(Diary_InLPA; $1)
C_BOOLEAN:C305(Diary_InLPA; $2)

//ERR_METHODTRACKER
C_TEXT:C284(ERR_MethodTracker; $3)
C_TEXT:C284(ERR_MethodTracker; $4)

//Execute_File
C_POINTER:C301(Execute_File; $2)

//Gen_PayDate
C_TEXT:C284(Gen_PayDate; $11)
C_DATE:C307(Gen_PayDate; $12)
C_DATE:C307(Gen_PayDate; $13)

//Gen_PPChkStSing
C_BOOLEAN:C305(Gen_PPChkStSing; $4)
C_POINTER:C301(Gen_PPChkStSing; $5)
C_POINTER:C301(Gen_PPChkStSing; $6)

//Gen_PPSingle
C_TEXT:C284(Gen_PPSingle; $13)
C_TEXT:C284(Gen_PPSingle; $14)

//Gen_PPSingleEmail
C_TEXT:C284(Gen_PPSingleEmail; $16)

//Gen_ZbyNo
C_LONGINT:C283(Gen_ZbyNo; $1)

//GEN_PPSINGLE_2
C_TEXT:C284(Gen_PPSingle_2; $15)
C_TEXT:C284(Gen_PPSingle_2; $16)

//GEN_TIMEDATESTAMP
C_DATE:C307(GEN_TimeDateStamp; $3)

//Invoice_TransCo
C_BOOLEAN:C305(Invoice_TransCo; $0)

//Invoices_File
C_BOOLEAN:C305(Invoices_File; $0)

//Invoices_SOADat
C_DATE:C307(Invoices_SOADat; $0)

//IN_SETMANAGER
C_POINTER:C301(In_SetManager; $1)

//Jobs_File
C_BOOLEAN:C305(Jobs_File; $0)

//Layouts_Create
C_LONGINT:C283(Layouts_Create; $0)
C_LONGINT:C283(Layouts_Create; $14)
C_LONGINT:C283(Layouts_Create; $15)

//Letters_File
C_BOOLEAN:C305(Letters_File; $0)

//LET_SELECTTEMPLATE
C_LONGINT:C283(Let_selectTemplate; $4)
C_LONGINT:C283(Let_selectTemplate; $5)

//Macro_AccType
C_BOOLEAN:C305(Macro_AccType; $4)

//MACRO_PLATFORMTRANSLATE
C_BOOLEAN:C305(Macro_PlatformTranslate; $3)

//OPEN_THERMOMETER
C_BOOLEAN:C305(OPEN_THERMOMETER; $3)

//Orders_File
C_BOOLEAN:C305(Orders_File; $0)

//Orders_InLPA
C_BOOLEAN:C305(Orders_InLPA; $1)

//Orders_InLPD
C_POINTER:C301(Orders_InLPD; $1)

//Orders_PartAppl
C_DATE:C307(Orders_PartAppl; $2)

//Orders_PPDel2
C_TEXT:C284(Orders_PPDel2; $1)
C_BOOLEAN:C305(Orders_PPDel2; $2)
C_TEXT:C284(Orders_PPDel2; $3)

//Orders_PPDelL
C_BOOLEAN:C305(Orders_PPDelL; $1)
C_TEXT:C284(Orders_PPDelL; $2)

//Orders_PPDelS2
C_TEXT:C284(Orders_PPDelS2; $1)

//Orders_PPDelSrc
C_TEXT:C284(Orders_PPDelSrc; $1)
C_DATE:C307(Orders_PPDelSrc; $2)

//PROCESSSERVICES
C_BOOLEAN:C305(ProcessServices; $0)
C_LONGINT:C283(ProcessServices; $1)

//Products_InLPD
C_REAL:C285(Products_InLPD; $1)

//PROD_PALLETTESETOBJECTS
C_BOOLEAN:C305(Prod_PalletteSetObjects; $2)

//Projects_File
C_BOOLEAN:C305(Projects_File; $0)

//Purchase_PO
C_TEXT:C284(Purchase_PO; $1)
C_POINTER:C301(Purchase_PO; $2)

//PurchOrd_PPrint
C_BOOLEAN:C305(PurchOrd_PPrint; $3)

//PW_CHANGEPW
C_LONGINT:C283(PW_CHANGEPW; $3)

//Qualities_File
C_BOOLEAN:C305(Qualities_File; $0)

//Record_Play
C_BOOLEAN:C305(Record_Play; $3)

//Reports_InSRStr
C_LONGINT:C283(Reports_InSRStr; $1)

//SEL_PREVIOUSSELECTION
C_LONGINT:C283(SEL_PreviousSelection; $1)

//States_CUArr
C_POINTER:C301(States_CUArr; $2)
C_POINTER:C301(States_CUArr; $3)

//States_Start
C_POINTER:C301(States_Start; $2)

//Stock_File
C_BOOLEAN:C305(Stock_File; $0)

//User_SREdit
C_BOOLEAN:C305(User_SREdit; $2)

//WT_SORT_TABLE_3
C_BOOLEAN:C305(WT_SORT_TABLE_3; $4)

//AAJUNK_4
C_LONGINT:C283(AAJUNK_4; $1)

//CCM_ORDERAUTHORIZE
C_LONGINT:C283(CCM_OrderAuthorize; $9)

//SM_SETUSERSEARCHPREFS
C_LONGINT:C283(Sm_SetUserSearchPrefs; $5)

//CCM_EXTRACTFIELD
C_LONGINT:C283(CCM_ExtractField; $5)
C_POINTER:C301(CCM_ExtractField; $6)

//CCM_LOADINVAUTHS
C_BOOLEAN:C305(CCM_LoadInvAuths; $2)

//SUPERREPORTTOPDF
C_BOOLEAN:C305(SuperReportToPDF; $3)

//LBI_LISTLAY
C_TEXT:C284(LBi_ListLay; $2)

//LB_SETCOLUMNWIDTHS
C_REAL:C285(LB_SetColumnWidths; $19)
C_REAL:C285(LB_SetColumnWidths; $20)
C_REAL:C285(LB_SetColumnWidths; $21)
C_REAL:C285(LB_SetColumnWidths; $22)
C_REAL:C285(LB_SetColumnWidths; $23)
C_TEXT:C284(LBi_ArrayFillT; ${3})

//SD2_CREATELINKEDDIARYTHREAD
C_LONGINT:C283(SD2_CreateLinkedDiaryThread; $0)

//Diary_Sel2
C_TEXT:C284(Diary_Sel2; $1)
C_BOOLEAN:C305(Diary_Sel2; $2)
C_BOOLEAN:C305(Diary_Sel2; $3)

//LBI_INSERTARR
C_TEXT:C284(LBI_InsertArr; $7)

//SD2_EDITDIARYRECORD
C_TEXT:C284(SD2_EditDiaryRecord; $2)
C_LONGINT:C283(SD2_EditDiaryRecord; $3)

//LB_CHECKLAYOUTS
C_LONGINT:C283(LB_CheckLayouts; $2)
C_TEXT:C284(LB_CheckLayouts; $3)

//DOC_GETCONTACTDETAILS
C_TEXT:C284(DOC_GetContactDetails; $4)
C_TEXT:C284(DOC_GetContactDetails; $5)

//DOC_COPYFILESUSINGOS
C_BOOLEAN:C305(DOC_CopyFilesUsingOS; $3)
C_BOOLEAN:C305(DOC_CopyFilesUsingOS; $4)

//REPORTS_PREFSLOADNEW
C_POINTER:C301(Reports_PrefsLoadNEW; $3)
C_BOOLEAN:C305(Reports_PrefsLoadNEW; $4)
C_LONGINT:C283(Reports_PrefsLoadNEW; $5)
C_LONGINT:C283(Reports_PrefsLoadNEW; $6)

//REPORTS_PREFSSAVENEW
C_POINTER:C301(Reports_PrefsSaveNEW; $3)
C_LONGINT:C283(Reports_PrefsSaveNEW; $4)
C_LONGINT:C283(Reports_PrefsSaveNEW; $5)

//SCPT_COMPILER
C_POINTER:C301(SCPT_Compiler; $1)

//SCPT_STRIPTRAILINGCOMMENTS
C_TEXT:C284(SCPT_StripTrailingComments; $0)
C_TEXT:C284(SCPT_StripTrailingComments; $1)

//SCPT_STRIPTRAILINGSPACES
C_TEXT:C284(SCPT_StripTrailingSPACES; $0)
C_TEXT:C284(SCPT_StripTrailingSPACES; ${5})
C_TEXT:C284(SCPT_StripTrailingSPACES; $1)
C_TEXT:C284(SCPT_StripTrailingSPACES; $2)
C_TEXT:C284(SCPT_StripTrailingSPACES; $3)
C_TEXT:C284(SCPT_StripTrailingSPACES; $4)

//SCPT_STRIPLEADINGSPACES
C_TEXT:C284(SCPT_StripLeadingSpaces; $0)
C_TEXT:C284(SCPT_StripLeadingSpaces; ${2})
C_TEXT:C284(SCPT_StripLeadingSpaces; $1)

//SCPT_EVALUATELINE
C_TEXT:C284(SCPT_EvaluateLine; $1)

//CCM_GETCARDNUMBER
C_TEXT:C284(CCM_GetCardNumber; $0)

//BC_CONVERT_PATTERN
C_TEXT:C284(BC_Convert_Pattern; $0)
C_TEXT:C284(BC_Convert_Pattern; $1)
C_TEXT:C284(BC_Convert_Pattern; $2)

//BARCODE_CONVERT_PATTERN
C_TEXT:C284(Barcode_Convert_Pattern; $0)
C_TEXT:C284(Barcode_Convert_Pattern; $1)
C_TEXT:C284(Barcode_Convert_Pattern; $2)

//BAR_PATTERNTOPICT
C_PICTURE:C286(Bar_PatternToPict; $0)
C_TEXT:C284(Bar_PatternToPict; $1)
C_TEXT:C284(Bar_PatternToPict; $2)
C_TEXT:C284(Bar_PatternToPict; $3)
C_LONGINT:C283(Bar_PatternToPict; $4)

//CALC_CHECKSUM_CODE128
C_TEXT:C284(Calc_Checksum_Code128; $0)
C_TEXT:C284(Calc_Checksum_Code128; $1)
C_TEXT:C284(Calc_Checksum_Code128; $2)

//CALC_CHECKSUM_CODE39
C_TEXT:C284(Calc_Checksum_Code39; $0)
C_TEXT:C284(Calc_Checksum_Code39; $1)

//CALC_CHECKSUM_EAN13
C_TEXT:C284(Calc_Checksum_EAN13; $0)
C_TEXT:C284(Calc_Checksum_EAN13; $1)

//CALC_CHECKSUM_INDUSTRIAL
C_TEXT:C284(Calc_Checksum_Industrial; $0)
C_TEXT:C284(Calc_Checksum_Industrial; $1)
C_TEXT:C284(Calc_Checksum_Industrial; $2)

//CALC_CHECKSUM_UPCA
C_TEXT:C284(Calc_Checksum_UPCA; $0)
C_TEXT:C284(Calc_Checksum_UPCA; $1)

//CALC_CHECKSUM_UPCE
C_TEXT:C284(Calc_Checksum_UPCE; $0)
C_TEXT:C284(Calc_Checksum_UPCE; $1)
C_TEXT:C284(Calc_Checksum_UPCE; $2)

//CONVERT_CODE128_PATTERN
C_TEXT:C284(Convert_Code128_Pattern; $0)
C_TEXT:C284(Convert_Code128_Pattern; $1)
C_TEXT:C284(Convert_Code128_Pattern; $2)

//CONVERT_CODE39_PATTERN
C_TEXT:C284(Convert_Code39_Pattern; $0)
C_TEXT:C284(Convert_Code39_Pattern; $1)

//CONVERT_EAN13_PATTERN
C_TEXT:C284(Convert_EAN13_Pattern; $0)
C_TEXT:C284(Convert_EAN13_Pattern; $1)

//CONVERT_EAN8_PATTERN
C_TEXT:C284(Convert_EAN8_Pattern; $0)
C_TEXT:C284(Convert_EAN8_Pattern; $1)

//CONVERT_INDUSTRIAL25_PATTERN
C_TEXT:C284(Convert_Industrial25_Pattern; $0)
C_TEXT:C284(Convert_Industrial25_Pattern; $1)

//CONVERT_INTERLEAVED25_PATTERN
C_TEXT:C284(Convert_Interleaved25_Pattern; $0)
C_TEXT:C284(Convert_Interleaved25_Pattern; $1)

//CONVERT_SUPPLEMENTAL2_PATTERN
C_TEXT:C284(Convert_Supplemental2_Pattern; $0)
C_TEXT:C284(Convert_Supplemental2_Pattern; $1)

//CONVERT_SUPPLEMENTAL5_PATTERN
C_TEXT:C284(Convert_Supplemental5_Pattern; $0)
C_TEXT:C284(Convert_Supplemental5_Pattern; $1)

//CONVERT_UPCA_PATTERN
C_TEXT:C284(Convert_UPCA_Pattern; $0)
C_TEXT:C284(Convert_UPCA_Pattern; $1)

//CONVERT_UPCE_PATTERN
C_TEXT:C284(Convert_UPCE_Pattern; $0)
C_TEXT:C284(Convert_UPCE_Pattern; $1)

//SET_BARCODE_PATTERN
C_LONGINT:C283(Set_Barcode_Pattern; $1)
C_TEXT:C284(Set_Barcode_Pattern; $2)
C_LONGINT:C283(Set_Barcode_Pattern; $3)

//CONTEXTS_GETID
C_LONGINT:C283(CONTEXTS_GETID; $0)
C_TEXT:C284(CONTEXTS_GETID; $1)
C_REAL:C285(CONTEXTS_GETID; $2)
C_TEXT:C284(CONTEXTS_GETID; $3)

//Sel_SSUB
C_POINTER:C301(Sel_SSUB; $1)
C_POINTER:C301(Sel_SSUB; $2)
C_TEXT:C284(Sel_SSUB; $3)
C_POINTER:C301(Sel_SSUB; $4)
C_POINTER:C301(Sel_SSUB; $5)

//DB_GETMODULESETTINGBYNUM
C_REAL:C285(DB_GetModuleSettingByNUM; $0)
C_LONGINT:C283(DB_GetModuleSettingByNUM; $1)

//CHECKMODBYNUMBER
C_LONGINT:C283(CheckModBynumber; $1)
C_TEXT:C284(CheckModBynumber; $2)

//DB_UNITTEXTCONFIRMATION
C_TEXT:C284(DB_UnitTextConfirmation; $1)
C_TEXT:C284(DB_UnitTextConfirmation; $2)

//CCM_LOADSERVICEPROVIDERSV11
C_BOOLEAN:C305(CCM_LoadServiceProvidersV11; $1)

//CCM_DISPLAYACTIVITYAN
C_TEXT:C284(CCM_DisplayActivityAN; $1)

//CCM_DISPLAYACTIVITYTRANSAX
C_TEXT:C284(CCM_DisplayActivityTransax; $1)

//CCM_TRANSAXSUBMIT
C_TEXT:C284(CCM_transaxsubmit; $0)
C_TEXT:C284(CCM_transaxsubmit; $1)
C_TEXT:C284(CCM_transaxsubmit; $2)
C_TEXT:C284(CCM_transaxsubmit; $3)
C_REAL:C285(CCM_transaxsubmit; $4)
C_TEXT:C284(CCM_transaxsubmit; $5)
C_TEXT:C284(CCM_transaxsubmit; $6)
C_TEXT:C284(CCM_transaxsubmit; $7)
C_TEXT:C284(CCM_transaxsubmit; $8)
C_TEXT:C284(CCM_transaxsubmit; $9)
C_TEXT:C284(CCM_transaxsubmit; $10)
C_TEXT:C284(CCM_transaxsubmit; $11)
C_TEXT:C284(CCM_transaxsubmit; $12)
C_TEXT:C284(CCM_transaxsubmit; $13)
C_TEXT:C284(CCM_transaxsubmit; $14)
C_TEXT:C284(CCM_transaxsubmit; $15)
C_TEXT:C284(CCM_transaxsubmit; $16)
C_TEXT:C284(CCM_transaxsubmit; $17)
C_TEXT:C284(CCM_transaxsubmit; $18)

//SF_DASHBOARD_FORMHANDLER
C_REAL:C285(SF_DASHBOARD_FormHandler; $1)

//CCM_GETTRANSAXFIELD
C_TEXT:C284(CCM_GetTransaxField; $0)
C_POINTER:C301(CCM_GetTransaxField; $1)
C_LONGINT:C283(CCM_GetTransaxField; $2)
C_TEXT:C284(CCM_GetTransaxField; $3)
C_POINTER:C301(CCM_GetTransaxField; $4)
C_POINTER:C301(CCM_GetTransaxField; $5)

//CCM_AUTHORIZENETSUBMIT
C_LONGINT:C283(CCM_AuthorizeNetSubmit; $0)
C_LONGINT:C283(CCM_AuthorizeNetSubmit; $1)
C_POINTER:C301(CCM_AuthorizeNetSubmit; $2)

//CCM_TEST
C_TEXT:C284(CCM_TEST; $1)
C_TEXT:C284(CCM_TEST; $2)
C_TEXT:C284(CCM_TEST; $3)
C_REAL:C285(CCM_TEST; $4)
C_TEXT:C284(CCM_TEST; $5)
C_TEXT:C284(CCM_TEST; $6)
C_TEXT:C284(CCM_TEST; $7)
C_TEXT:C284(CCM_TEST; $8)
C_REAL:C285(CCM_TEST; $9)
C_TEXT:C284(CCM_TEST; $10)
C_TEXT:C284(CCM_TEST; $11)
C_TEXT:C284(CCM_TEST; $12)
C_TEXT:C284(CCM_TEST; $13)
C_TEXT:C284(CCM_TEST; $14)
C_TEXT:C284(CCM_TEST; $15)
C_TEXT:C284(CCM_TEST; $16)
C_TEXT:C284(CCM_TEST; $17)

//CCM_ENCODEURL
C_TEXT:C284(CCM_EncodeURL; $0)
C_TEXT:C284(CCM_EncodeURL; $1)

//CCM_CURL
C_TEXT:C284(CCM_Curl; $0)
C_TEXT:C284(CCM_Curl; $1)
C_POINTER:C301(CCM_Curl; $2)
C_TEXT:C284(CCM_Curl; $3)
C_TEXT:C284(CCM_Curl; $4)
C_TEXT:C284(CCM_Curl; $5)
C_TEXT:C284(CCM_Curl; $6)
C_LONGINT:C283(CCM_Curl; $7)
C_BOOLEAN:C305(CCM_Curl; $8)

//SD2_SVGHANDLER
C_TEXT:C284(SD2_SVGHandler; $1)
C_DATE:C307(SD2_SVGHandler; $2)

//SD_ISALEAPYEAR
C_BOOLEAN:C305(SD_IsaLeapyear; $0)
C_DATE:C307(SD_IsaLeapyear; $1)

//DB_GET_DESIGNER
C_TEXT:C284(DB_Get_Designer; $1)

//SVS_SETFIELDPOSITIONS
C_BOOLEAN:C305(SVS_SetFieldPositions; $1)
C_REAL:C285(SVS_SetFieldPositions; $2)

//SVS_SETRESOLVED
C_BOOLEAN:C305(SVS_SetResolved; $0)
C_TEXT:C284(SVS_SetResolved; $1)

//SVS_LOADPREFERENCES
C_BOOLEAN:C305(SVS_LoadPreferences; $1)

//CAT_CREATEMACROSEARCH
C_TEXT:C284(CAT_CreateMacroSearch; $0)

//CHECK_PURCHASEORDER
C_POINTER:C301(Check_Purchaseorder; $1)
C_POINTER:C301(Check_Purchaseorder; $2)

//CHECK_SALESORDER
C_POINTER:C301(Check_SalesOrder; $1)
C_POINTER:C301(Check_SalesOrder; $2)
C_BOOLEAN:C305(Check_SalesOrder; $3)
C_POINTER:C301(Check_SalesOrder; $4)

//COMP_SEL_2009
C_TEXT:C284(COMP_SEL_2009; $1)
C_BOOLEAN:C305(COMP_SEL_2009; $2)

//COMPANIES_SAVEDOCOPTIONS
C_BOOLEAN:C305(Companies_SaveDocOptions; $1)

//SRCH_RESETUNFILTEREDSELECTION
C_POINTER:C301(Srch_resetUnfilteredSelection; $1)

//COMPANIES_DISPLAYDOCOPTIONS
C_BOOLEAN:C305(Companies_DisplayDocOptions; $1)

//COMP_RENUMCOMPSUP
C_TEXT:C284(Comp_RenumCompSup; $1)
C_TEXT:C284(Comp_RenumCompSup; $2)

//STK_GETMOVEMENTTYPES
C_TEXT:C284(STK_GetMovementTypes; $0)
C_TEXT:C284(STK_GetMovementTypes; $1)
C_BOOLEAN:C305(STK_GetMovementTypes; $2)
C_TEXT:C284(STK_GetMovementTypes; $3)
C_BOOLEAN:C305(STK_GetMovementTypes; $4)

//STK_GETCOPYFROMTHREADS
C_REAL:C285(STK_GetCopyFromThreads; $1)
C_TEXT:C284(STK_GetCopyFromThreads; $2)
C_REAL:C285(STK_GetCopyFromThreads; $3)
C_TEXT:C284(STK_GetCopyFromThreads; $4)
C_TEXT:C284(STK_GetCopyFromThreads; $5)
C_TEXT:C284(STK_GetCopyFromThreads; $6)
C_REAL:C285(STK_GetCopyFromThreads; $7)
C_REAL:C285(STK_GetCopyFromThreads; $8)
C_TEXT:C284(STK_GetCopyFromThreads; $9)
C_REAL:C285(STK_GetCopyFromThreads; $10)
C_REAL:C285(STK_GetCopyFromThreads; $11)
C_TEXT:C284(STK_GetCopyFromThreads; $12)
C_TEXT:C284(STK_GetCopyFromThreads; $13)
C_TEXT:C284(STK_GetCopyFromThreads; $14)
C_REAL:C285(STK_GetCopyFromThreads; $15)

//LOG_TEXT
C_BOOLEAN:C305(LOG_text; $0)
C_TEXT:C284(LOG_text; $1)
C_TEXT:C284(LOG_text; $2)

//GENWORDSINGLE
C_TEXT:C284(GenWordSingle; $0)
C_TEXT:C284(GenWordSingle; $1)

//IWS_NTKERROREMAIL
C_TEXT:C284(IWS_NTKErrorEmail; $1)

//LAY_CREATEARRAYBASED
C_REAL:C285(LAY_CreateArrayBased; $0)
C_TEXT:C284(LAY_CreateArrayBased; $1)
C_TEXT:C284(LAY_CreateArrayBased; $2)
C_TEXT:C284(LAY_CreateArrayBased; $3)
C_TEXT:C284(LAY_CreateArrayBased; $4)
C_LONGINT:C283(LAY_CreateArrayBased; $5)
C_LONGINT:C283(LAY_CreateArrayBased; $6)
C_BOOLEAN:C305(LAY_CreateArrayBased; $7)
C_BOOLEAN:C305(LAY_CreateArrayBased; $8)
C_TEXT:C284(LAY_CreateArrayBased; $9)
C_LONGINT:C283(LAY_CreateArrayBased; $10)
C_TEXT:C284(LAY_CreateArrayBased; $11)
C_LONGINT:C283(LAY_CreateArrayBased; $12)

//LBI_LOADARRAYSETUP
C_POINTER:C301(LBI_LoadArraySetup; $1)
C_TEXT:C284(LBI_LoadArraySetup; $2)
C_LONGINT:C283(LBI_LoadArraySetup; $3)

//OPEN_AUTOTHERM
C_TEXT:C284(OPEN_AUTOTHERM; $1)
C_LONGINT:C283(OPEN_AUTOTHERM; $2)
C_BOOLEAN:C305(OPEN_AUTOTHERM; $3)
C_BOOLEAN:C305(OPEN_AUTOTHERM; $4)

//STK_ENTERSTOCKMOVEMENT
C_REAL:C285(STK_EnterStockMovement; $1)
C_BOOLEAN:C305(STK_EnterStockMovement; $2)
C_REAL:C285(STK_EnterStockMovement; $3)
C_TEXT:C284(STK_EnterStockMovement; $4)
C_REAL:C285(STK_EnterStockMovement; $5)

//ORDERS_PPDEL5_2009
C_DATE:C307(Orders_PPDel5_2009; $1)
C_POINTER:C301(Orders_PPDel5_2009; $2)
C_POINTER:C301(Orders_PPDel5_2009; $3)

//SET_AUTOTHERM
C_TEXT:C284(SET_AUTOTHERM; $1)
C_LONGINT:C283(SET_AUTOTHERM; $2)
C_LONGINT:C283(SET_AUTOTHERM; $3)

//STK_ORDERITEMSDELIVER
C_BOOLEAN:C305(STK_OrderItemsDeliver; $1)

//REPORTS_PREFSGET
C_POINTER:C301(Reports_PrefsGet; $1)
C_POINTER:C301(Reports_PrefsGet; $2)
C_TEXT:C284(Reports_PrefsGet; $3)
C_TEXT:C284(Reports_PrefsGet; $4)

//SVS_GETSTATENAME
C_TEXT:C284(SVS_GetStateName; $0)
C_POINTER:C301(SVS_GetStateName; $1)
C_BOOLEAN:C305(SVS_GetStateName; $2)

//REPORTSIN_PREFSSETDEFAULTS
C_POINTER:C301(ReportsIn_PrefsSetDefaults; $1)

//Orders_Sel2
C_TEXT:C284(Orders_Sel2; $1)

//PRD_CONTEXTS
C_BOOLEAN:C305(PRD_Contexts; $1)
C_BOOLEAN:C305(PRD_Contexts; $2)

//PRD_INONLOADRELATED
C_TEXT:C284(PRD_inonloadrelated; $1)

//STK_GETACTIVETHREADS
C_REAL:C285(STK_GetActiveThreads; $1)
C_TEXT:C284(STK_GetActiveThreads; $2)
C_REAL:C285(STK_GetActiveThreads; $3)
C_TEXT:C284(STK_GetActiveThreads; $4)
C_TEXT:C284(STK_GetActiveThreads; $5)
C_TEXT:C284(STK_GetActiveThreads; $6)
C_REAL:C285(STK_GetActiveThreads; $7)
C_REAL:C285(STK_GetActiveThreads; $8)
C_TEXT:C284(STK_GetActiveThreads; $9)
C_REAL:C285(STK_GetActiveThreads; $10)
C_REAL:C285(STK_GetActiveThreads; $11)
C_TEXT:C284(STK_GetActiveThreads; $12)
C_TEXT:C284(STK_GetActiveThreads; $13)
C_TEXT:C284(STK_GetActiveThreads; $14)
C_POINTER:C301(STK_GetActiveThreads; $15)

//PriceTable_inLPX
C_POINTER:C301(PriceTable_inLPX; $1)

//DB_SET_DESIGNER
C_TEXT:C284(DB_set_Designer; $1)

//ProdPriceTable_inLPX
C_POINTER:C301(ProdPriceTable_inLPX; $1)

//PROD_LBI_PRICETABLE
C_BOOLEAN:C305(PROD_LBI_Pricetable; $0)

//REPORTSIN_PREFSLOADNEW
C_TEXT:C284(ReportsIn_PrefsLoadNew; $1)
C_TEXT:C284(ReportsIn_PrefsLoadNew; $2)

//SERVICESETTABLESTATE
C_TEXT:C284(servicesettablestate; $0)
C_LONGINT:C283(servicesettablestate; $1)
C_TEXT:C284(servicesettablestate; $2)

//SRCH_APPLYFILTERSTOSELECTION
C_POINTER:C301(SRCH_Applyfilterstoselection; $1)

//SRCH_LOADSEARCHFILTERS
C_LONGINT:C283(SRCH_loadSearchFilters; $1)

//SRCH_LOADASEARCHPARAMETERS
C_POINTER:C301(SRCH_loadaSearchparameters; $1)

//SVS_STATEDOWN
C_POINTER:C301(SVS_StateDown; $1)
C_POINTER:C301(SVS_StateDown; $2)
C_POINTER:C301(SVS_StateDown; $3)

//WS_NTKERROREMAIL
C_TEXT:C284(WS_NTKErrorEmail; $1)

//STK_GETFREESTOCKMOVEMENTTYPES
C_POINTER:C301(STK_GetFreeStockMovementtypes; $1)

//STK_PRODUCTSARRAY
C_POINTER:C301(STK_ProductsArray; $1)
C_TEXT:C284(STK_ProductsArray; $2)
C_TEXT:C284(STK_ProductsArray; $3)

//STK_SOSETINFO
C_POINTER:C301(STK_SOSetInfo; $1)

//STK_BREAKDOWNSTOCK
C_REAL:C285(STK_BreakDownStock; $1)
C_POINTER:C301(STK_BreakDownStock; $2)
C_REAL:C285(STK_BreakDownStock; $3)
C_POINTER:C301(STK_BreakDownStock; $4)
C_POINTER:C301(STK_BreakDownStock; $5)
C_POINTER:C301(STK_BreakDownStock; $6)
C_POINTER:C301(STK_BreakDownStock; $7)
C_POINTER:C301(STK_BreakDownStock; $8)
C_POINTER:C301(STK_BreakDownStock; $9)
C_POINTER:C301(STK_BreakDownStock; $10)
C_POINTER:C301(STK_BreakDownStock; $11)
C_POINTER:C301(STK_BreakDownStock; $12)
C_POINTER:C301(STK_BreakDownStock; $13)
C_POINTER:C301(STK_BreakDownStock; $14)
C_POINTER:C301(STK_BreakDownStock; $15)
C_POINTER:C301(STK_BreakDownStock; $16)
C_POINTER:C301(STK_BreakDownStock; $17)
C_POINTER:C301(STK_BreakDownStock; $18)
C_POINTER:C301(STK_BreakDownStock; $19)

//SRCH_LOADSEARCHPARAMETERS
C_POINTER:C301(SRCH_LoadSearchParameters; $1)

//STK_FILLHISTORYBYTYPE
C_REAL:C285(STK_FillHistoryBytype; $1)
C_REAL:C285(STK_FillHistoryBytype; $2)
C_REAL:C285(STK_FillHistoryBytype; $3)

//STK_ORDERSPRINTDELADDSERIAL
C_BOOLEAN:C305(STK_OrdersPrintDelAddSerial; $0)

//SERVICESTATEUP
C_POINTER:C301(ServiceStateUp; $1)
C_POINTER:C301(ServiceStateUp; $2)
C_POINTER:C301(ServiceStateUp; $3)

//DOCTYPEFROMNAME
C_TEXT:C284(DocTypeFromName; $0)
C_TEXT:C284(DocTypeFromName; $1)

//DB_GETKEYFIELD
C_POINTER:C301(DB_GetKeyField; $0)
C_POINTER:C301(DB_GetKeyField; $1)

//DB_SELECTUSERLOGIN
C_REAL:C285(DB_selectUserLogin; $1)

//DB_LOADDISPLAYPREF
C_TEXT:C284(DB_LoadDisplayPref; $0)
C_LONGINT:C283(DB_LoadDisplayPref; $1)
C_TEXT:C284(DB_LoadDisplayPref; $2)
C_TEXT:C284(DB_LoadDisplayPref; $3)
C_BOOLEAN:C305(DB_LoadDisplayPref; $4)
C_TEXT:C284(DB_LoadDisplayPref; $5)

//NTK_STRINGFINDBETWEEN
C_TEXT:C284(NTK_StringFindBetween; $0)
C_TEXT:C284(NTK_StringFindBetween; $1)
C_TEXT:C284(NTK_StringFindBetween; $2)
C_TEXT:C284(NTK_StringFindBetween; $3)

//NTK_HTTP_SETURL
C_TEXT:C284(NTK_HTTP_SETURL; $1)

//NTK_HTTP_SETDATA
C_POINTER:C301(NTK_HTTP_SetData; $1)

//NTK_SETTIMEOUT
C_LONGINT:C283(NTK_SetTimeOut; $1)

//NTK_NEWREQUEST
C_BOOLEAN:C305(NTK_NewRequest; $0)
C_TEXT:C284(NTK_NewRequest; $1)

//NTK_HTTP_ADDPARAMETER
C_TEXT:C284(NTK_HTTP_Addparameter; $1)
C_TEXT:C284(NTK_HTTP_Addparameter; $2)
C_POINTER:C301(NTK_HTTP_Addparameter; $3)

//NTK_SENDREQUEST
C_LONGINT:C283(NTK_SendRequest; $0)
C_TEXT:C284(NTK_SendRequest; $1)
C_POINTER:C301(NTK_SendRequest; $2)
C_POINTER:C301(NTK_SendRequest; $3)

//NTK_HTTP_POST
C_LONGINT:C283(NTK_HTTP_POST; $0)
C_POINTER:C301(NTK_HTTP_POST; $1)
C_POINTER:C301(NTK_HTTP_POST; $2)

//CCM_AN_INITIATE
C_LONGINT:C283(CCM_AN_Initiate; $0)


C_TEXT:C284(CCM_AN_INSERTDATA; ${-1})
C_LONGINT:C283(CCM_AN_INSERTDATA; $1)
C_TEXT:C284(CCM_AN_INSERTDATA; $2)
C_TEXT:C284(CCM_AN_INSERTDATA; $3)
C_TEXT:C284(CCM_AN_INSERTDATA; $4)
C_TEXT:C284(CCM_AN_INSERTDATA; $5)
C_TEXT:C284(CCM_AN_INSERTDATA; $6)
C_TEXT:C284(CCM_AN_INSERTDATA; $7)
C_TEXT:C284(CCM_AN_INSERTDATA; $8)
C_TEXT:C284(CCM_AN_INSERTDATA; $9)
C_TEXT:C284(CCM_AN_INSERTDATA; $10)
C_TEXT:C284(CCM_AN_INSERTDATA; $11)
C_TEXT:C284(CCM_AN_INSERTDATA; $12)
C_TEXT:C284(CCM_AN_INSERTDATA; $13)

//CCM_BC_INITIATE
C_LONGINT:C283(CCM_BC_initiate; $0)

//CAL4D_CAL_GETFULLCALENDAR
C_POINTER:C301(Cal4D_Cal_GetFullCalendar; $1)
C_DATE:C307(Cal4D_Cal_GetFullCalendar; $2)
C_DATE:C307(Cal4D_Cal_GetFullCalendar; $3)
C_POINTER:C301(Cal4D_Cal_GetFullCalendar; $4)

//CAL4D_CAL_GETEVENTSFORONEDAY
C_DATE:C307(Cal4D_Cal_GetEventsForOneDay; $1)

//CAL4D_CAL_SELECTEDDATE
C_DATE:C307(Cal4D_Cal_SelectedDate; $0)
C_DATE:C307(Cal4D_Cal_SelectedDate; $1)

//CAL4D_CAL_DATETOORDINAL
C_LONGINT:C283(Cal4D_Cal_DateToOrdinal; $0)
C_DATE:C307(Cal4D_Cal_DateToOrdinal; $1)

//CAL4D_CAL_ISLEAPYEAR
C_BOOLEAN:C305(SD_YearisLeapYear; $0)
C_DATE:C307(SD_YearisLeapYear; $1)

//CAL4D_CAL_WEEKSTODISPLAY
C_LONGINT:C283(Cal4D_Cal_WeeksToDisplay; $0)
C_DATE:C307(Cal4D_Cal_WeeksToDisplay; $1)
C_TEXT:C284(Cal4D_Cal_WeeksToDisplay; $2)

//CAL4D_CAL_MONTHOFDAYS
C_DATE:C307(Cal4D_Cal_MonthOfDays; $1)
C_POINTER:C301(Cal4D_Cal_MonthOfDays; $2)
C_POINTER:C301(Cal4D_Cal_MonthOfDays; $3)
C_POINTER:C301(Cal4D_Cal_MonthOfDays; $4)
C_TEXT:C284(Cal4D_Cal_MonthOfDays; $5)

//CAL4D_CAL_CELL_BG
C_TEXT:C284(Cal4D_Cal_Cell_BG; $0)
C_TEXT:C284(Cal4D_Cal_Cell_BG; $1)

//CAL4D_CAL_GETMINICALENDAR
C_POINTER:C301(Cal4D_Cal_GetMiniCalendar; $1)
C_DATE:C307(Cal4D_Cal_GetMiniCalendar; $2)
C_LONGINT:C283(Cal4D_Cal_GetMiniCalendar; $3)
C_POINTER:C301(Cal4D_Cal_GetMiniCalendar; $4)
C_POINTER:C301(Cal4D_Cal_GetMiniCalendar; $5)

//CAL4D_ICAL_GETTIMEZONE
C_TEXT:C284(Cal4D_iCal_GetTimezone; $0)

//CAL4D_TIMEZONE_LOADFROMDISK
C_TEXT:C284(Cal4D_TimeZone_LoadFromDisk; $1)

//SD_GETOWNERDIARYIDBYNAMES
C_POINTER:C301(SD_GetOwnerDiaryIDbyNames; $0)
C_TEXT:C284(SD_GetOwnerDiaryIDbyNames; ${1})
C_TEXT:C284(SD_GetOwnerDiaryIDbyNames; $1)

//SD_GETOWNERDIARYIDBYINITIALS
C_POINTER:C301(SD_GetOwnerDiaryIDbyInitials; $0)
C_TEXT:C284(SD_GetOwnerDiaryIDbyInitials; ${2})
C_TEXT:C284(SD_GetOwnerDiaryIDbyInitials; $1)

//SD_GETOWNERDIARYIDBYID
C_POINTER:C301(SD_GetOwnerDiaryIDbyID; $0)
C_LONGINT:C283(SD_GetOwnerDiaryIDbyID; ${2})
C_LONGINT:C283(SD_GetOwnerDiaryIDbyID; $1)

//SD_GETDIARYDATERANGE
C_POINTER:C301(SD_GetDiaryDateRange; $0)
C_DATE:C307(SD_GetDiaryDateRange; $1)
C_DATE:C307(SD_GetDiaryDateRange; $2)

//SD_GETDIARYDATESBYCOUNT
C_POINTER:C301(SD_GetDiaryDatesByCount; $0)
C_DATE:C307(SD_GetDiaryDatesByCount; $1)
C_LONGINT:C283(SD_GetDiaryDatesByCount; $2)

//SD_GETDIARYACTIONSRANGE
C_POINTER:C301(SD_GetDiaryActionsRange; $0)
C_TEXT:C284(SD_GetDiaryActionsRange; ${2})
C_TEXT:C284(SD_GetDiaryActionsRange; $1)

//SD_GETDIARYACTIONRANGEBYCODE
C_POINTER:C301(SD_GetDiaryActionRangeByCode; $0)
C_TEXT:C284(SD_GetDiaryActionRangeByCode; ${2})
C_TEXT:C284(SD_GetDiaryActionRangeByCode; $1)

//SD2_GETACTIONSRANGEBYCLASS
C_POINTER:C301(SD2_GetActionsRangeByClass; $0)
C_REAL:C285(SD2_GetActionsRangeByClass; ${-1})

//SD2_GETACTIONSRANGEBYLOCATION
C_POINTER:C301(SD2_GetActionsRangeByLocation; $0)
C_TEXT:C284(SD2_GetActionsRangeByLocation; ${3})
C_TEXT:C284(SD2_GetActionsRangeByLocation; $1)
C_TEXT:C284(SD2_GetActionsRangeByLocation; $2)

//CAL_ISODAYNO
C_REAL:C285(Cal_ISODayNo; $0)
C_DATE:C307(Cal_ISODayNo; $1)

//CAL_ISOWEEKNUMBER
C_REAL:C285(Cal_ISOWeekNumber; $0)
C_DATE:C307(Cal_ISOWeekNumber; $1)

//CAL_ISODAYCONSTANT
C_LONGINT:C283(CAL_ISODayConstant; $0)
C_LONGINT:C283(CAL_ISODayConstant; $1)

//CAL4D_ADDTRACKINGELEMENT
C_LONGINT:C283(Cal4D_AddTrackingElement; $1)
C_TEXT:C284(Cal4D_AddTrackingElement; $2)
C_LONGINT:C283(Cal4D_AddTrackingElement; $3)
C_LONGINT:C283(Cal4D_AddTrackingElement; $4)

//CAL4D_ALERT
C_TEXT:C284(Cal4D_Alert; $1)
C_LONGINT:C283(Cal4D_Alert; $2)

//CAL4D_ICAL_GETERRORMESSAGE
C_TEXT:C284(Cal4D_iCal_GetErrorMessage; $0)
C_LONGINT:C283(Cal4D_iCal_GetErrorMessage; $1)

//CAL4D_DATEANDTIMETOLONGINT
C_LONGINT:C283(Cal4D_DateAndTimeToLongint; $0)
C_BOOLEAN:C305(Cal4D_DateAndTimeToLongint; $1)

//CAL4D_CAL_REDRAW
C_REAL:C285(Cal4D_Cal_Redraw; $1)

//CAL4D_CELL_BG_MOUSEOVER
C_TEXT:C284(Cal4D_Cell_BG_MouseOver; $0)
C_TEXT:C284(Cal4D_Cell_BG_MouseOver; $1)

//CAL4D_STR_PARSE
C_TEXT:C284(CAL4D_STR_Parse; $0)
C_TEXT:C284(CAL4D_STR_Parse; $1)
C_LONGINT:C283(CAL4D_STR_Parse; $2)
C_TEXT:C284(CAL4D_STR_Parse; $3)
C_POINTER:C301(CAL4D_STR_Parse; $4)

//CAL4D_UTIL_COLOR_RGB2HSV
C_TEXT:C284(CAL4D_UTIL_Color_RGB2HSV; $0)
C_LONGINT:C283(CAL4D_UTIL_Color_RGB2HSV; $1)
C_LONGINT:C283(CAL4D_UTIL_Color_RGB2HSV; $2)
C_LONGINT:C283(CAL4D_UTIL_Color_RGB2HSV; $3)

//CAL4D_UTIL_COLOR_HSV2RGB
C_TEXT:C284(CAL4D_UTIL_Color_HSV2RGB; $0)
C_LONGINT:C283(CAL4D_UTIL_Color_HSV2RGB; $1)
C_LONGINT:C283(CAL4D_UTIL_Color_HSV2RGB; $2)
C_LONGINT:C283(CAL4D_UTIL_Color_HSV2RGB; $3)

//CAL4D_CELL_BG_WEEKOF
C_TEXT:C284(Cal4D_Cell_BG_WeekOf; $0)
C_TEXT:C284(Cal4D_Cell_BG_WeekOf; $1)

//CAL4D_VERIFYSTRUCTUREITEM
C_POINTER:C301(Cal4D_VerifyStructureItem; $0)
C_TEXT:C284(Cal4D_VerifyStructureItem; $1)
C_LONGINT:C283(Cal4D_VerifyStructureItem; $2)
C_BOOLEAN:C305(Cal4D_VerifyStructureItem; $3)

//CAL4D_SELECTOBJECT
C_POINTER:C301(Cal4D_SelectObject; $1)

//CAL4D_DESELECTOBJECT
C_POINTER:C301(Cal4D_DeselectObject; $1)

//CAL4D_GETEVENTIDFROMFORMOBJECT
C_LONGINT:C283(Cal4D_GetEventIDfromFormObject; $0)
C_POINTER:C301(Cal4D_GetEventIDfromFormObject; $1)

//CAL4D_EVENT_GETDATA
C_LONGINT:C283(Cal4D_Event_GetData; $1)
C_POINTER:C301(Cal4D_Event_GetData; $2)
C_POINTER:C301(Cal4D_Event_GetData; $3)
C_POINTER:C301(Cal4D_Event_GetData; $4)
C_POINTER:C301(Cal4D_Event_GetData; $5)
C_POINTER:C301(Cal4D_Event_GetData; $6)
C_POINTER:C301(Cal4D_Event_GetData; $7)
C_POINTER:C301(Cal4D_Event_GetData; $8)
C_POINTER:C301(Cal4D_Event_GetData; $9)

//CAL4D_UTIL_MODIFYCOLOR
C_LONGINT:C283(Cal4D_Util_ModifyColor; $0)
C_LONGINT:C283(Cal4D_Util_ModifyColor; $1)
C_LONGINT:C283(Cal4D_Util_ModifyColor; $2)

//CAL4D_SETOBJECTCOLOR
C_POINTER:C301(Cal4D_SetObjectColor; $1)
C_TEXT:C284(Cal4D_SetObjectColor; $2)
C_DATE:C307(Cal4D_SetObjectColor; $3)
C_LONGINT:C283(Cal4D_SetObjectColor; $4)

//CAL4D_GETFORMOBJECTSFROMEVENTID
C_LONGINT:C283(Cal4D_GetFormObjectsFromEventID; $1)
C_POINTER:C301(Cal4D_GetFormObjectsFromEventID; $2)

//CAL4D_BANNEROBJECTMETHOD
C_POINTER:C301(Cal4D_BannerObjectMethod; $1)

//CAL4D_BOXOBJECTMETHOD
C_LONGINT:C283(Cal4D_BoxObjectMethod; $0)
C_POINTER:C301(Cal4D_BoxObjectMethod; $1)

//CAL4D_CAL_DISPLAYDAYOFWEEK
C_BOOLEAN:C305(Cal4D_Cal_DisplayDayOfWeek; $0)
C_BOOLEAN:C305(Cal4D_Cal_DisplayDayOfWeek; $1)

//CAL4D_CAL_DISPLAYEDDATE
C_DATE:C307(Cal4D_Cal_DisplayedDate; $0)
C_DATE:C307(Cal4D_Cal_DisplayedDate; $1)

//CAL4D_CAL_DISPLAYMONTHYEAR
C_BOOLEAN:C305(Cal4D_Cal_DisplayMonthYear; $0)
C_BOOLEAN:C305(Cal4D_Cal_DisplayMonthYear; $1)

//CAL4D_CAL_DISPLAYNAVBUTTONS
C_BOOLEAN:C305(Cal4D_Cal_DisplayNavButtons; $0)
C_BOOLEAN:C305(Cal4D_Cal_DisplayNavButtons; $1)

//CAL4D_YEARMONTHDAYTODATE
C_DATE:C307(Cal4D_YearMonthDayToDate; $0)
C_LONGINT:C283(Cal4D_YearMonthDayToDate; $1)
C_LONGINT:C283(Cal4D_YearMonthDayToDate; $2)
C_LONGINT:C283(Cal4D_YearMonthDayToDate; $3)

//CAL4D_UTIL_SCALEIMAGE
C_POINTER:C301(Cal4D_Util_ScaleImage; $1)
C_TEXT:C284(Cal4D_Util_ScaleImage; $2)

//CAL4D_UTIL_RGBTOINDEXEDCOLOR
C_LONGINT:C283(Cal4D_Util_RGBToIndexedColor; $0)
C_LONGINT:C283(Cal4D_Util_RGBToIndexedColor; $1)

//CAL4D_UTIL_INDEXEDCOLORTORGB
C_LONGINT:C283(Cal4D_Util_IndexedColorToRGB; $0)
C_LONGINT:C283(Cal4D_Util_IndexedColorToRGB; $1)

//CAL4D_USER_DELETE
C_LONGINT:C283(Cal4D_User_Delete; $0)
C_TEXT:C284(Cal4D_User_Delete; $1)

//CAL4D_USER_ID
C_LONGINT:C283(Cal4D_User_ID; $0)
C_TEXT:C284(Cal4D_User_ID; $1)

//CAL4D_CAL_CALLBACKMETHODS
C_TEXT:C284(Cal4D_Cal_CallbackMethods; $1)
C_TEXT:C284(Cal4D_Cal_CallbackMethods; $2)

//CAL4D_TEXTOBJECTMETHOD
C_POINTER:C301(Cal4D_TextObjectMethod; $1)

//CAL4D_STRINGTODATE
C_DATE:C307(Cal4D_StringToDate; $0)
C_TEXT:C284(Cal4D_StringToDate; $1)

//CAL4D_STARTUP
C_TEXT:C284(Cal4D_Startup; $1)

//CAL4D_REQUESTDATE
C_DATE:C307(Cal4D_RequestDate; $0)
C_TEXT:C284(Cal4D_RequestDate; $1)
C_DATE:C307(Cal4D_RequestDate; $2)
C_TEXT:C284(Cal4D_RequestDate; $3)
C_TEXT:C284(Cal4D_RequestDate; $4)

//CAL4D_REPLACESPECIALCHARACTERS
C_TEXT:C284(Cal4D_ReplaceSpecialCharacters; $0)
C_TEXT:C284(Cal4D_ReplaceSpecialCharacters; $1)

//CAL4D_RECALCBANNER
C_POINTER:C301(Cal4D_RecalcBanner; $1)

//CAL4D_PLACETEXTOBJECT
C_LONGINT:C283(Cal4D_PlaceTextObject; $1)
C_TEXT:C284(Cal4D_PlaceTextObject; $2)
C_TEXT:C284(Cal4D_PlaceTextObject; $3)
C_DATE:C307(Cal4D_PlaceTextObject; $4)
C_TIME:C306(Cal4D_PlaceTextObject; $5)
C_DATE:C307(Cal4D_PlaceTextObject; $6)
C_TIME:C306(Cal4D_PlaceTextObject; $7)
C_LONGINT:C283(Cal4D_PlaceTextObject; $8)

//CAL4D_PLACEPICTUREOBJECT
C_LONGINT:C283(Cal4D_PlacePictureObject; $1)
C_DATE:C307(Cal4D_PlacePictureObject; $2)
C_PICTURE:C286(Cal4D_PlacePictureObject; $3)

//CAL4D_PLACEBANNEROBJECT
C_LONGINT:C283(Cal4D_PlaceBannerObject; $1)
C_TEXT:C284(Cal4D_PlaceBannerObject; $2)
C_DATE:C307(Cal4D_PlaceBannerObject; $3)
C_DATE:C307(Cal4D_PlaceBannerObject; $4)
C_LONGINT:C283(Cal4D_PlaceBannerObject; $5)
C_BOOLEAN:C305(Cal4D_PlaceBannerObject; $6)

//CAL4D_PICTOBJECTMETHOD
C_POINTER:C301(Cal4D_PictObjectMethod; $1)

//CAL4D_MORESTUFFOBJECTMETHOD
C_POINTER:C301(Cal4D_MoreStuffObjectMethod; $1)

//CAL4D_MONTHNAME
C_TEXT:C284(Cal4D_MonthName; $0)
C_LONGINT:C283(Cal4D_MonthName; $1)

//CAL4D_LONGNAMETOPATHNAME
C_TEXT:C284(Cal4D_LongNameToPathName; $0)
C_TEXT:C284(Cal4D_LongNameToPathName; $1)

//CAL4D_LOADASSOCIATEDRECORD
C_POINTER:C301(Cal4D_LoadAssociatedRecord; $1)
C_LONGINT:C283(Cal4D_LoadAssociatedRecord; $2)

//CAL4D_GROUP_LOADRECORD
C_LONGINT:C283(Cal4D_Group_LoadRecord; $1)
C_TEXT:C284(Cal4D_Group_LoadRecord; $2)

//CAL4D_GROUP_GETINFO
C_TEXT:C284(Cal4D_Group_GetInfo; $0)
C_LONGINT:C283(Cal4D_Group_GetInfo; $1)

//CAL4D_GROUP_EDIT
C_LONGINT:C283(Cal4D_Group_Edit; $0)
C_LONGINT:C283(Cal4D_Group_Edit; $1)

//CAL4D_GROUP_DELETEEVENTS
C_LONGINT:C283(Cal4D_Group_DeleteEvents; $1)

//CAL4D_GROUP_DEFAULTGROUPID
C_LONGINT:C283(Cal4D_Group_DefaultGroupID; $0)
C_LONGINT:C283(Cal4D_Group_DefaultGroupID; $1)

//CAL4D_GROUP_CREATESHARED
C_LONGINT:C283(Cal4D_Group_CreateShared; $0)
C_TEXT:C284(Cal4D_Group_CreateShared; $1)
C_LONGINT:C283(Cal4D_Group_CreateShared; $2)
C_BOOLEAN:C305(Cal4D_Group_CreateShared; $3)

//CAL4D_GROUP_CREATE
C_LONGINT:C283(Cal4D_Group_Create; $0)
C_TEXT:C284(Cal4D_Group_Create; $1)
C_LONGINT:C283(Cal4D_Group_Create; $2)
C_BOOLEAN:C305(Cal4D_Group_Create; $3)
C_BOOLEAN:C305(Cal4D_Group_Create; $4)

//CAL4D_GROUP_DELETE
C_LONGINT:C283(Cal4D_Group_Delete; $1)

//CAL4D_GROUP_COLOR
C_LONGINT:C283(Cal4D_Group_Color; $0)
C_LONGINT:C283(Cal4D_Group_Color; $1)
C_LONGINT:C283(Cal4D_Group_Color; $2)

//CAL4D_LISTBOX_SETFONTS
C_POINTER:C301(Cal4D_ListBox_SetFonts; $1)
C_LONGINT:C283(Cal4D_ListBox_SetFonts; $2)

//CAL4D_ICAL_WDAV_URLENCODER
C_TEXT:C284(Cal4D_iCal_WDAV_URLEncoder; $0)
C_TEXT:C284(Cal4D_iCal_WDAV_URLEncoder; $1)

//CAL4D_INFO
C_TEXT:C284(Cal4D_Info; $0)
C_TEXT:C284(Cal4D_Info; $1)

//CAL4D_ICAL_WDAV_UPLOADFILE
C_LONGINT:C283(Cal4D_iCal_WDAV_UploadFile; $0)
C_TEXT:C284(Cal4D_iCal_WDAV_UploadFile; $1)
C_TEXT:C284(Cal4D_iCal_WDAV_UploadFile; $2)
C_TEXT:C284(Cal4D_iCal_WDAV_UploadFile; $3)

//CAL4D_ICAL_WDAV_SENDUPLOAD
C_LONGINT:C283(Cal4D_iCal_WDAV_SendUpload; $0)
C_TEXT:C284(Cal4D_iCal_WDAV_SendUpload; $1)
C_LONGINT:C283(Cal4D_iCal_WDAV_SendUpload; $2)
C_TEXT:C284(Cal4D_iCal_WDAV_SendUpload; $3)
C_BLOB:C604(Cal4D_iCal_WDAV_SendUpload; $4)
C_TEXT:C284(Cal4D_iCal_WDAV_SendUpload; $5)
C_TEXT:C284(Cal4D_iCal_WDAV_SendUpload; $6)
C_TEXT:C284(Cal4D_iCal_WDAV_SendUpload; $7)
C_TEXT:C284(Cal4D_iCal_WDAV_SendUpload; $8)

//CAL4D_ICAL_WDAV_SENDREQUEST
C_TEXT:C284(Cal4D_iCal_WDAV_SendRequest; $1)
C_LONGINT:C283(Cal4D_iCal_WDAV_SendRequest; $2)
C_TEXT:C284(Cal4D_iCal_WDAV_SendRequest; $3)
C_TEXT:C284(Cal4D_iCal_WDAV_SendRequest; $4)
C_TEXT:C284(Cal4D_iCal_WDAV_SendRequest; $5)
C_TEXT:C284(Cal4D_iCal_WDAV_SendRequest; $6)
C_TEXT:C284(Cal4D_iCal_WDAV_SendRequest; $7)
C_TEXT:C284(Cal4D_iCal_WDAV_SendRequest; $8)

//CAL4D_ICAL_WDAV_PUT
C_LONGINT:C283(Cal4D_iCal_WDAV_PUT; $0)
C_TEXT:C284(Cal4D_iCal_WDAV_PUT; $1)
C_LONGINT:C283(Cal4D_iCal_WDAV_PUT; $2)
C_TEXT:C284(Cal4D_iCal_WDAV_PUT; $3)
C_BLOB:C604(Cal4D_iCal_WDAV_PUT; $4)
C_TEXT:C284(Cal4D_iCal_WDAV_PUT; $5)

//CAL4D_ICAL_WDAV_GETHTTP
C_LONGINT:C283(Cal4D_iCal_WDAV_GetHTTP; $0)
C_TEXT:C284(Cal4D_iCal_WDAV_GetHTTP; $1)
C_LONGINT:C283(Cal4D_iCal_WDAV_GetHTTP; $2)
C_TEXT:C284(Cal4D_iCal_WDAV_GetHTTP; $3)
C_TEXT:C284(Cal4D_iCal_WDAV_GetHTTP; $4)

//CAL4D_ICAL_WDAV_ENCODEB64
C_TEXT:C284(Cal4D_iCal_WDAV_EncodeB64; $0)
C_TEXT:C284(Cal4D_iCal_WDAV_EncodeB64; $1)

//CAL4D_ICAL_WDAV_DOWNLOADFILE
C_LONGINT:C283(Cal4D_iCal_WDAV_DownloadFile; $0)
C_TEXT:C284(Cal4D_iCal_WDAV_DownloadFile; $1)
C_TEXT:C284(Cal4D_iCal_WDAV_DownloadFile; $2)
C_TEXT:C284(Cal4D_iCal_WDAV_DownloadFile; $3)

//CAL4D_ICAL_WDAV_BASE64ENC
C_LONGINT:C283(Cal4D_iCal_WDAV_base64enc; $0)
C_LONGINT:C283(Cal4D_iCal_WDAV_base64enc; $1)

//CAL4D_ICAL_UPDATECALENDAR
C_LONGINT:C283(Cal4D_iCal_UpdateCalendar; $1)

//CAL4D_HEADERHEIGHT
C_LONGINT:C283(Cal4D_HeaderHeight; $0)

//CAL4D_GROUP_SUBSCRIBE
C_LONGINT:C283(Cal4D_Group_Subscribe; $0)
C_TEXT:C284(Cal4D_Group_Subscribe; $1)
C_TEXT:C284(Cal4D_Group_Subscribe; $2)
C_TEXT:C284(Cal4D_Group_Subscribe; $3)

//CAL4D_ICAL_STATUSMESSAGE
C_TEXT:C284(Cal4D_iCal_StatusMessage; $1)

//CAL4D_ICAL_REFRESHONE
C_LONGINT:C283(Cal4D_iCal_RefreshOne; $1)

//CAL4D_ICAL_REFRESH2
C_LONGINT:C283(Cal4D_iCal_Refresh2; $1)

//CAL4D_ICAL_REFRESH
C_LONGINT:C283(Cal4D_iCal_Refresh; $1)

//CAL4D_ICAL_READSUBSCRIPTION
C_TEXT:C284(Cal4D_iCal_ReadSubscription; $1)
C_POINTER:C301(Cal4D_iCal_ReadSubscription; $2)
C_POINTER:C301(Cal4D_iCal_ReadSubscription; $3)
C_POINTER:C301(Cal4D_iCal_ReadSubscription; $4)
C_POINTER:C301(Cal4D_iCal_ReadSubscription; $5)
C_POINTER:C301(Cal4D_iCal_ReadSubscription; $6)
C_POINTER:C301(Cal4D_iCal_ReadSubscription; $7)
C_POINTER:C301(Cal4D_iCal_ReadSubscription; $8)
C_POINTER:C301(Cal4D_iCal_ReadSubscription; $9)
C_POINTER:C301(Cal4D_iCal_ReadSubscription; $10)

//CAL4D_ICAL_PARSEDATETIMESTAMP
C_TEXT:C284(Cal4D_iCal_ParseDateTimeStamp; $1)
C_POINTER:C301(Cal4D_iCal_ParseDateTimeStamp; $2)
C_POINTER:C301(Cal4D_iCal_ParseDateTimeStamp; $3)

//CAL4D_ICAL_IMPORTCALENDARFILE
C_TEXT:C284(Cal4D_iCal_ImportCalendarFile; $1)
C_LONGINT:C283(Cal4D_iCal_ImportCalendarFile; $2)

//CAL4D_GROUP_IMPORT
C_LONGINT:C283(Cal4D_Group_Import; $0)
C_TEXT:C284(Cal4D_Group_Import; $1)

//CAL4D_GROUP_ID
C_LONGINT:C283(Cal4D_Group_ID; $0)
C_TEXT:C284(Cal4D_Group_ID; $1)
C_TEXT:C284(Cal4D_Group_ID; $2)

//CAL4D_GROUP_TRIGGER
C_LONGINT:C283(Cal4D_Group_Trigger; $0)

//CAL4D_ICAL_GETTIME
C_TEXT:C284(Cal4D_iCal_GetTime; $0)
C_TIME:C306(Cal4D_iCal_GetTime; $1)

//CAL4D_ICAL_GETFILENAME
C_TEXT:C284(Cal4D_iCal_GetFileName; $0)
C_TEXT:C284(Cal4D_iCal_GetFileName; $1)

//CAL4D_ICAL_GETDTSTAMP
C_TEXT:C284(Cal4D_iCal_GetDTSTAMP; $0)

//CAL4D_ICAL_GETDATE
C_TEXT:C284(Cal4D_iCal_GetDate; $0)
C_DATE:C307(Cal4D_iCal_GetDate; $1)

//CAL4D_ICAL_GETCALENDARNAME
C_TEXT:C284(Cal4D_iCal_GetCalendarName; $0)
C_TEXT:C284(Cal4D_iCal_GetCalendarName; $1)
C_TEXT:C284(Cal4D_iCal_GetCalendarName; $2)

//CAL4D_ICAL_EDIT
C_LONGINT:C283(Cal4D_iCal_Edit; $1)

//CAL4D_ICAL_DOWNLOADCALENDARFILE
C_TEXT:C284(Cal4D_iCal_DownloadCalendarFile; $0)
C_TEXT:C284(Cal4D_iCal_DownloadCalendarFile; $1)
C_TEXT:C284(Cal4D_iCal_DownloadCalendarFile; $2)
C_TEXT:C284(Cal4D_iCal_DownloadCalendarFile; $3)

//CAL4D_ICAL_DURATIONTOSECONDS
C_LONGINT:C283(Cal4D_iCal_DurationToSeconds; $0)
C_TEXT:C284(Cal4D_iCal_DurationToSeconds; $1)

//CAL4D_ICAL_DELETECALENDARFILE
C_TEXT:C284(Cal4D_iCal_DeleteCalendarFile; $1)

//CAL4D_ICAL_DATATOARRAYS
C_TEXT:C284(Cal4D_iCal_DataToArrays; $1)
C_POINTER:C301(Cal4D_iCal_DataToArrays; $2)
C_POINTER:C301(Cal4D_iCal_DataToArrays; $3)
C_POINTER:C301(Cal4D_iCal_DataToArrays; $4)
C_POINTER:C301(Cal4D_iCal_DataToArrays; $5)
C_POINTER:C301(Cal4D_iCal_DataToArrays; $6)
C_POINTER:C301(Cal4D_iCal_DataToArrays; $7)
C_POINTER:C301(Cal4D_iCal_DataToArrays; $8)
C_POINTER:C301(Cal4D_iCal_DataToArrays; $9)
C_POINTER:C301(Cal4D_iCal_DataToArrays; $10)
C_POINTER:C301(Cal4D_iCal_DataToArrays; $11)

//CAL4D_ICAL_ADDSECONDSTODATETIME
C_POINTER:C301(Cal4D_iCal_AddSecondsToDateTime; $1)
C_POINTER:C301(Cal4D_iCal_AddSecondsToDateTime; $2)
C_LONGINT:C283(Cal4D_iCal_AddSecondsToDateTime; $3)

//CAL4D_GETSIMPLEVARNAME
C_TEXT:C284(Cal4D_GetSimpleVarName; $0)
C_TEXT:C284(Cal4D_GetSimpleVarName; $1)

//CAL4D_GETOBJECTNUMBER
C_LONGINT:C283(Cal4D_GetObjectNumber; $0)
C_POINTER:C301(Cal4D_GetObjectNumber; $1)

//CAL4D_GETDAYOFWEEK
C_TEXT:C284(Cal4D_GetDayOfWeek; $0)
C_LONGINT:C283(Cal4D_GetDayOfWeek; $1)
C_LONGINT:C283(Cal4D_GetDayOfWeek; $2)

//CAL4D_GETDATEBYBOXNUMBER
C_DATE:C307(Cal4D_GetDateByBoxNumber; $0)
C_LONGINT:C283(Cal4D_GetDateByBoxNumber; $1)

//CAL4D_GETBOXNUMBERBYDATE
C_LONGINT:C283(Cal4D_GetBoxNumberByDate; $0)
C_DATE:C307(Cal4D_GetBoxNumberByDate; $1)

//CAL4D_GETBOXNUMBERBYCOORDINATES
C_LONGINT:C283(Cal4D_GetBoxNumberByCoordinates; $0)
C_LONGINT:C283(Cal4D_GetBoxNumberByCoordinates; $1)
C_LONGINT:C283(Cal4D_GetBoxNumberByCoordinates; $2)

//CAL4D_FORMATEVENTDISPLAY
C_TEXT:C284(Cal4D_FormatEventDisplay; $0)
C_TEXT:C284(Cal4D_FormatEventDisplay; $1)
C_TEXT:C284(Cal4D_FormatEventDisplay; $2)
C_TIME:C306(Cal4D_FormatEventDisplay; $3)

//CAL4D_EVENT_VIEW
C_LONGINT:C283(Cal4D_Event_View; $1)

//CAL4D_EVENT_USEROWNSEVENT
C_BOOLEAN:C305(Cal4D_Event_UserOwnsEvent; $0)

//CAL4D_EVENT_UID
C_TEXT:C284(Cal4D_Event_UID; $0)
C_LONGINT:C283(Cal4D_Event_UID; $1)
C_TEXT:C284(Cal4D_Event_UID; $2)

//CAL4D_EVENT_LOADRECORD
C_LONGINT:C283(Cal4D_Event_LoadRecord; $1)

//CAL4D_CAL_SETPOSITION
C_LONGINT:C283(Cal4D_Cal_SetPosition; $1)
C_LONGINT:C283(Cal4D_Cal_SetPosition; $2)
C_LONGINT:C283(Cal4D_Cal_SetPosition; $3)
C_LONGINT:C283(Cal4D_Cal_SetPosition; $4)

//CAL4D_CAL_SETPOSITIONBYOBJECT
C_TEXT:C284(Cal4D_Cal_SetPositionByObject; $1)

//CAL4D_CAL_SETVISIBLE
C_BOOLEAN:C305(Cal4D_Cal_SetVisible; $1)

//CAL4D_ENDOFMONTH
C_DATE:C307(Cal4D_EndOfMonth; $0)
C_DATE:C307(Cal4D_EndOfMonth; $1)

//CAL4D_CAL_COLOR
C_LONGINT:C283(Cal4D_Cal_Color; $0)
C_TEXT:C284(Cal4D_Cal_Color; $1)
C_LONGINT:C283(Cal4D_Cal_Color; $2)

//CAL4D_CAL_COLOR2
C_LONGINT:C283(Cal4D_Cal_Color2; $0)
C_POINTER:C301(Cal4D_Cal_Color2; $1)
C_LONGINT:C283(Cal4D_Cal_Color2; $2)

//CAL4D_CALLCALLBACKMETHOD
C_BOOLEAN:C305(Cal4D_CallCallbackMethod; $0)
C_LONGINT:C283(Cal4D_CallCallbackMethod; $1)
C_LONGINT:C283(Cal4D_CallCallbackMethod; $2)
C_DATE:C307(Cal4D_CallCallbackMethod; $3)
C_DATE:C307(Cal4D_CallCallbackMethod; $4)

//CAL4D_CENTERWINDOW
C_LONGINT:C283(Cal4D_CenterWindow; $0)
C_TEXT:C284(Cal4D_CenterWindow; $1)
C_LONGINT:C283(Cal4D_CenterWindow; $2)

//CAL4D_CONFIRM
C_TEXT:C284(Cal4D_Confirm; $1)

//CAL4D_DATEFILTER
C_POINTER:C301(Cal4D_DateFilter; $1)

//CAL4D_DRAGOBJECTMETHOD
C_POINTER:C301(Cal4D_DragObjectMethod; $1)

//CAL4D_EVENT_TRIGGER
C_LONGINT:C283(Cal4D_Event_Trigger; $0)

//CAL4D_EVENT_COLOR
C_LONGINT:C283(Cal4D_Event_Color; $0)
C_LONGINT:C283(Cal4D_Event_Color; $1)
C_LONGINT:C283(Cal4D_Event_Color; $2)

//CAL4D_EVENT_CREATE
C_LONGINT:C283(Cal4D_Event_Create; $0)
C_TEXT:C284(Cal4D_Event_Create; $1)
C_DATE:C307(Cal4D_Event_Create; $2)
C_TIME:C306(Cal4D_Event_Create; $3)
C_DATE:C307(Cal4D_Event_Create; $4)
C_TIME:C306(Cal4D_Event_Create; $5)
C_LONGINT:C283(Cal4D_Event_Create; $6)
C_TEXT:C284(Cal4D_Event_Create; $7)

//CAL4D_EVENT_DELETE
C_LONGINT:C283(Cal4D_Event_Delete; $1)

//CAL4D_EVENT_DISPLAY
C_LONGINT:C283(Cal4D_Event_Display; $0)
C_LONGINT:C283(Cal4D_Event_Display; $1)
C_TEXT:C284(Cal4D_Event_Display; $2)
C_DATE:C307(Cal4D_Event_Display; $3)
C_TIME:C306(Cal4D_Event_Display; $4)
C_DATE:C307(Cal4D_Event_Display; $5)
C_TIME:C306(Cal4D_Event_Display; $6)
C_LONGINT:C283(Cal4D_Event_Display; $7)

//CAL4D_EVENT_NOTES
C_TEXT:C284(Cal4D_Event_Notes; $0)
C_LONGINT:C283(Cal4D_Event_Notes; $1)
C_TEXT:C284(Cal4D_Event_Notes; $2)

//CAL4D_EVENT_EDIT
C_LONGINT:C283(Cal4D_Event_Edit; $1)

//CAL4D_EVENT_EDIT2
C_LONGINT:C283(Cal4D_Event_Edit2; $1)

//CAL4D_EVENT_GUESSEVENTTYPE
C_TEXT:C284(Cal4D_Event_GuessEventType; $0)
C_DATE:C307(Cal4D_Event_GuessEventType; $1)
C_TIME:C306(Cal4D_Event_GuessEventType; $2)
C_DATE:C307(Cal4D_Event_GuessEventType; $3)
C_TIME:C306(Cal4D_Event_GuessEventType; $4)

//CAL4D_EVENT_ISLOCKED
C_BOOLEAN:C305(Cal4D_Event_IsLocked; $0)

//CAL4D_EVENT_ISSUBSCRIBED
C_BOOLEAN:C305(Cal4D_Event_IsSubscribed; $0)

//CAL4D_CAL_DAYSWITHEVENTS
C_DATE:C307(Cal4D_Cal_DaysWithEvents; $1)
C_POINTER:C301(Cal4D_Cal_DaysWithEvents; $2)

//CAL4D_CAL_GETWEEKCALENDAR
C_POINTER:C301(Cal4D_Cal_GetWeekCalendar; $1)
C_POINTER:C301(Cal4D_Cal_GetWeekCalendar; $2)

//CAL4D_CAL_GETDAYCALENDAR
C_POINTER:C301(Cal4D_Cal_GetDayCalendar; $1)
C_POINTER:C301(Cal4D_Cal_GetDayCalendar; $2)

//CAL4D_CAL_DAYSINMONTH
C_LONGINT:C283(Cal4D_Cal_DaysInMonth; $0)
C_DATE:C307(Cal4D_Cal_DaysInMonth; $1)

//CAL4D_WEEKSTART_LOADFROMDISK
C_TEXT:C284(Cal4D_WeekStart_LoadFromDisk; $1)

//CAL4D_USER_NAME
C_TEXT:C284(Cal4D_User_Name; $0)

//CAL4D_FM_CALWITHMINIS
C_LONGINT:C283(Cal4D_FM_CalWithMinis; $1)
C_POINTER:C301(Cal4D_FM_CalWithMinis; $2)

//CAL4D_OM_CALWITHMINIS_MINI
C_POINTER:C301(Cal4D_OM_CalWithMinis_Mini; $1)

//CAL4D_OM_CALWITHMINIS_MONTH
C_POINTER:C301(Cal4D_OM_CalWithMinis_Month; $1)
C_LONGINT:C283(Cal4D_OM_CalWithMinis_Month; $2)

//CAL4D_OM_CALWITHMINIS_BTN
C_TEXT:C284(Cal4D_OM_CalWithMinis_BTN; $1)
C_DATE:C307(Cal4D_OM_CalWithMinis_BTN; $2)

//CAL4D_OM_CALWITHMINIS_WEEK
C_LONGINT:C283(Cal4D_OM_CalWithMinis_Week; $1)
C_POINTER:C301(Cal4D_OM_CalWithMinis_Week; $2)

//CAL4D_OM_CALWITHMINIS_WEEK_BNR
C_LONGINT:C283(Cal4D_OM_CalWithMinis_Week_Bnr; $1)
C_POINTER:C301(Cal4D_OM_CalWithMinis_Week_Bnr; $2)

//CAL4D_OM_CALENDARS_LISTBOX
C_POINTER:C301(Cal4D_OM_Calendars_ListBox; $1)
C_LONGINT:C283(Cal4D_OM_Calendars_ListBox; $2)
C_POINTER:C301(Cal4D_OM_Calendars_ListBox; $3)
C_POINTER:C301(Cal4D_OM_Calendars_ListBox; $4)

//CAL4D_OM_CALWITHMINIS_DAY
C_LONGINT:C283(Cal4D_OM_CalWithMinis_Day; $1)
C_POINTER:C301(Cal4D_OM_CalWithMinis_Day; $2)

//CAL4D_OM_CALWITHMINIS_DAY_BNR
C_LONGINT:C283(Cal4D_OM_CalWithMinis_Day_Bnr; $1)
C_POINTER:C301(Cal4D_OM_CalWithMinis_Day_Bnr; $2)
C_POINTER:C301(CAL4D_AppendBlobVar; ${1})

//CAL4D_GETVARSFROMBLOB
C_LONGINT:C283(CAL4D_GetVarsFromBlob; $0)
C_POINTER:C301(CAL4D_GetVarsFromBlob; ${2})
C_LONGINT:C283(CAL4D_GetVarsFromBlob; $1)
C_POINTER:C301(CAL4D_VarstoBlob; ${1})

//CAL4D_CAL_CALENDAR_POP
C_DATE:C307(Cal4D_Cal_Calendar_Pop; $0)
C_DATE:C307(Cal4D_Cal_Calendar_Pop; $1)
C_LONGINT:C283(Cal4D_Cal_Calendar_Pop; $2)
C_LONGINT:C283(Cal4D_Cal_Calendar_Pop; $3)

//CAL4D_CAL_CNTALLDAYANDBANNERS
C_LONGINT:C283(Cal4D_Cal_CntAllDayAndBanners; $0)
C_DATE:C307(Cal4D_Cal_CntAllDayAndBanners; $1)

//CAL4D_CAL_DATEFROMCELLID
C_DATE:C307(CAL4D_Cal_DateFromCellID; $0)
C_TEXT:C284(CAL4D_Cal_DateFromCellID; $1)

//SD_ORDINtoDate
C_DATE:C307(SD_ORDINtoDate; $0)
C_LONGINT:C283(SD_ORDINtoDate; $1)

//CAL4D_CAL_DISPLAYCALENDAR
C_POINTER:C301(Cal4D_Cal_DisplayCalendar; $1)
C_TEXT:C284(Cal4D_Cal_DisplayCalendar; $2)
C_DATE:C307(Cal4D_Cal_DisplayCalendar; $3)
C_DATE:C307(Cal4D_Cal_DisplayCalendar; $4)
C_POINTER:C301(Cal4D_Cal_DisplayCalendar; $5)
C_POINTER:C301(Cal4D_Cal_DisplayCalendar; $6)

//DB_ASSERT
C_BOOLEAN:C305(DB_Assert; $0)
C_BOOLEAN:C305(DB_Assert; $1)
C_TEXT:C284(DB_Assert; $2)
C_TEXT:C284(DB_Assert; $3)

//CAL4D_CAL_FORMATEDDATE
C_DATE:C307(Cal4D_Cal_FormatedDate; $0)
C_LONGINT:C283(Cal4D_Cal_FormatedDate; $1)
C_LONGINT:C283(Cal4D_Cal_FormatedDate; $2)
C_LONGINT:C283(Cal4D_Cal_FormatedDate; $3)

//CAL4D_CAL_GETCURRENTDATE
C_DATE:C307(Cal4D_Cal_GetCurrentDate; $0)

//CAL4D_CAL_GETDATEWIDGET
C_POINTER:C301(Cal4D_Cal_GetDateWidget; $1)
C_DATE:C307(Cal4D_Cal_GetDateWidget; $2)

//CAL4D_CAL_GETEVENTCOLOR
C_LONGINT:C283(Cal4D_Cal_GetEventColor; $0)

//CAL4D_CAL_GETEVENTSATDATETIME
C_LONGINT:C283(Cal4D_Cal_GetEventsAtDateTime; $0)
C_DATE:C307(Cal4D_Cal_GetEventsAtDateTime; $1)
C_TIME:C306(Cal4D_Cal_GetEventsAtDateTime; $2)

//CAL4D_CAL_GETEVENTTYPE
C_TEXT:C284(Cal4D_Cal_GetEventType; $0)

//CAL4D_CAL_GETPOPCALENDAR
C_POINTER:C301(Cal4D_Cal_GetPopCalendar; $1)
C_DATE:C307(Cal4D_Cal_GetPopCalendar; $2)

//CAL4D_CAL_GETPOPCALENDAR_TITLES
C_POINTER:C301(Cal4D_Cal_GetPopCalendar_Titles; $1)

//CAL4D_CAL_GETPOPCALENDAR_WKNOS
C_POINTER:C301(Cal4D_Cal_GetPopCalendar_WkNos; $1)
C_DATE:C307(Cal4D_Cal_GetPopCalendar_WkNos; $2)

//CAL4D_CAL_GETPUBLICCALENDARS
C_LONGINT:C283(Cal4D_Cal_GetPublicCalendars; $0)

//CAL4D_CAL_GETSELECTEDDATE
C_DATE:C307(Cal4D_Cal_GetSelectedDate; $0)

//CAL4D_CAL_GETSELECTEDDATE_MINI
C_DATE:C307(Cal4D_Cal_GetSelectedDate_Mini; $0)

//CAL4D_CAL_GETSELECTEDEVENT
C_LONGINT:C283(Cal4D_Cal_GetSelectedEvent; $0)

//CAL4D_CAL_GETTIMEZONE_TIZNO
C_TEXT:C284(Cal4D_Cal_GetTimeZone_TiZNO; $1)

//CAL4D_CAL_GETTIMEZONEOFFSET
C_TEXT:C284(Cal4D_Cal_GetTimeZoneOffset; $0)
C_TEXT:C284(Cal4D_Cal_GetTimeZoneOffset; $1)

//CAL4D_CAL_GETUSERCALENDARS
C_LONGINT:C283(Cal4D_Cal_GetUserCalendars; $0)
C_TEXT:C284(Cal4D_Cal_GetUserCalendars; $1)

//CAL4D_CAL_MONTHSEND
C_DATE:C307(Cal4D_Cal_MonthsEnd; $0)
C_DATE:C307(Cal4D_Cal_MonthsEnd; $1)

//CAL4D_CAL_SETDAYCELL_BG
C_TEXT:C284(Cal4D_Cal_SetDayCell_BG; $1)
C_TEXT:C284(Cal4D_Cal_SetDayCell_BG; $2)

//CAL4D_CAL_SETFULLCELL_BG
C_TEXT:C284(Cal4D_Cal_SetFullCell_BG; $1)
C_TEXT:C284(Cal4D_Cal_SetFullCell_BG; $2)

//CAL4D_CAL_SETMINICELL_BG
C_DATE:C307(Cal4D_Cal_SetMiniCell_BG; $1)
C_TEXT:C284(Cal4D_Cal_SetMiniCell_BG; $2)

//CAL4D_CAL_SETOPACITY
C_LONGINT:C283(Cal4D_Cal_SetOpacity; $0)
C_TEXT:C284(Cal4D_Cal_SetOpacity; $1)

//CAL4D_CAL_SETWEEKDAYCELL_BG
C_TEXT:C284(Cal4D_Cal_SetWeekdayCell_BG; $1)
C_TEXT:C284(Cal4D_Cal_SetWeekdayCell_BG; $2)

//CAL4D_CAL_SYNCEVENTSELECTION
C_TEXT:C284(Cal4D_Cal_SyncEventSelection; $1)
C_TEXT:C284(Cal4D_Cal_SyncEventSelection; $2)

//CAL4D_CAL_WEEKOFDAYS
C_DATE:C307(Cal4D_Cal_WeekOfDays; $1)
C_POINTER:C301(Cal4D_Cal_WeekOfDays; $2)
C_POINTER:C301(Cal4D_Cal_WeekOfDays; $3)
C_TEXT:C284(Cal4D_Cal_WeekOfDays; $4)

//CAL4D_CAL_WEEKSTART
C_TEXT:C284(Cal4D_Cal_WeekStart; $0)
C_TEXT:C284(Cal4D_Cal_WeekStart; $1)

//CAL4D_CELL_BG_SELECTED
C_TEXT:C284(Cal4D_Cell_BG_Selected; $0)
C_TEXT:C284(Cal4D_Cell_BG_Selected; $1)

//CAL4D_DAYLIGHTDATESBY_RULE_9
C_TEXT:C284(Cal4D_DaylightDatesBy_Rule_9; $0)
C_TEXT:C284(Cal4D_DaylightDatesBy_Rule_9; $1)

//CAL4D_DAYLIGHTDATESBY_RULE_8
C_TEXT:C284(Cal4D_DaylightDatesBy_Rule_8; $0)
C_TEXT:C284(Cal4D_DaylightDatesBy_Rule_8; $1)

//CAL4D_DAYLIGHTDATESBY_RULE_6
C_TEXT:C284(Cal4D_DaylightDatesBy_Rule_6; $0)
C_TEXT:C284(Cal4D_DaylightDatesBy_Rule_6; $1)

//CAL4D_DAYLIGHTDATESBY_RULE_5
C_TEXT:C284(Cal4D_DaylightDatesBy_Rule_5; $0)
C_TEXT:C284(Cal4D_DaylightDatesBy_Rule_5; $1)

//CAL4D_DAYLIGHTDATESBY_RULE_4
C_TEXT:C284(Cal4D_DaylightDatesBy_Rule_4; $0)
C_TEXT:C284(Cal4D_DaylightDatesBy_Rule_4; $1)

//CAL4D_DAYLIGHTDATESBY_RULE_2
C_TEXT:C284(Cal4D_DaylightDatesBy_Rule_2; $0)
C_TEXT:C284(Cal4D_DaylightDatesBy_Rule_2; $1)

//CAL4D_DAYLIGHTDATESBY_RULE_1
C_TEXT:C284(Cal4D_DaylightDatesBy_Rule_1; $0)
C_TEXT:C284(Cal4D_DaylightDatesBy_Rule_1; $1)

//CAL4D_EVENT_CREATE_V11
C_LONGINT:C283(Cal4D_Event_Create_v11; $0)
C_LONGINT:C283(Cal4D_Event_Create_v11; $1)
C_LONGINT:C283(Cal4D_Event_Create_v11; $2)

//CAL4D_EVENT_CREATEUID
C_TEXT:C284(Cal4D_Event_CreateUID; $0)

//CAL4D_DP_WIGET
C_DATE:C307(Cal4D_DP_Wiget; $0)
C_DATE:C307(Cal4D_DP_Wiget; $1)
C_LONGINT:C283(Cal4D_DP_Wiget; $2)
C_LONGINT:C283(Cal4D_DP_Wiget; $3)

//CAL4D_EVENT_USERCANMODIFYEVENT
C_BOOLEAN:C305(Cal4D_Event_UserCanModifyEvent; $0)

//CAL4D_EVENT_UPDATE
C_LONGINT:C283(Cal4D_Event_Update; $1)

//CAL4D_FM_CAL4D_EVENT_D
C_LONGINT:C283(Cal4D_FM_Cal4D_Event_d; $1)

//CAL4D_GROUP_PUBLISH
C_LONGINT:C283(Cal4D_Group_Publish; $0)
C_LONGINT:C283(Cal4D_Group_Publish; $1)

//CAL4D_ICAL_ADJUSTTIMEFORZONE
C_TEXT:C284(Cal4D_iCal_AdjustTimeForZone; $0)
C_DATE:C307(Cal4D_iCal_AdjustTimeForZone; $1)
C_TIME:C306(Cal4D_iCal_AdjustTimeForZone; $2)
C_TEXT:C284(Cal4D_iCal_AdjustTimeForZone; $3)

//CAL4D_ICAL_APPLYTIMEZONEOFFSET
C_TEXT:C284(Cal4D_iCal_ApplyTimezoneOffset; $0)
C_TEXT:C284(Cal4D_iCal_ApplyTimezoneOffset; $1)
C_TEXT:C284(Cal4D_iCal_ApplyTimezoneOffset; $2)
C_DATE:C307(Cal4D_iCal_ApplyTimezoneOffset; $3)
C_TIME:C306(Cal4D_iCal_ApplyTimezoneOffset; $4)
C_TEXT:C284(Cal4D_iCal_ApplyTimezoneOffset; $5)
C_TEXT:C284(Cal4D_iCal_ApplyTimezoneOffset; $6)

//CAL4D_ICAL_DAYLIGHTSAVINGSTIME
C_BOOLEAN:C305(Cal4D_iCal_DaylightSavingsTime; $0)
C_DATE:C307(Cal4D_iCal_DaylightSavingsTime; $1)

//CAL4D_ICAL_GETDTSTAMP_ZULU
C_TEXT:C284(Cal4D_iCal_GetDTSTAMP_ZULU; $0)
C_BOOLEAN:C305(Cal4D_iCal_GetDTSTAMP_ZULU; $1)
C_DATE:C307(Cal4D_iCal_GetDTSTAMP_ZULU; $2)
C_TIME:C306(Cal4D_iCal_GetDTSTAMP_ZULU; $3)

//CAL4D_ICAL_GETORIGINTIMEZONE
C_TEXT:C284(Cal4D_iCal_GetOriginTimezone; $0)
C_TIME:C306(Cal4D_iCal_GetOriginTimezone; $1)

//CAL4D_ICAL_TIMEZONE
C_TEXT:C284(Cal4D_iCal_TimeZone; $0)
C_TEXT:C284(Cal4D_iCal_TimeZone; $1)

//CAL4D_ISDAYLIGHTTIME_RULE_1
C_BOOLEAN:C305(Cal4D_IsDaylightTime_Rule_1; $0)
C_DATE:C307(Cal4D_IsDaylightTime_Rule_1; $1)

//CAL4D_ISDAYLIGHTTIME_RULE_2
C_BOOLEAN:C305(Cal4D_IsDaylightTime_Rule_2; $0)
C_DATE:C307(Cal4D_IsDaylightTime_Rule_2; $1)

//CAL4D_ISDAYLIGHTTIME_RULE_4
C_BOOLEAN:C305(Cal4D_IsDaylightTime_Rule_4; $0)
C_DATE:C307(Cal4D_IsDaylightTime_Rule_4; $1)

//CAL4D_ISDAYLIGHTTIME_RULE_5
C_BOOLEAN:C305(Cal4D_IsDaylightTime_Rule_5; $0)
C_DATE:C307(Cal4D_IsDaylightTime_Rule_5; $1)

//CAL4D_ISDAYLIGHTTIME_RULE_6
C_BOOLEAN:C305(Cal4D_IsDaylightTime_Rule_6; $0)
C_DATE:C307(Cal4D_IsDaylightTime_Rule_6; $1)

//CAL4D_ISDAYLIGHTTIME_RULE_8
C_BOOLEAN:C305(Cal4D_IsDaylightTime_Rule_8; $0)
C_DATE:C307(Cal4D_IsDaylightTime_Rule_8; $1)

//CAL4D_ISDAYLIGHTTIME_RULE_9
C_BOOLEAN:C305(Cal4D_IsDaylightTime_Rule_9; $0)
C_DATE:C307(Cal4D_IsDaylightTime_Rule_9; $1)

//CAL4D_ISO_DATETIMESTR_ATZULU
C_TEXT:C284(Cal4D_ISO_DateTimeStr_AtZULU; $0)
C_DATE:C307(Cal4D_ISO_DateTimeStr_AtZULU; $1)
C_TIME:C306(Cal4D_ISO_DateTimeStr_AtZULU; $2)
C_TEXT:C284(Cal4D_ISO_DateTimeStr_AtZULU; $3)

//CAL4D_ISO_DATETIMESTRWITHZONE
C_TEXT:C284(Cal4D_ISO_DateTimeStrWithZone; $0)
C_DATE:C307(Cal4D_ISO_DateTimeStrWithZone; $1)
C_TIME:C306(Cal4D_ISO_DateTimeStrWithZone; $2)
C_TEXT:C284(Cal4D_ISO_DateTimeStrWithZone; $3)
C_TEXT:C284(Cal4D_ISO_DateTimeStrWithZone; $4)

//CAL4D_NAVBAR_HANDLER
C_LONGINT:C283(Cal4D_NavBar_Handler; $1)
C_TEXT:C284(Cal4D_NavBar_Handler; $2)

//CAL4D_NEWUUID
C_TEXT:C284(Cal4D_NewUUID; $0)
C_POINTER:C301(Cal4D_NewUUID; $1)
C_POINTER:C301(Cal4D_NewUUID; $2)

//CAL4D_PARSEARRAYS
C_POINTER:C301(Cal4D_ParseArrays; $1)

//CAL4D_OM_TIMEZONEPICKER
C_LONGINT:C283(Cal4D_OM_TimeZonePicker; $1)

//CAL4D_OM_TIMEARRAY
C_POINTER:C301(Cal4D_OM_TimeArray; $1)

//CAL4D_OM_POPCALENDAR_BTN
C_POINTER:C301(Cal4D_OM_PopCalendar_BTN; $1)

//CAL4D_OM_POPCALENDAR
C_POINTER:C301(Cal4D_OM_PopCalendar; $1)
C_LONGINT:C283(Cal4D_OM_PopCalendar; $2)

//CAL4D_OM_MINICALENDAR
C_POINTER:C301(Cal4D_OM_MiniCalendar; $1)
C_LONGINT:C283(Cal4D_OM_MiniCalendar; $2)
C_LONGINT:C283(Cal4D_OM_MiniCalendar; $3)
C_LONGINT:C283(Cal4D_OM_MiniCalendar; $4)

//CAL4D_OM_FULLCALENDAR
C_POINTER:C301(Cal4D_OM_FullCalendar; $1)
C_LONGINT:C283(Cal4D_OM_FullCalendar; $2)
C_LONGINT:C283(Cal4D_OM_FullCalendar; $3)
C_LONGINT:C283(Cal4D_OM_FullCalendar; $4)

//CAL4D_OM_DATEWIDGET
C_POINTER:C301(Cal4D_OM_DateWidget; $1)
C_LONGINT:C283(Cal4D_OM_DateWidget; $2)

//CAL4D_QUIT2
C_TEXT:C284(Cal4D_Quit2; $1)

//CAL4D_QUIT
C_TEXT:C284(Cal4D_Quit; $1)

//CAL4D_RRULETODATE
C_DATE:C307(Cal4D_RRuleToDate; $0)
C_TEXT:C284(Cal4D_RRuleToDate; $1)
C_DATE:C307(Cal4D_RRuleToDate; $2)

//CAL4D_TEXT_FOLD
C_TEXT:C284(Cal4D_Text_Fold; $0)
C_TEXT:C284(Cal4D_Text_Fold; $1)

//CAL4D_TEXT_UNFOLD
C_TEXT:C284(Cal4D_Text_Unfold; $0)
C_TEXT:C284(Cal4D_Text_Unfold; $1)

//CAL4D_TIME_PARSEISO8601
C_TEXT:C284(Cal4D_Time_ParseISO8601; $0)
C_TEXT:C284(Cal4D_Time_ParseISO8601; $1)
C_BOOLEAN:C305(Cal4D_Time_ParseISO8601; $2)

//CAL4D_TIMEZONE_SAVETODISK
C_TEXT:C284(Cal4D_TimeZone_SaveToDisk; $1)

//CAL4D_TRANSACTION
C_TEXT:C284(Cal4D_TRANSACTION; $1)

//CAL4D_UTIL_4DINDEXTOUSERINDEX
C_LONGINT:C283(Cal4D_UTIL_4DIndexToUserIndex; $0)
C_LONGINT:C283(Cal4D_UTIL_4DIndexToUserIndex; $1)

//CAL4D_UTIL_CAL4D_COLORTOINDEX
C_LONGINT:C283(Cal4D_UTIL_Cal4D_ColorToIndex; $0)
C_LONGINT:C283(Cal4D_UTIL_Cal4D_ColorToIndex; $1)

//CAL4D_UTIL_HOUROF
C_LONGINT:C283(Cal4D_UTIL_HourOf; $0)
C_TIME:C306(Cal4D_UTIL_HourOf; $1)

//CAL4D_UTIL_DATETIMESTAMP
C_TEXT:C284(Cal4D_Util_DateTimeStamp; $0)
C_DATE:C307(Cal4D_Util_DateTimeStamp; $1)
C_TIME:C306(Cal4D_Util_DateTimeStamp; $2)
C_TEXT:C284(Cal4D_Util_DateTimeStamp; $3)

//CAL4D_UTIL_COMPINDEXTO4DINDEX
C_LONGINT:C283(Cal4D_UTIL_CompIndexTo4DIndex; $0)
C_LONGINT:C283(Cal4D_UTIL_CompIndexTo4DIndex; $1)

//CAL4D_UTIL_CAL4D_INDEXTOCOLOR
C_LONGINT:C283(Cal4D_UTIL_Cal4D_IndexToColor; $0)
C_LONGINT:C283(Cal4D_UTIL_Cal4D_IndexToColor; $1)

//CAL4D_UTIL_MINUTEOF
C_LONGINT:C283(Cal4D_UTIL_MinuteOf; $0)
C_TIME:C306(Cal4D_UTIL_MinuteOf; $1)

//CAL4D_UTIL_RGBTORGBHEXSTRING
C_TEXT:C284(Cal4D_Util_RGBToRGBHexString; $0)
C_LONGINT:C283(Cal4D_Util_RGBToRGBHexString; $1)

//CAL4D_UTIL_RGBTORGBSTRING
C_TEXT:C284(Cal4D_Util_RGBToRGBString; $0)
C_LONGINT:C283(Cal4D_Util_RGBToRGBString; $1)

//CAL4D_UTIL_SECONDOF
C_LONGINT:C283(Cal4D_UTIL_SecondOf; $0)
C_TIME:C306(Cal4D_UTIL_SecondOf; $1)

//CAL4D_UTIL_USERINDEXTO4DINDEX
C_LONGINT:C283(Cal4D_UTIL_UserIndexTo4DIndex; $0)
C_LONGINT:C283(Cal4D_UTIL_UserIndexTo4DIndex; $1)

//CAL4D_WRITETIMEZONEXLF
C_TEXT:C284(Cal4D_WriteTimeZoneXLF; $1)
C_TEXT:C284(Cal4D_WriteTimeZoneXLF; $2)

//DOM_FINDELEMENTBYNAME
C_TEXT:C284(DOM_FindElementByName; $0)
C_TEXT:C284(DOM_FindElementByName; $1)
C_TEXT:C284(DOM_FindElementByName; $2)
C_LONGINT:C283(DOM_FindElementByName; $3)
C_BOOLEAN:C305(DOM_FindElementByName; $4)

//DOM_REFERENCEISVALID
C_BOOLEAN:C305(DOM_ReferenceIsValid; $0)
C_TEXT:C284(DOM_ReferenceIsValid; $1)

//CAL4D_UTIL_RGBHEX_TO_RGBDECIMAL
C_LONGINT:C283(CAl4D_UTIL_RGBHEX_TO_RGBDECIMAL; $0)
C_TEXT:C284(CAl4D_UTIL_RGBHEX_TO_RGBDECIMAL; $1)

//CAL4D_ICAL_GETTIMEZONES
C_POINTER:C301(Cal4D_iCal_GetTimezones; $1)
C_TEXT:C284(Cal4D_iCal_GetTimezones; $2)

//CAL4D_ICAL_GETTIMEZONEOFFSET
C_TEXT:C284(Cal4D_iCal_GetTimezoneOffset; $0)

//UTIL_POINTINRECT
C_BOOLEAN:C305(UTIL_PointInRect; $0)
C_LONGINT:C283(UTIL_PointInRect; $1)
C_LONGINT:C283(UTIL_PointInRect; $2)
C_POINTER:C301(UTIL_PointInRect; $3)
C_LONGINT:C283(UTIL_PointInRect; $4)
C_LONGINT:C283(UTIL_PointInRect; $5)
C_LONGINT:C283(UTIL_PointInRect; $6)
C_LONGINT:C283(UTIL_PointInRect; $7)

//CAL4D_CAL_SELECTEDORDDATE
C_LONGINT:C283(Cal4D_Cal_SelectedOrdDate; $0)
C_LONGINT:C283(Cal4D_Cal_SelectedOrdDate; $1)

//STR_POSITIONR
C_LONGINT:C283(STR_PositionR; $0)
C_TEXT:C284(STR_PositionR; $1)
C_TEXT:C284(STR_PositionR; $2)

//CAL4D_CAL_GETEVENTSINDURATION
C_LONGINT:C283(Cal4D_Cal_GetEventsInDuration; $0)
C_DATE:C307(Cal4D_Cal_GetEventsInDuration; $1)
C_TIME:C306(Cal4D_Cal_GetEventsInDuration; $2)
C_TIME:C306(Cal4D_Cal_GetEventsInDuration; $3)

//CAL4D_WEEKSTART_SAVETODISK
C_TEXT:C284(Cal4D_WeekStart_SaveToDisk; $1)

//STR_TRIM
C_TEXT:C284(STR_Trim; $0)
C_TEXT:C284(STR_Trim; $1)
C_TEXT:C284(STR_Trim; $2)

//UTIL_RANDOM
C_LONGINT:C283(UTIL_Random; $0)
C_LONGINT:C283(UTIL_Random; $1)
C_LONGINT:C283(UTIL_Random; $2)

//CAL4D_UTIL_RGBDECIMAL_TO_RGBHEX
C_TEXT:C284(CAl4D_UTIL_RGBDecimal_To_RGBHex; $0)
C_LONGINT:C283(CAl4D_UTIL_RGBDecimal_To_RGBHex; $1)
C_TEXT:C284(CAl4D_UTIL_RGBDecimal_To_RGBHex; $2)

//STRING_EQUALCASESENSITIVELY
C_BOOLEAN:C305(String_EqualCaseSensitively; $0)
C_TEXT:C284(String_EqualCaseSensitively; $1)
C_TEXT:C284(String_EqualCaseSensitively; $2)

//STR_COUNTFIELDS
C_LONGINT:C283(STR_CountFields; $0)
C_TEXT:C284(STR_CountFields; $1)
C_TEXT:C284(STR_CountFields; $2)

//SD_NAVBARHANDLER
C_LONGINT:C283(SD_NavBarHandler; $1)
C_TEXT:C284(SD_NavBarHandler; $2)

//SD2_NAVBARHANDLER
C_LONGINT:C283(SD2_navbarhandler; $1)
C_TEXT:C284(SD2_navbarhandler; $2)

//DB_MULTISORTARRAY
C_POINTER:C301(DB_MultiSortArray; $1)
C_POINTER:C301(DB_MultiSortArray; $2)

//SD2_GETWORKFLOWACTIONS
C_POINTER:C301(SD2_GetWorkflowActions; $1)
C_LONGINT:C283(SD2_GetWorkflowActions; $2)
C_LONGINT:C283(SD2_GetWorkflowActions; $3)

//SD2_PICMAKESVGCIRCLE
C_PICTURE:C286(SD2_PicMakeSVGcircle; $0)
C_LONGINT:C283(SD2_PicMakeSVGcircle; $1)
C_REAL:C285(SD2_PicMakeSVGcircle; $2)
C_REAL:C285(SD2_PicMakeSVGcircle; $3)

//SD2_EDITWORKFLOWSTATUSSETTINGS
C_TEXT:C284(SD2_EditworkflowStatusSettings; $1)
C_POINTER:C301(SD2_EditworkflowStatusSettings; $2)
C_POINTER:C301(SD2_EditworkflowStatusSettings; $3)
C_POINTER:C301(SD2_EditworkflowStatusSettings; $4)
C_POINTER:C301(SD2_EditworkflowStatusSettings; $5)
C_BOOLEAN:C305(SD2_EditworkflowStatusSettings; $6)

//DB_SELECTFOLDER
C_TEXT:C284(DB_SelectFolder; $0)
C_TEXT:C284(DB_SelectFolder; $1)
C_TEXT:C284(DB_SelectFolder; $2)

//DB_SELECTDOCUMENT
C_TEXT:C284(DB_SelectDocument; $0)
C_TEXT:C284(DB_SelectDocument; $1)
C_TEXT:C284(DB_SelectDocument; $2)
C_TEXT:C284(DB_SelectDocument; $3)
C_REAL:C285(DB_SelectDocument; $4)
C_POINTER:C301(DB_SelectDocument; $5)
C_TEXT:C284(DB_SelectDocument; $6)

//DB_OPENDOCUMENT
C_TIME:C306(DB_OpenDocument; $0)
C_TEXT:C284(DB_OpenDocument; $1)
C_TEXT:C284(DB_OpenDocument; $2)
C_LONGINT:C283(DB_OpenDocument; $3)

//DB_CREATEDOCUMENT
C_TIME:C306(DB_CreateDocument; $0)
C_TEXT:C284(DB_CreateDocument; $1)
C_TEXT:C284(DB_CreateDocument; $2)
C_TEXT:C284(DB_CreateDocument; $3)
C_BOOLEAN:C305(DB_CreateDocument; $4)
C_POINTER:C301(DB_CreateDocument; $5)
C_TEXT:C284(DB_CreateDocument; $6)

//SD2_GETDATASET
C_TEXT:C284(SD2_GetDataset; $0)
C_POINTER:C301(SD2_GetDataset; $1)
C_POINTER:C301(SD2_GetDataset; $2)
C_LONGINT:C283(SD2_GetDataset; $3)
C_DATE:C307(SD2_GetDataset; $4)
C_DATE:C307(SD2_GetDataset; $5)
C_TIME:C306(SD2_GetDataset; $6)
C_TIME:C306(SD2_GetDataset; $7)
C_LONGINT:C283(SD2_GetDataset; $8)
C_POINTER:C301(SD2_GetDataset; $9)
C_POINTER:C301(SD2_GetDataset; $10)

//SD2_SERVERSIDECREATEQUERY
C_TEXT:C284(SD2_ServerSideCreateQuery; $0)
C_BLOB:C604(SD2_ServerSideCreateQuery; $1)
C_POINTER:C301(SD2_ServerSideCreateQuery; $2)
C_POINTER:C301(SD2_ServerSideCreateQuery; $3)
C_POINTER:C301(SD2_ServerSideCreateQuery; $4)

//TBL_EDITINDEXES
C_LONGINT:C283(TBL_EditIndexes; $1)
C_BOOLEAN:C305(TBL_EditIndexes; $2)

//SD2_GETUSERACCESSRIGHTS
C_LONGINT:C283(SD2_GetuserAccessRights; $0)
C_LONGINT:C283(SD2_GetuserAccessRights; $1)
C_LONGINT:C283(SD2_GetuserAccessRights; $2)

//INVOICEITEMS_SEL
C_TEXT:C284(InvoiceItems_Sel; $1)
C_BOOLEAN:C305(InvoiceItems_Sel; $2)

//INVOICEITEMS_SELP
C_LONGINT:C283(InvoiceItems_SelP; $1)
C_POINTER:C301(InvoiceItems_SelP; $2)
C_POINTER:C301(InvoiceItems_SelP; $3)

//INVOICEITEMS_MOD
C_TEXT:C284(InvoiceItems_Mod; $1)
C_TEXT:C284(InvoiceItems_Mod; $2)
C_POINTER:C301(InvoiceItems_Mod; $3)

//TABLE_SETUP
C_BOOLEAN:C305(Table_Setup; $0)
C_LONGINT:C283(Table_Setup; $1)

//DB_EDITFIELDNAMES
C_TEXT:C284(DB_EditFieldNames; $0)
C_LONGINT:C283(DB_EditFieldNames; $1)
C_TEXT:C284(DB_EditFieldNames; $2)

//DB_EDITTABLENAMES
C_TEXT:C284(DB_EditTableNames; $0)
C_TEXT:C284(DB_EditTableNames; $1)

//REP_GETCOMPANY
C_TEXT:C284(REP_GetCompany; $1)

//ACC_ADDSUBENTITYANALYSES
C_TEXT:C284(ACC_AddSubEntityAnalyses; $1)

//CON_LOADCHARGES
C_BOOLEAN:C305(CON_LoadCharges; $1)
C_REAL:C285(CON_LoadCharges; $2)

//DB_SETALLTRIGGERS
C_LONGINT:C283(DB_SetAlltriggers; $2)
C_TEXT:C284(Gen_CULPB; ${-1})

//INT_SETDIALOG
C_BOOLEAN:C305(INT_SetDialog; $1)

//FUR_FILLLISTBOXAREA
C_POINTER:C301(FUR_FillListBoxArea; $2)

//AAJUNK_8
C_BOOLEAN:C305(AAjunk_8; $1)

//SD2_MINUTESTOTIMESTRING
C_TEXT:C284(SD2_MinutestoTimeString; $0)
C_LONGINT:C283(SD2_MinutestoTimeString; $1)

//GEN_REQUESTDATE
C_DATE:C307(Gen_RequestDate; $0)
C_TEXT:C284(Gen_RequestDate; $1)
C_LONGINT:C283(Gen_RequestDate; $2)
C_DATE:C307(Gen_RequestDate; $3)
C_TEXT:C284(Gen_RequestDate; $4)
C_TEXT:C284(Gen_RequestDate; $5)
C_LONGINT:C283(Gen_RequestDate; $6)
C_LONGINT:C283(Gen_RequestDate; $7)
C_TEXT:C284(Gen_RequestDate; $8)

//SD2_SETUPACTIONUSAGE
C_BOOLEAN:C305(SD2_SetupActionUsage; $0)
C_TEXT:C284(SD2_SetupActionUsage; ${-1})
C_TEXT:C284(SD2_SetupActionUsage; $1)

//GEN_REQUESTVIAPOPUP
C_LONGINT:C283(GEN_RequestViaPopUp; $0)
C_POINTER:C301(GEN_RequestViaPopUp; $1)
C_POINTER:C301(GEN_RequestViaPopUp; $2)
C_TEXT:C284(GEN_RequestViaPopUp; $3)
C_BOOLEAN:C305(GEN_RequestViaPopUp; $4)
C_POINTER:C301(GEN_RequestViaPopUp; $5)
C_TEXT:C284(GEN_RequestViaPopUp; $6)
C_TEXT:C284(GEN_RequestViaPopUp; $7)
C_LONGINT:C283(GEN_RequestViaPopUp; $8)

//GEN_SETOBJECTPOSITION
C_LONGINT:C283(Gen_SetObjectPosition; $0)
C_POINTER:C301(Gen_SetObjectPosition; $1)
C_LONGINT:C283(Gen_SetObjectPosition; $2)
C_LONGINT:C283(Gen_SetObjectPosition; $3)
C_LONGINT:C283(Gen_SetObjectPosition; $4)
C_LONGINT:C283(Gen_SetObjectPosition; $5)
C_POINTER:C301(Gen_SetObjectPosition; $6)

//GEN_SETOBJECTPOSITIONBYNAME
C_LONGINT:C283(Gen_SetobjectPositionByname; $0)
C_TEXT:C284(Gen_SetobjectPositionByname; $1)
C_LONGINT:C283(Gen_SetobjectPositionByname; $2)
C_LONGINT:C283(Gen_SetobjectPositionByname; $3)
C_LONGINT:C283(Gen_SetobjectPositionByname; $4)
C_LONGINT:C283(Gen_SetobjectPositionByname; $5)
C_POINTER:C301(Gen_SetobjectPositionByname; $6)

//GEN_SETOBJECTPOSITIONRELATIVITY
C_POINTER:C301(Gen_SetobjectPositionRelativity; $1)
C_POINTER:C301(Gen_SetobjectPositionRelativity; $2)
C_TEXT:C284(Gen_SetobjectPositionRelativity; $3)
C_TEXT:C284(Gen_SetobjectPositionRelativity; $4)
C_REAL:C285(Gen_SetobjectPositionRelativity; $5)
C_REAL:C285(Gen_SetobjectPositionRelativity; $6)
C_REAL:C285(Gen_SetobjectPositionRelativity; $7)
C_REAL:C285(Gen_SetobjectPositionRelativity; $8)

//INT_SETLONGINTCHECKFORMAT
C_POINTER:C301(INT_SetLongintCheckFormat; $1)

//SD2_ONSAVERECORD
C_LONGINT:C283(SD2_OnSaveRecord; $1)
C_REAL:C285(SD2_OnSaveRecord; $2)

//ACCBAL BAL
C_TEXT:C284(AccBal Bal; $1)
C_TEXT:C284(AccBal Bal; $2)

//ACC_BalSelect
C_BOOLEAN:C305(ACC_BalSelect; $4)

//Companies_Arr2
C_TEXT:C284(Companies_Arr2; $4)
C_TEXT:C284(Companies_Arr2; $5)
C_TEXT:C284(Companies_Arr2; $6)
C_TEXT:C284(Companies_Arr2; $7)
C_TEXT:C284(Companies_Arr2; $8)
C_TEXT:C284(Companies_Arr2; $9)
C_TEXT:C284(Companies_Arr2; $10)
C_TEXT:C284(Companies_Arr2; $11)
C_TEXT:C284(Companies_Arr2; $12)
C_TEXT:C284(Companies_Arr2; $13)
C_TEXT:C284(Companies_Arr2; $14)

//DB_MENUACTION
C_TEXT:C284(DB_MenuAction; $7)

//Gen_ListApply
C_LONGINT:C283(Gen_ListApply; $3)

//Gen_SetModCol
C_LONGINT:C283(Gen_SetModCol; $1)

//In_Allowed
C_POINTER:C301(In_Allowed; $2)

//Inv_InvCalc
C_TEXT:C284(Inv_InvCalc; $1)
C_POINTER:C301(Inv_InvCalc; $2)
C_POINTER:C301(Inv_InvCalc; $3)
C_POINTER:C301(Inv_InvCalc; $4)

//Invoices_ADCalc
C_DATE:C307(Invoices_ADCalc; $2)
C_DATE:C307(Invoices_ADCalc; $3)

//Invoices_ADTot
C_TEXT:C284(Invoices_ADTot; $1)
C_DATE:C307(Invoices_ADTot; $2)
C_REAL:C285(Invoices_ADTot; $3)
C_REAL:C285(Invoices_ADTot; $4)
C_REAL:C285(Invoices_ADTot; $5)

//Invoices_Tot
C_POINTER:C301(Invoices_Tot; $1)
C_POINTER:C301(Invoices_Tot; $2)
C_REAL:C285(Invoices_Tot; $3)

//Letter_Email
C_POINTER:C301(Letter_Email; $1)

//Letter_FaxSetup
C_POINTER:C301(Letter_FaxSetup; $2)

//Macro_FileUpd
C_LONGINT:C283(Macro_FileUpd; $1)

//Mail_SubsUp
C_POINTER:C301(Mail_SubsUp; $1)

//MailP_Env
C_POINTER:C301(MailP_Env; $1)

//MailP_Exp
C_POINTER:C301(MailP_Exp; $1)

//MailP_Lab
C_POINTER:C301(MailP_Lab; $1)

//MailP_LetEmail
C_POINTER:C301(MailP_LetEmail; $1)

//MailP_LetFax
C_POINTER:C301(MailP_LetFax; $1)

//MAsk_Print
C_POINTER:C301(MAsk_Print; $1)

//Menu_ModBarButt
C_LONGINT:C283(Menu_ModBarButt; $2)
C_POINTER:C301(Menu_ModBarButt; $3)
C_LONGINT:C283(Menu_ModBarButt; $4)
C_POINTER:C301(Menu_ModBarButt; $5)

//Minor_In
C_BOOLEAN:C305(Minor_In; $4)

//Minor_Sort
C_POINTER:C301(Minor_Sort; $1)

//Move_InPost
C_TEXT:C284(Move_InPost; $1)
C_TEXT:C284(Move_InPost; $2)
C_BOOLEAN:C305(Move_InPost; $3)
C_TEXT:C284(Move_InPost; $4)
C_TEXT:C284(Move_InPost; $5)

//Move_PostLevCur
C_TEXT:C284(Move_PostLevCur; $3)
C_TEXT:C284(Move_PostLevCur; $4)
C_TEXT:C284(Move_PostLevCur; $5)
C_TEXT:C284(Move_PostLevCur; $6)
C_LONGINT:C283(Move_PostLevCur; $7)
C_REAL:C285(Move_PostLevCur; $8)
C_REAL:C285(Move_PostLevCur; $9)

//Move_PostNom
C_TEXT:C284(Move_PostNom; $1)
C_DATE:C307(Move_PostNom; $2)
C_TEXT:C284(Move_PostNom; $3)
C_TEXT:C284(Move_PostNom; $4)
C_TEXT:C284(Move_PostNom; $5)
C_REAL:C285(Move_PostNom; $6)
C_TEXT:C284(Move_PostNom; $7)
C_TEXT:C284(Move_PostNom; $8)
C_TEXT:C284(Move_PostNom; $9)
C_TEXT:C284(Move_PostNom; $10)
C_TEXT:C284(Move_PostNom; $11)

//OrdDel_StockP
C_TEXT:C284(OrdDel_StockP; $1)
C_TEXT:C284(OrdDel_StockP; $2)
C_TEXT:C284(OrdDel_StockP; $3)
C_TEXT:C284(OrdDel_StockP; $4)
C_TEXT:C284(OrdDel_StockP; $5)

//OrderI_AllOIUp2
C_REAL:C285(OrderI_AllOIUp2; $3)
C_POINTER:C301(OrderI_AllOIUp2; $4)
C_POINTER:C301(OrderI_AllOIUp2; $5)
C_POINTER:C301(OrderI_AllOIUp2; $6)
C_POINTER:C301(OrderI_AllOIUp2; $7)
C_TEXT:C284(OrderI_AllOIUp2; $8)

//OrderI_AllSTChk
C_TEXT:C284(OrderI_AllSTChk; $1)

//Post_Amount
C_LONGINT:C283(Post_Amount; $0)
C_TEXT:C284(Post_Amount; $6)
C_TEXT:C284(Post_Amount; $7)
C_TEXT:C284(Post_Amount; $8)
C_TEXT:C284(Post_Amount; $9)
C_DATE:C307(Post_Amount; $10)
C_DATE:C307(Post_Amount; $11)
C_TEXT:C284(Post_Amount; $12)
C_TEXT:C284(Post_Amount; $13)
C_TEXT:C284(Post_Amount; $14)
C_TEXT:C284(Post_Amount; $15)
C_TEXT:C284(Post_Amount; $16)
C_TEXT:C284(Post_Amount; $17)
C_TEXT:C284(Post_Amount; $18)
C_TEXT:C284(Post_Amount; $19)
C_LONGINT:C283(Post_Amount; $20)
C_TEXT:C284(Post_Amount; $21)
C_TEXT:C284(Post_Amount; $22)
C_TEXT:C284(Post_Amount; $23)

//Post_Balances
C_REAL:C285(Post_Balances; $0)

//PROD_LOADGRAPHIC
C_BOOLEAN:C305(Prod_LoadGraphic; $0)

//Purch_InLPB
C_BOOLEAN:C305(Purch_InLPB; $1)

//Purchases_ACTot
C_TEXT:C284(Purchases_ACTot; $1)
C_TEXT:C284(Purchases_ACTot; $2)
C_TEXT:C284(Purchases_ACTot; $3)
C_REAL:C285(Purchases_ACTot; $4)

//Record_FKey
C_LONGINT:C283(Record_FKey; $1)
C_TEXT:C284(Record_FKey; $2)

//StockCurr_ACLSr
C_BOOLEAN:C305(StockCurr_ACLSr; $1)

//UPPERS2
C_LONGINT:C283(Uppers2; $3)

//WS_ADDDIARYITEMOWNER
C_TEXT:C284(WS_AddDiaryitemOwner; $1)
C_TEXT:C284(WS_AddDiaryitemOwner; $2)

//ZACCBAL BAL
C_TEXT:C284(ZAccBal_Bal; $1)
C_TEXT:C284(ZAccBal_Bal; $2)
C_POINTER:C301(ZAccBal_Bal; $3)

//ZResults_Mod
C_TEXT:C284(ZResults_Mod; $1)
C_TEXT:C284(ZResults_Mod; $2)
C_POINTER:C301(ZResults_Mod; $3)

//Companies_In_NEW
C_BOOLEAN:C305(Companies_In_NEW; $1)
C_BOOLEAN:C305(Companies_In_NEW; $2)

//SD2_DIARYINLPX
C_BOOLEAN:C305(SD2_DiaryinLPX; $3)

//BAR_t_ButtonMETHOD
C_POINTER:C301(BAR_ButtonMethod; $2)

//CHECK_PURCHASEORDER
C_BOOLEAN:C305(Check_Purchaseorder; $3)

//STK_SHOWSUPPLIERPRODUCTS
C_LONGINT:C283(STK_ShowSupplierProducts; $1)
C_TEXT:C284(STK_ShowSupplierProducts; $2)
C_LONGINT:C283(STK_ShowSupplierProducts; $3)
C_LONGINT:C283(STK_ShowSupplierProducts; $4)

//DB_GETINDEXEDSTRING
C_TEXT:C284(DB_GetIndexedString; $0)
C_LONGINT:C283(DB_GetIndexedString; $1)
C_LONGINT:C283(DB_GetIndexedString; $2)
C_TEXT:C284(DB_GetIndexedString; $3)
C_REAL:C285(DB_GetIndexedString; $4)

//SD2_TESTNEWDIARYSCREENS
C_LONGINT:C283(SD2_TestNewDiaryScreens; $1)

//CHECK_SALESINVOICE
C_POINTER:C301(Check_SalesInvoice; $1)
C_POINTER:C301(Check_SalesInvoice; $2)
C_BOOLEAN:C305(Check_SalesInvoice; $3)

//CHECK_PURCHASEINVOICES
C_POINTER:C301(Check_PurchaseInvoices; $1)
C_POINTER:C301(Check_PurchaseInvoices; $2)
C_BOOLEAN:C305(Check_PurchaseInvoices; $3)

//CHECK_STOCKMOVEMENTS
C_POINTER:C301(Check_StockMovements; $1)
C_POINTER:C301(Check_StockMovements; $2)

//CHECK_SERVICECALLS
C_POINTER:C301(Check_serviceCalls; $1)
C_POINTER:C301(Check_serviceCalls; $2)

//STK_MOVEPOSTLEVELINPROCESS
C_TEXT:C284(STK_MovePostLevelinProcess; $1)
C_LONGINT:C283(STK_MovePostLevelinProcess; $2)
C_TEXT:C284(STK_MovePostLevelinProcess; $3)
C_TEXT:C284(STK_MovePostLevelinProcess; $4)
C_TEXT:C284(STK_MovePostLevelinProcess; $5)
C_TEXT:C284(STK_MovePostLevelinProcess; $6)
C_LONGINT:C283(STK_MovePostLevelinProcess; $7)
C_REAL:C285(STK_MovePostLevelinProcess; $8)
C_REAL:C285(STK_MovePostLevelinProcess; $9)

//STK_REVERSEUNIQUE
C_TEXT:C284(STK_ReverseUnique; $1)
C_POINTER:C301(STK_ReverseUnique; $2)
C_POINTER:C301(STK_ReverseUnique; $3)
C_POINTER:C301(STK_ReverseUnique; $4)
C_POINTER:C301(STK_ReverseUnique; $5)
C_POINTER:C301(STK_ReverseUnique; $6)

//STK_MOVEPOSTLEVELSARRAY
C_TEXT:C284(STK_MovePostLevelsArray; $1)
C_TEXT:C284(STK_MovePostLevelsArray; $2)
C_TEXT:C284(STK_MovePostLevelsArray; $3)
C_TEXT:C284(STK_MovePostLevelsArray; $4)
C_TEXT:C284(STK_MovePostLevelsArray; $5)
C_REAL:C285(STK_MovePostLevelsArray; $6)
C_REAL:C285(STK_MovePostLevelsArray; $7)
C_REAL:C285(STK_MovePostLevelsArray; $8)
C_REAL:C285(STK_MovePostLevelsArray; $9)

//STK_CURRENTACLSR
C_TEXT:C284(STK_CurrentACLsr; $1)
C_TEXT:C284(STK_CurrentACLsr; $2)
C_TEXT:C284(STK_CurrentACLsr; $3)

//STK_MOVEPOSTITEM
C_POINTER:C301(STK_MovePostItem; $1)
C_LONGINT:C283(STK_MovePostItem; $2)
C_POINTER:C301(STK_MovePostItem; $3)
C_DATE:C307(STK_MovePostItem; $4)
C_BOOLEAN:C305(STK_MovePostItem; $5)
C_BOOLEAN:C305(STK_MovePostItem; $6)
C_TEXT:C284(STK_MovePostItem; $7)
C_TEXT:C284(STK_MovePostItem; $8)
C_TEXT:C284(STK_MovePostItem; $9)
C_TEXT:C284(STK_MovePostItem; $10)
C_REAL:C285(STK_MovePostItem; $11)
C_TEXT:C284(STK_MovePostItem; $12)
C_TEXT:C284(STK_MovePostItem; $13)
C_REAL:C285(STK_MovePostItem; $14)
C_TEXT:C284(STK_MovePostItem; $15)
C_REAL:C285(STK_MovePostItem; $16)
C_REAL:C285(STK_MovePostItem; $17)

//ORDERITEM_ALLOCATIONUPDATE
C_BOOLEAN:C305(OrderItem_AllocationUpdate; $0)
C_POINTER:C301(OrderItem_AllocationUpdate; $1)
C_POINTER:C301(OrderItem_AllocationUpdate; $2)
C_POINTER:C301(OrderItem_AllocationUpdate; $3)
C_POINTER:C301(OrderItem_AllocationUpdate; $4)
C_TEXT:C284(OrderItem_AllocationUpdate; $5)
C_REAL:C285(OrderItem_AllocationUpdate; $6)
C_REAL:C285(OrderItem_AllocationUpdate; $7)
C_POINTER:C301(OrderItem_AllocationUpdate; $8)
C_POINTER:C301(OrderItem_AllocationUpdate; $9)
C_POINTER:C301(OrderItem_AllocationUpdate; $10)

//TRANS_INVPOSTITEMS
C_BOOLEAN:C305(TRANS_InvPostItems; $0)
C_TEXT:C284(TRANS_InvPostItems; $1)
C_REAL:C285(TRANS_InvPostItems; $2)
C_REAL:C285(TRANS_InvPostItems; $3)
C_REAL:C285(TRANS_InvPostItems; $4)
C_TEXT:C284(TRANS_InvPostItems; $5)
C_TEXT:C284(TRANS_InvPostItems; $6)
C_TEXT:C284(TRANS_InvPostItems; $7)
C_TEXT:C284(TRANS_InvPostItems; $8)
C_DATE:C307(TRANS_InvPostItems; $9)
C_TEXT:C284(TRANS_InvPostItems; $10)
C_TEXT:C284(TRANS_InvPostItems; $11)
C_TEXT:C284(TRANS_InvPostItems; $12)

//TRNS_CREATEBATCH
C_REAL:C285(TRNS_CreateBatch; $1)
C_DATE:C307(TRNS_CreateBatch; $2)
C_DATE:C307(TRNS_CreateBatch; $3)
C_TEXT:C284(TRNS_CreateBatch; $4)
C_TEXT:C284(TRNS_CreateBatch; $5)
C_TEXT:C284(TRNS_CreateBatch; $6)
C_TEXT:C284(TRNS_CreateBatch; $7)
C_REAL:C285(TRNS_CreateBatch; $8)
C_REAL:C285(TRNS_CreateBatch; $9)
C_REAL:C285(TRNS_CreateBatch; $10)
C_TEXT:C284(TRNS_CreateBatch; $11)
C_TEXT:C284(TRNS_CreateBatch; $12)
C_TEXT:C284(TRNS_CreateBatch; $13)
C_TEXT:C284(TRNS_CreateBatch; $14)
C_TEXT:C284(TRNS_CreateBatch; $15)
C_TEXT:C284(TRNS_CreateBatch; $16)

//TRANSB_POSTUPDATEPURCHINVOICE
C_REAL:C285(TransB_postUpdatePurchInvoice; $1)
C_TEXT:C284(TransB_postUpdatePurchInvoice; $2)
C_TEXT:C284(TransB_postUpdatePurchInvoice; $3)
C_TEXT:C284(TransB_postUpdatePurchInvoice; $4)
C_TEXT:C284(TransB_postUpdatePurchInvoice; $5)
C_TEXT:C284(TransB_postUpdatePurchInvoice; $6)
C_TEXT:C284(TransB_postUpdatePurchInvoice; $7)
C_REAL:C285(TransB_postUpdatePurchInvoice; $8)
C_DATE:C307(TransB_postUpdatePurchInvoice; $9)
C_TEXT:C284(TransB_postUpdatePurchInvoice; $10)
C_TEXT:C284(TransB_postUpdatePurchInvoice; $11)
C_TEXT:C284(TransB_postUpdatePurchInvoice; $12)
C_TEXT:C284(TransB_postUpdatePurchInvoice; $13)
C_TEXT:C284(TransB_postUpdatePurchInvoice; $14)
C_TEXT:C284(TransB_postUpdatePurchInvoice; $15)

//TRANSB_POSTUPDATESALESINVOICE
C_LONGINT:C283(TransB_PostUpdateSalesInvoice; $1)
C_TEXT:C284(TransB_PostUpdateSalesInvoice; $2)
C_TEXT:C284(TransB_PostUpdateSalesInvoice; $3)
C_TEXT:C284(TransB_PostUpdateSalesInvoice; $4)
C_TEXT:C284(TransB_PostUpdateSalesInvoice; $5)
C_TEXT:C284(TransB_PostUpdateSalesInvoice; $6)
C_REAL:C285(TransB_PostUpdateSalesInvoice; $7)
C_DATE:C307(TransB_PostUpdateSalesInvoice; $8)
C_TEXT:C284(TransB_PostUpdateSalesInvoice; $9)
C_TEXT:C284(TransB_PostUpdateSalesInvoice; $10)
C_TEXT:C284(TransB_PostUpdateSalesInvoice; $11)
C_TEXT:C284(TransB_PostUpdateSalesInvoice; $12)
C_TEXT:C284(TransB_PostUpdateSalesInvoice; $13)
C_TEXT:C284(TransB_PostUpdateSalesInvoice; $14)
C_TEXT:C284(TransB_PostUpdateSalesInvoice; $15)

//STK_VALIDATELEVEL
C_TEXT:C284(STK_ValidateLevel; $1)
C_TEXT:C284(STK_ValidateLevel; $2)
C_TEXT:C284(STK_ValidateLevel; $3)
C_TEXT:C284(STK_ValidateLevel; $4)
C_TEXT:C284(STK_ValidateLevel; $5)

//PROCESSSERVICE_CURRENTSTOCK
C_BOOLEAN:C305(ProcessService_Currentstock; $0)

//DB_ADDTOMENU
C_TEXT:C284(DB_AddToMenu; $1)
C_TEXT:C284(DB_AddToMenu; $2)
C_LONGINT:C283(DB_AddToMenu; $3)
C_TEXT:C284(DB_AddToMenu; $4)
C_TEXT:C284(DB_AddToMenu; $5)
C_TEXT:C284(DB_AddToMenu; $6)
C_TEXT:C284(DB_AddToMenu; $7)

//SEL_NEXTRECORDSSELECTION
C_LONGINT:C283(SEL_NextRecordsSelection; $1)

//DB_CREATEREPORT
C_POINTER:C301(DB_CreateReport; $0)

//DB_MENUCREATEFUNCTIONSMENU
C_TEXT:C284(DB_MenuCreateFunctionsMenu; $0)
C_LONGINT:C283(DB_MenuCreateFunctionsMenu; $1)
C_TEXT:C284(DB_MenuCreateFunctionsMenu; $2)

//DB_BUILDSELECTIONSMENUITEMS
C_TEXT:C284(DB_BuildSelectionsMenuitems; $1)
C_REAL:C285(DB_BuildSelectionsMenuitems; $2)

//DB_SETBROWSERBARSELECTION
C_LONGINT:C283(DB_SetBrowserBarSelection; $1)
C_POINTER:C301(DB_SetBrowserBarSelection; $2)
C_LONGINT:C283(DB_SetBrowserBarSelection; $3)
C_POINTER:C301(DB_SetBrowserBarSelection; $4)

//DB_MENUCREATERECORDSMENU
C_TEXT:C284(DB_MenuCreateRecordsMenu; $0)
C_REAL:C285(DB_MenuCreateRecordsMenu; $1)
C_TEXT:C284(DB_MenuCreateRecordsMenu; $2)

//DB_MENUCREATESELECTIONSMENU
C_TEXT:C284(DB_MenuCreateSelectionsMenu; $0)
C_LONGINT:C283(DB_MenuCreateSelectionsMenu; $1)
C_TEXT:C284(DB_MenuCreateSelectionsMenu; $2)

//DB_MENUCREATEREPORTSMENU
C_TEXT:C284(DB_MenuCreateReportsMenu; $0)
C_LONGINT:C283(DB_MenuCreateReportsMenu; $1)
C_TEXT:C284(DB_MenuCreateReportsMenu; $2)

//DB_MENUCREATEFILEMENU
C_TEXT:C284(DB_MenuCreateFileMenu; $0)
C_REAL:C285(DB_MenuCreateFileMenu; $1)
C_TEXT:C284(DB_MenuCreateFileMenu; $2)

//DB_SETFORMCACHE
C_LONGINT:C283(DB_SetFormCache; $1)
C_TEXT:C284(DB_SetFormCache; $2)

//DB_SETFORMMENU
C_REAL:C285(DB_SetFormmenu; $1)
C_TEXT:C284(DB_SetFormmenu; $2)
C_BOOLEAN:C305(DB_SetFormmenu; $3)

//DB_MENUCREATEEDITMENU
C_TEXT:C284(DB_MenuCreateEditMenu; $0)
C_LONGINT:C283(DB_MenuCreateEditMenu; $1)
C_TEXT:C284(DB_MenuCreateEditMenu; $2)

//DB_BUILDVOLUMESMENU
C_TEXT:C284(DB_BuildVolumesMenu; $0)

//DB_BUILDMODULEMENU
C_TEXT:C284(DB_BuildModuleMenu; $0)
C_TEXT:C284(DB_BuildModuleMenu; ${2})
C_TEXT:C284(DB_BuildModuleMenu; $1)

//DB_CREATEFILEMENU
C_TEXT:C284(DB_CreateFilemenu; $0)

//DB_CREATEEDITMENU
C_TEXT:C284(DB_CreateEditMenu; $0)

//DB_SETNEWTOOLBAR
C_LONGINT:C283(DB_SetnewToolBar; $0)

//DB_SETFORMBUTTONS
C_LONGINT:C283(DB_SetFormButtons; $1)
C_TEXT:C284(DB_SetFormButtons; $2)

//DB_SETFORMLAYOUT
C_LONGINT:C283(DB_SetFormLayout; $1)
C_TEXT:C284(DB_SetFormLayout; $2)
C_LONGINT:C283(DB_SetFormLayout; $3)

//DB_BEFOREFORMLOAD
C_BOOLEAN:C305(DB_BeforeFormLoad; $0)

//DB_FORMTOFUNCTION
C_TEXT:C284(DB_FormtoFunction; $0)
C_TEXT:C284(DB_FormtoFunction; $1)

//DB_SETFORMSIZE
C_LONGINT:C283(DB_SetFormSize; $1)
C_POINTER:C301(DB_SetFormSize; $2)
C_LONGINT:C283(DB_SetFormSize; $3)
C_LONGINT:C283(DB_SetFormSize; $4)
C_BOOLEAN:C305(DB_SetFormSize; $5)
C_LONGINT:C283(DB_SetFormSize; $6)

//DB_SETFORMTABS
C_REAL:C285(DB_SetFormTabs; $1)
C_TEXT:C284(DB_SetFormTabs; $2)
C_POINTER:C301(DB_SetFormTabs; $3)
C_POINTER:C301(DB_SetFormTabs; $4)

//LBI_ADDDEF07TO99
C_REAL:C285(LBI_AddDef07to99; $1)

//SEL_ALLRECORDS
C_TEXT:C284(SEL_AllRecords; $1)

//SEL_UPDATERECORDCACHE
C_LONGINT:C283(SEL_UpdateRecordCache; $1)
C_TEXT:C284(SEL_UpdateRecordCache; $2)

//DB_SetFormSortOrder
C_REAL:C285(DB_SetFormSortOrder; $0)
C_REAL:C285(DB_SetFormSortOrder; $1)
C_TEXT:C284(DB_SetFormSortOrder; $2)
C_LONGINT:C283(DB_SetFormSortOrder; $3)
C_LONGINT:C283(DB_SetFormSortOrder; $4)

//DB_OUTEDITRECORD
C_REAL:C285(DB_OutEditRecord; $1)
C_POINTER:C301(DB_AddTab; ${1})

//Contacts_In_New
C_BOOLEAN:C305(Contacts_In_New; $1)
C_BOOLEAN:C305(Contacts_In_New; $2)

//SETTRANSINSTATUS
C_TEXT:C284(SetTransinStatus; $0)

//STK_SUMLEVELS
C_REAL:C285(STK_SumLevels; $0)

//STK_SUMCOSTS
C_REAL:C285(STK_SumCosts; $0)

//STATUS_USAGETOTEXT
C_TEXT:C284(STATUS_usagetoText; $0)

//TRANS_GETNEXTJOURNALDATE
C_DATE:C307(TRANS_GetNextJournalDate; $0)

//PI_GETSTATUS
C_TEXT:C284(PI_GetStatus; $0)

//PI_GETAGE
C_TEXT:C284(PI_GetAge; $0)

//PI_GETOVERDUE
C_TEXT:C284(PI_GetOverdue; $0)

//PRJ_GETSTATE
C_TEXT:C284(PRJ_GetState; $0)

//PT_PRICE
C_REAL:C285(PT_Price; $0)

//PT_DISCOUNT
C_REAL:C285(PT_Discount; $0)

//PG_ISPRICEBASED
C_TEXT:C284(PG_isPriceBased; $0)

//PG_ISDISCOUNTBASED
C_TEXT:C284(PG_isDiscountBased; $0)

//JOB_GETSTATE
C_TEXT:C284(JOB_GetState; $0)

//JOBPERS_GETPERSONNAME
C_TEXT:C284(JobPers_GetPersonName; $0)

//INV_GETSTATE
C_TEXT:C284(INV_GetState; $0)

//INV_GETAGE
C_TEXT:C284(INV_GetAge; $0)

//INV_GETOVERDUE
C_TEXT:C284(INV_GetOverdue; $0)

//GRP_GETSALESACCOUNT
C_TEXT:C284(GRP_GetSalesAccount; $0)

//GRP_GETSTOCKACCOUNT
C_TEXT:C284(GRP_GetStockAccount; $0)

//GRP_GETPURCHASEACCOUNT
C_TEXT:C284(GRP_GetPurchaseAccount; $0)

//FF_GETDATA
C_TEXT:C284(FF_GetData; $0)

//DOC_GETDOCUMENTCLASS
C_TEXT:C284(DOC_GetDocumentClass; $0)

//DIA_GETDOCRECIPIENT
C_TEXT:C284(DIA_GetDocRecipient; $0)

//CONTR_GETSTATUS
C_BOOLEAN:C305(CONTR_GetStatus; $0)

//DOC_GETDOCUMENTTEXT
C_TEXT:C284(DOC_GetDocumentText; $0)

//ORD_GETSTATE
C_TEXT:C284(ORD_GetState; $0)

//ORD_GETFORECASTDATE
C_TEXT:C284(ORD_GetforecastDate; $0)

//ORD_GETFORECASTPERCENT
C_TEXT:C284(ORD_GetforecastPercent; $0)

//LB_GETRELATION
C_LONGINT:C283(LB_GetRelation; $1)
C_LONGINT:C283(LB_GetRelation; $2)

//DB_HIDESHOWSEARCH
C_REAL:C285(DB_HideShowSearch; $1)
C_POINTER:C301(SM_BlobtoSeachVars; ${-1})
C_POINTER:C301(SM_BlobtoSeachVars; $1)
C_POINTER:C301(SM_BlobtoSeachVars; $2)
C_POINTER:C301(SM_BlobtoSeachVars; $3)
C_POINTER:C301(SM_BlobtoSeachVars; $4)
C_POINTER:C301(SM_BlobtoSeachVars; $5)
C_POINTER:C301(SM_BlobtoSeachVars; $6)
C_POINTER:C301(SM_BlobtoSeachVars; $7)
C_POINTER:C301(SM_BlobtoSeachVars; $8)
C_POINTER:C301(SM_BlobtoSeachVars; $9)
C_POINTER:C301(SM_BlobtoSeachVars; $10)
C_POINTER:C301(SM_BlobtoSeachVars; $11)
C_POINTER:C301(SM_BlobtoSeachVars; $12)
C_POINTER:C301(SM_BlobtoSeachVars; $13)
C_POINTER:C301(SM_BlobtoSeachVars; $14)
C_POINTER:C301(SM_BlobtoSeachVars; $15)
C_POINTER:C301(SM_BlobtoSeachVars; $16)
C_POINTER:C301(SM_BlobtoSeachVars; $17)
C_POINTER:C301(SM_BlobtoSeachVars; $18)
C_POINTER:C301(SM_BlobtoSeachVars; $19)
C_POINTER:C301(SM_BlobtoSeachVars; $20)
C_POINTER:C301(SM_BlobtoSeachVars; $21)
C_POINTER:C301(SM_BlobtoSeachVars; $22)
C_POINTER:C301(SM_BlobtoSeachVars; $23)
C_POINTER:C301(SM_BlobtoSeachVars; $24)
C_POINTER:C301(SM_BlobtoSeachVars; $25)
C_POINTER:C301(SM_BlobtoSeachVars; $26)
C_POINTER:C301(SM_BlobtoSeachVars; $27)
C_POINTER:C301(SM_BlobtoSeachVars; $28)
C_POINTER:C301(SM_BlobtoSeachVars; $29)

//DB_GETRELATEDRECORDS
C_REAL:C285(DB_GetRelatedRecords; $1)
C_REAL:C285(DB_GetRelatedRecords; $2)

//Minor_Sel2
C_TEXT:C284(Minor_Sel2; $1)
C_POINTER:C301(Minor_Sel2; $2)
C_POINTER:C301(Minor_Sel2; $3)
C_POINTER:C301(Minor_Sel2; $4)

//TRANSB_SEL2
C_TEXT:C284(TransB_Sel2; $1)

//STOCKLEV_SEL2
C_TEXT:C284(StockLev_Sel2; $1)

//STOCKITEMS_SEL2
C_TEXT:C284(StockItems_Sel2; $1)

//CALLS_SEL2
C_TEXT:C284(Calls_Sel2; $1)

//PURCHASES_SEL2
C_BOOLEAN:C305(Purchases_sel2; $0)
C_TEXT:C284(Purchases_sel2; $1)

//PURCHASEORDERS_SEL2
C_TEXT:C284(PurchaseOrders_Sel2; $1)

//PROJECTS_SEL2
C_TEXT:C284(Projects_Sel2; $1)

//PRICETABLE_SEL2
C_TEXT:C284(PriceTable_Sel2; $1)

//JOBS_SEL2
C_TEXT:C284(Jobs_Sel2; $1)

//JOBSTAGES_SEL2
C_TEXT:C284(JobStages_Sel2; $1)

//JOBPERSONNEL_SEL2
C_TEXT:C284(JobPersonnel_Sel2; $1)

//INVOICEITEMS_SEL2
C_TEXT:C284(InvoiceItems_Sel2; $1)

//INVOICES_SEL2
C_BOOLEAN:C305(Invoices_Sel2; $0)
C_TEXT:C284(Invoices_Sel2; $1)

//DIARY_SEL2
C_TEXT:C284(Diary_Sel2; $1)

//STOCKCURRENT_SEL2
C_TEXT:C284(StockCurrent_Sel2; $1)

//CONTRACTS_SEL2
C_TEXT:C284(Contracts_Sel2; $1)

//DBI_DISPLAYRECORDS
C_LONGINT:C283(DBI_DisplayRecords; $1)
C_TEXT:C284(DBI_DisplayRecords; $2)
C_TEXT:C284(DBI_DisplayRecords; $3)
C_LONGINT:C283(DBI_DisplayRecords; $4)
C_BOOLEAN:C305(DBI_DisplayRecords; $5)
C_BOOLEAN:C305(DBI_DisplayRecords; $6)
C_BOOLEAN:C305(DBI_DisplayRecords; $7)

//DB_SETOUTPUTCOLOR
C_LONGINT:C283(DB_SetOutputColor; $1)
C_LONGINT:C283(DB_SetOutputColor; $2)
C_POINTER:C301(DB_SetOutputColor; $3)

//PO_LOADDFPRICEGROUP
C_BOOLEAN:C305(PO_LoadDFPriceGroup; $1)

//DB_SETFORMBUTTONOPTIONS
C_TEXT:C284(DB_SetFormButtonOptions; $1)

//DB_BUTTONACTION
C_TEXT:C284(DB_ButtonAction; $1)

//ACCOUNTS_INNEW
C_BOOLEAN:C305(Accounts_InNew; $1)
C_BOOLEAN:C305(Accounts_InNew; $2)

//ACTIONS_INNEW
C_BOOLEAN:C305(Actions_InNew; $1)
C_BOOLEAN:C305(Actions_InNew; $2)

//ADDRESSFORMATS_INNEW
C_BOOLEAN:C305(AddressFormats_InNew; $1)
C_BOOLEAN:C305(AddressFormats_InNew; $2)

//DB_MENUNEWRECORD
C_TEXT:C284(DB_MenuNewRecord; $1)
C_POINTER:C301(DB_MenuNewRecord; $2)
C_POINTER:C301(DB_MenuNewRecord; $3)
C_POINTER:C301(DB_MenuNewRecord; $4)
C_POINTER:C301(DB_MenuNewRecord; $5)
C_POINTER:C301(DB_MenuNewRecord; $6)
C_POINTER:C301(DB_MenuNewRecord; $7)
C_POINTER:C301(DB_MenuNewRecord; $8)

//DB_CREATENEWRECORD
C_LONGINT:C283(DB_CreateNewRecord; $1)
C_BOOLEAN:C305(DB_CreateNewRecord; $2)
C_LONGINT:C283(DB_CreateNewRecord; $3)
C_BOOLEAN:C305(DB_CreateNewRecord; $4)
C_TEXT:C284(DB_CreateNewRecord; $5)

//DBI_MENUDISPLAYRECORDS
C_TEXT:C284(DBI_MenuDisplayRecords; $1)
C_LONGINT:C283(DBI_MenuDisplayRecords; $2)
C_TEXT:C284(DBI_MenuDisplayRecords; $3)
C_POINTER:C301(DBI_MenuDisplayRecords; $4)
C_TEXT:C284(DBI_MenuDisplayRecords; $5)
C_POINTER:C301(DBI_MenuDisplayRecords; $6)
C_TEXT:C284(DBI_MenuDisplayRecords; $7)
C_POINTER:C301(DBI_MenuDisplayRecords; $8)
C_TEXT:C284(DBI_MenuDisplayRecords; $9)

//AA_GETNEXTID
C_TEXT:C284(AA_GetNextID; $4)

//ACCBAL PL
C_BOOLEAN:C305(AccBal_PL; $1)

//ACC_BalPLBudget
C_BOOLEAN:C305(ACC_BalPLBudget; $1)

//ACC_BalPL12
C_BOOLEAN:C305(ACC_BalPL12; $1)

//ACCBAL_BSMC
C_BOOLEAN:C305(AccBal_BSMC; $1)

//ACCBAL_TBMC
C_BOOLEAN:C305(AccBAL_TBMC; $1)

//Check_Product
C_TEXT:C284(Check_Product; $4)
C_TEXT:C284(Check_Product; $5)

//Companies_InLPß
C_LONGINT:C283(Companies_InLPß; $3)

//Companies_MenV
C_REAL:C285(Companies_MenV; $1)

//Contacts_MenV
C_REAL:C285(Contacts_MenV; $1)

//Contracts_MenV
C_REAL:C285(Contracts_MenV; $1)

//CUR_CONVERTVALUE
C_BOOLEAN:C305(CUR_ConvertValue; $4)
C_BOOLEAN:C305(CUR_ConvertValue; $5)

//CustomFields_Delete
C_REAL:C285(CustomFields_Delete; $2)

//Gen_ListReport
C_BOOLEAN:C305(Gen_ListReport; $4)
C_BOOLEAN:C305(Gen_ListReport; $5)
C_TEXT:C284(Gen_ListReport; $6)

//Gen_RequestText
C_TEXT:C284(Gen_RequestText; $6)

//In_Allowed
C_LONGINT:C283(In_Allowed; $3)

//Inv_DepPost
C_BOOLEAN:C305(Inv_DepPost; $0)

//Invoices_AD2
C_BOOLEAN:C305(Invoices_AD2; $3)
C_BOOLEAN:C305(Invoices_AD2; $4)
C_LONGINT:C283(Invoices_AD2; $5)
C_TIME:C306(Invoices_AD2; $6)
C_POINTER:C301(Invoices_AD2; $7)
C_POINTER:C301(Invoices_AD2; $8)
C_POINTER:C301(Invoices_AD2; $9)
C_POINTER:C301(Invoices_AD2; $10)
C_POINTER:C301(Invoices_AD2; $11)

//Invoices_Check
C_BOOLEAN:C305(Invoices_Check; $0)

//Invoices_MenV
C_LONGINT:C283(Invoices_MenV; $1)

//Jobs_WIPEnd
C_BOOLEAN:C305(Jobs_WIPEnd; $0)

//Mail_StateComp
C_LONGINT:C283(Mail_StateComp; $1)

//Module_First
C_BOOLEAN:C305(Module_First; $2)

//Move_MenV
C_TEXT:C284(Move_MenV; $1)

//Orders_InvSrch
C_BOOLEAN:C305(Orders_InvSrch; $1)

//Orders_MenV
C_LONGINT:C283(Orders_MenV; $1)

//Orders_StockPos
C_TEXT:C284(Orders_StockPos; $1)
C_TEXT:C284(Orders_StockPos; $2)

//Products_Del2
C_LONGINT:C283(Products_Del2; $1)

//PROD_ADDSUBENTITYCOMPONENTS
C_TEXT:C284(PROD_AddSubEntityComponents; $1)

//PROD_LOADCOMPONENTS
C_BOOLEAN:C305(PROD_LoadComponents; $3)

//Projects_MenV
C_LONGINT:C283(Projects_MenV; $1)

//Purch_InLPB
C_BOOLEAN:C305(Purch_InLPB; $2)

//Record_EditLst
C_TEXT:C284(Record_EditLst; $1)

//SM_LOADSET
C_LONGINT:C283(SM_LoadSet; $4)

//SM_SENDSETSELECTION
C_TEXT:C284(SM_SendSetSelection; $4)
C_POINTER:C301(SM_SendSetSelection; $5)
C_POINTER:C301(SM_SendSetSelection; $6)

//SM_UPDATEARRAYS
C_TEXT:C284(SM_UpdateArrays; $10)
C_BOOLEAN:C305(SM_UpdateArrays; $11)

//StockAss_CalcDP
C_TEXT:C284(StockAss_CalcDP; $1)

//StockAss_Movt
C_LONGINT:C283(StockAss_Movt; $3)
C_REAL:C285(StockAss_Movt; $4)
C_TEXT:C284(StockAss_Movt; $5)
C_TEXT:C284(StockAss_Movt; $6)
C_TEXT:C284(StockAss_Movt; $7)
C_TEXT:C284(StockAss_Movt; $8)
C_DATE:C307(StockAss_Movt; $9)
C_TEXT:C284(StockAss_Movt; $10)

//StockAss_Movt2
C_TEXT:C284(StockAss_Movt2; $6)
C_TEXT:C284(StockAss_Movt2; $7)
C_TEXT:C284(StockAss_Movt2; $8)
C_TEXT:C284(StockAss_Movt2; $9)
C_DATE:C307(StockAss_Movt2; $10)
C_TEXT:C284(StockAss_Movt2; $11)
C_LONGINT:C283(StockAss_Movt2; $12)

//StockCurr_ACLSr
C_TEXT:C284(StockCurr_ACLSr; $2)
C_TEXT:C284(StockCurr_ACLSr; $3)
C_TEXT:C284(StockCurr_ACLSr; $4)

//StockCurr_MenV
C_LONGINT:C283(StockCurr_MenV; $1)

//StockLev_ACLSr
C_TEXT:C284(StockLev_ACLSr; $1)
C_TEXT:C284(StockLev_ACLSr; $2)
C_TEXT:C284(StockLev_ACLSr; $3)

//TransactionBatch_Post
C_LONGINT:C283(TransactionBatch_Post; $0)

//LBI_DRAGCOPY
C_POINTER:C301(LBi_DragCopy; $2)
C_TEXT:C284(LBi_DragCopy; $3)

//LBI_INCLFIELDS
C_BOOLEAN:C305(LBi_InclFields; $3)

//LBI_ARRDEFFILL
C_TEXT:C284(LBi_ArrDefFill; $13)

//SRCH_SETSEARCHPARAMETERS
C_TEXT:C284(SRCH_SetSearchParameters; $3)

//SRCH_MORECHOICES
C_TEXT:C284(SRCH_MoreChoices; $2)

//SRCH_STANDARDSEARCH
C_TEXT:C284(SRCH_StandardSearch; $3)

//SD2_EDITDIARYRECORD
C_TEXT:C284(SD2_EditDiaryRecord; $4)

//SD2_ADDDIARYRECORD
C_BOOLEAN:C305(SD2_AddDiaryRecord; $4)

//SD2_GETRELATEDDIARYITEMS
C_LONGINT:C283(SD2_GetRelatedDiaryItems; $7)

//DOC_LAUNCHEXTERNALDOCUMENT
C_TEXT:C284(DOC_LaunchExternalDocument; $2)

//CO_NEWS
C_LONGINT:C283(CO_News; $5)

//CO_NEWSAPPLYTOKENS
C_LONGINT:C283(CO_NewsApplyTokens; $2)
C_TEXT:C284(GEN_AskSelection; ${6})
C_TEXT:C284(GEN_AskSelection; $9)
C_TEXT:C284(GEN_AskSelection; $10)
C_TEXT:C284(GEN_AskSelection; $11)
C_TEXT:C284(GEN_AskSelection; $12)
C_TEXT:C284(GEN_AskSelection; $13)
C_TEXT:C284(GEN_AskSelection; $14)
C_TEXT:C284(GEN_AskSelection; $15)
C_TEXT:C284(GEN_AskSelection; $16)
C_TEXT:C284(GEN_AskSelection; $17)
C_TEXT:C284(GEN_AskSelection; $18)
C_TEXT:C284(GEN_AskSelection; $19)
C_TEXT:C284(GEN_AskSelection; $20)
C_TEXT:C284(GEN_AskSelection; $21)
C_TEXT:C284(GEN_AskSelection; $22)
C_TEXT:C284(GEN_AskSelection; $23)
C_TEXT:C284(GEN_AskSelection; $24)
C_TEXT:C284(GEN_AskSelection; $25)

//CAT_CREATEMACROSEARCH
C_TEXT:C284(CAT_CreateMacroSearch; $1)

//CONT_CONTACTSREPORT
C_BOOLEAN:C305(Cont_ContactsReport; $1)

//SEL_PREVRECORDSSELECTION
C_REAL:C285(SEL_PrevRecordsSelection; $1)

//CO_PROSPECTREPORT
C_BOOLEAN:C305(CO_prospectReport; $1)

//CO_PRINTCOLIST
C_BOOLEAN:C305(CO_PrintCoList; $1)

//DB_MENUCREATEFUNCTIONSMENU
C_TEXT:C284(DB_MenuCreateFunctionsMenu; $3)

//DB_BUILDSELECTIONSMENUITEMS
C_TEXT:C284(DB_BuildSelectionsMenuitems; $3)
C_BOOLEAN:C305(DB_BuildSelectionsMenuitems; $4)

//DB_MENUCREATEREPORTSMENU
C_TEXT:C284(DB_MenuCreateReportsMenu; $3)

//DB_MENUCREATEFILEMENU
C_TEXT:C284(DB_MenuCreateFileMenu; $3)

//DB_SETNEWTOOLBAR
C_LONGINT:C283(DB_SetnewToolBar; $1)
C_BOOLEAN:C305(DB_SetnewToolBar; $2)

//DB_SETFORMTABS
C_POINTER:C301(DB_SetFormTabs; $5)

//DB_SELECTSET
C_TEXT:C284(DB_SelectSet; $1)
C_REAL:C285(DB_SelectSet; $2)

//DB_SETNEWPROCESSOPTION
C_TEXT:C284(DB_SetNewProcessOption; $1)

//DB_SETWINDOWTITLE
C_LONGINT:C283(DB_SetWindowTitle; $1)
C_TEXT:C284(DB_SetWindowTitle; $2)

//Minor_Sel2
C_POINTER:C301(Minor_Sel2; $5)
C_POINTER:C301(Minor_Sel2; $6)
C_POINTER:C301(Minor_Sel2; $7)

//DBI_DISPLAYRECORDS
C_LONGINT:C283(DBI_DisplayRecords; $8)
C_BOOLEAN:C305(DBI_DisplayRecords; $9)
C_BOOLEAN:C305(DBI_DisplayRecords; $10)
C_BOOLEAN:C305(DBI_DisplayRecords; $11)
C_BOOLEAN:C305(DBI_DisplayRecords; $12)
C_LONGINT:C283(DBI_DisplayRecords; $13)
C_BOOLEAN:C305(DBI_DisplayRecords; $14)
C_BOOLEAN:C305(DBI_DisplayRecords; $15)
C_BOOLEAN:C305(DBI_DisplayRecords; $16)

//PRD_BUILDGETCOMPONENTCOST
C_TEXT:C284(PRD_BuildGetComponentCost; $1)
C_TEXT:C284(PRD_BuildGetComponentCost; $2)
C_REAL:C285(PRD_BuildGetComponentCost; $3)
C_TEXT:C284(PRD_BuildGetComponentCost; $4)
C_TEXT:C284(PRD_BuildGetComponentCost; $5)
C_POINTER:C301(PRD_BuildGetComponentCost; $6)

//PRICET_FILTERDATES
C_DATE:C307(PriceT_FilterDates; $1)

//DBI_MENUDISPLAYRECORDS
C_POINTER:C301(DBI_MenuDisplayRecords; $10)
C_TEXT:C284(DBI_MenuDisplayRecords; $11)

//DBI_DISPLAYRECORD
C_LONGINT:C283(DBI_DisplayRecord; $1)
C_LONGINT:C283(DBI_DisplayRecord; $2)
C_TEXT:C284(DBI_DisplayRecord; $3)
C_TEXT:C284(DBI_DisplayRecord; $4)
C_TEXT:C284(DBI_DisplayRecord; $5)

//DB_HANDLEINPUTFORMBUTTONS
C_TEXT:C284(DB_HandleInputFormButtons; $1)

//DB_GETIMPORTFUNCTION
C_TEXT:C284(DB_GetImportFunction; $0)
C_LONGINT:C283(DB_GetImportFunction; $1)
C_TEXT:C284(DB_GetImportFunction; $2)

//STK_ITEMCREATE
C_TEXT:C284(STK_ItemCreate; $1)

//DB_APPENDINPUTMENU
C_LONGINT:C283(DB_AppendInputMenu; $1)

//DBI_MENUSELECTRECORDS
C_TEXT:C284(DBI_MenuSelectRecords; $1)
C_BOOLEAN:C305(DBI_MenuSelectRecords; $2)
C_TEXT:C284(DBI_MenuSelectRecords; $3)

//ACC_PRINTTRANS
C_TEXT:C284(ACC_PrintTrans; $1)
C_TEXT:C284(GEN_AskSelectionONE; ${6})
C_LONGINT:C283(GEN_AskSelectionONE; $1)
C_LONGINT:C283(GEN_AskSelectionONE; $2)
C_TEXT:C284(GEN_AskSelectionONE; $3)
C_TEXT:C284(GEN_AskSelectionONE; $4)
C_POINTER:C301(GEN_AskSelectionONE; $5)
C_TEXT:C284(GEN_AskSelectionONE; $6)
C_TEXT:C284(GEN_AskSelectionONE; $7)
C_TEXT:C284(GEN_AskSelectionONE; $8)
C_TEXT:C284(GEN_AskSelectionONE; $9)
C_TEXT:C284(GEN_AskSelectionONE; $10)
C_TEXT:C284(GEN_AskSelectionONE; $11)
C_TEXT:C284(GEN_AskSelectionONE; $12)
C_TEXT:C284(GEN_AskSelectionONE; $13)
C_TEXT:C284(GEN_AskSelectionONE; $14)
C_TEXT:C284(GEN_AskSelectionONE; $15)
C_TEXT:C284(GEN_AskSelectionONE; $16)
C_TEXT:C284(GEN_AskSelectionONE; $17)
C_TEXT:C284(GEN_AskSelectionONE; $18)
C_TEXT:C284(GEN_AskSelectionONE; $19)
C_TEXT:C284(GEN_AskSelectionONE; $20)
C_TEXT:C284(GEN_AskSelectionONE; $21)
C_TEXT:C284(GEN_AskSelectionONE; $22)
C_TEXT:C284(GEN_AskSelectionONE; $23)
C_TEXT:C284(GEN_AskSelectionONE; $24)
C_TEXT:C284(GEN_AskSelectionONE; $25)

//PUR_SHOWAGEDDEBTORSSTATS
C_LONGINT:C283(PUR_ShowAgedDebtorsStats; $1)
C_DATE:C307(PUR_ShowAgedDebtorsStats; $2)
C_TEXT:C284(PUR_ShowAgedDebtorsStats; $3)
C_TEXT:C284(PUR_ShowAgedDebtorsStats; $4)
C_TEXT:C284(PUR_ShowAgedDebtorsStats; $5)
C_TEXT:C284(PUR_ShowAgedDebtorsStats; $6)
C_TEXT:C284(PUR_ShowAgedDebtorsStats; $7)
C_TEXT:C284(PUR_ShowAgedDebtorsStats; $8)
C_TEXT:C284(PUR_ShowAgedDebtorsStats; $9)

//PUR_SETTOTALDUE
C_REAL:C285(PUR_SetTotalDue; $0)

//PUR_SETTOTALDUE30
C_REAL:C285(PUR_SetTotalDue30; $0)

//PUR_SETTOTALDUE60
C_REAL:C285(PUR_SetTotalDue60; $0)

//PUR_SETTOTALDUE90
C_REAL:C285(PUR_SetTotalDue90; $0)

//PUR_SETTOTALDUEG90
C_REAL:C285(PUR_SetTotalDueg90; $0)

//LAY_SETKEYFIELD
C_POINTER:C301(LAY_SetKeyField; $0)
C_REAL:C285(LAY_SetKeyField; $1)

//MODULES_LOADCONTEXTVIEWS
C_LONGINT:C283(Modules_LoadContextViews; $1)
C_POINTER:C301(Modules_LoadContextViews; $2)
C_POINTER:C301(Modules_LoadContextViews; $3)

//LAY_LOADACCOUNTBALANCESARRAYS
C_REAL:C285(LAY_LOADACCOUNTBALANCESARRAYS; $0)

//ZIP_CALCULATEBYDISTANCE
C_TEXT:C284(ZIP_CalculateByDistance; $1)
C_REAL:C285(ZIP_CalculateByDistance; $2)
C_REAL:C285(ZIP_CalculateByDistance; $3)
C_REAL:C285(ZIP_CalculateByDistance; $4)
C_POINTER:C301(ZIP_CalculateByDistance; $5)
C_POINTER:C301(ZIP_CalculateByDistance; $6)
C_POINTER:C301(ZIP_CalculateByDistance; $7)
C_POINTER:C301(ZIP_CalculateByDistance; $8)
C_POINTER:C301(ZIP_CalculateByDistance; $9)

//DF_LOADORDERENTRYOPTION
C_BOOLEAN:C305(DF_LoadOrderEntryOption; $1)

//PUB_CUMULUS
C_TEXT:C284(PUB_Cumulus; $1)
C_LONGINT:C283(PUB_Cumulus; $2)
C_LONGINT:C283(PUB_Cumulus; $3)
C_TEXT:C284(PUB_Cumulus; $4)

//PRODUCTDELETIONPREFERENCES
C_REAL:C285(ProductDeletionPreferences; $0)

//PROCESSSERVICES_CREATEFROMTRANS
C_LONGINT:C283(ProcessServices_CreateFromtrans; $1)
C_LONGINT:C283(ProcessServices_CreateFromtrans; $2)
C_TEXT:C284(ProcessServices_CreateFromtrans; $3)
C_LONGINT:C283(ProcessServices_CreateFromtrans; $4)
C_LONGINT:C283(ProcessServices_CreateFromtrans; $5)
C_LONGINT:C283(ProcessServices_CreateFromtrans; $6)
C_BOOLEAN:C305(ProcessServices_CreateFromtrans; $7)
C_TEXT:C284(ProcessServices_CreateFromtrans; $8)

//PRD_l_EDITCOMPLEXCOMPONENT
C_LONGINT:C283(PRD_L_EditComplexComponent; $1)
C_LONGINT:C283(PRD_L_EditComplexComponent; $2)
C_POINTER:C301(PRD_L_EditComplexComponent; $3)

//PRD_GETRELATED
C_TEXT:C284(PRD_GetRelated; $1)
C_LONGINT:C283(PRD_GetRelated; $2)

//PRD_EDITCODEFORMATS
C_LONGINT:C283(PRD_EditCodeFormats; $0)
C_LONGINT:C283(PRD_EditCodeFormats; $1)

//PRD_BUILDGETCOMPONENTPRICE
C_TEXT:C284(PRD_BuildGetComponentPrice; $1)
C_REAL:C285(PRD_BuildGetComponentPrice; $2)
C_TEXT:C284(PRD_BuildGetComponentPrice; $3)
C_DATE:C307(PRD_BuildGetComponentPrice; $4)
C_POINTER:C301(PRD_BuildGetComponentPrice; $5)
C_POINTER:C301(PRD_BuildGetComponentPrice; $6)

//PRD_BUILDFORMSELECTPRODUCT
C_LONGINT:C283(PRD_BuildFormSelectProduct; $1)
C_LONGINT:C283(PRD_BuildFormSelectProduct; $2)

//ORD_SETFORMOBJECTS
C_LONGINT:C283(ORD_SetFormObjects; $1)

//OI_SELECTSPECIALPRODUCT
C_LONGINT:C283(OI_SelectSpecialProduct; $0)

//CATALOGUEGROUP_MOD
C_TEXT:C284(CatalogueGroup_Mod; $1)
C_TEXT:C284(CatalogueGroup_Mod; $2)
C_POINTER:C301(CatalogueGroup_Mod; $3)

//CCM_SELECTCARD
C_TEXT:C284(CCM_SelectCard; $1)
C_LONGINT:C283(CCM_SelectCard; $2)
C_TEXT:C284(CCM_SelectCard; $3)

//DB_DOCUMENTTOARRAY
C_TEXT:C284(DB_Documenttoarray; $1)
C_POINTER:C301(DB_Documenttoarray; $2)
C_TEXT:C284(DB_Documenttoarray; $3)
C_BOOLEAN:C305(DB_Documenttoarray; $4)
C_BOOLEAN:C305(DB_Documenttoarray; $5)
C_BOOLEAN:C305(DB_Documenttoarray; $6)

//DB_ARRAYDIFF
C_POINTER:C301(DB_ArrayDiFF; $1)
C_POINTER:C301(DB_ArrayDiFF; $2)
C_POINTER:C301(DB_ArrayDiFF; $3)
C_POINTER:C301(DB_ArrayDiFF; $4)
C_POINTER:C301(DB_ArrayDiFF; $5)
C_POINTER:C301(DB_ArrayDiFF; $6)

//DB_GETPOINTERTYPE
C_BOOLEAN:C305(DB_GetPointerType; $0)
C_POINTER:C301(DB_GetPointerType; $1)

//DB_DIFFCODE
C_POINTER:C301(DB_DIFFCODE; $1)
C_POINTER:C301(DB_DIFFCODE; $2)

//DB_DIFFARRAYRESIZE
C_POINTER:C301(DB_DIffArrayResize; $1)
C_LONGINT:C283(DB_DIffArrayResize; $2)

//DB_DIFFHASHTEXT
C_LONGINT:C283(DB_DIFFHashText; $0)
C_TEXT:C284(DB_DIFFHashText; $1)

//DB_DIFFSMS
C_POINTER:C301(DB_DIFFSMS; $1)
C_LONGINT:C283(DB_DIFFSMS; $2)
C_LONGINT:C283(DB_DIFFSMS; $3)
C_POINTER:C301(DB_DIFFSMS; $4)
C_LONGINT:C283(DB_DIFFSMS; $5)
C_LONGINT:C283(DB_DIFFSMS; $6)
C_POINTER:C301(DB_DIFFSMS; $7)
C_POINTER:C301(DB_DIFFSMS; $8)
C_POINTER:C301(DB_DIFFSMS; $9)
C_POINTER:C301(DB_DIFFSMS; $10)

//DB_DIFFLCS
C_POINTER:C301(DB_DIFFLCS; $1)
C_POINTER:C301(DB_DIFFLCS; $2)
C_LONGINT:C283(DB_DIFFLCS; $3)
C_LONGINT:C283(DB_DIFFLCS; $4)
C_POINTER:C301(DB_DIFFLCS; $5)
C_POINTER:C301(DB_DIFFLCS; $6)
C_LONGINT:C283(DB_DIFFLCS; $7)
C_LONGINT:C283(DB_DIFFLCS; $8)
C_POINTER:C301(DB_DIFFLCS; $9)
C_POINTER:C301(DB_DIFFLCS; $10)

//DB_DIFFOPTIMISE
C_POINTER:C301(DB_DIFFOPTIMISE; $1)
C_POINTER:C301(DB_DIFFOPTIMISE; $2)

//DB_DIFFLIST
C_POINTER:C301(DB_DIFFList; $1)
C_POINTER:C301(DB_DIFFList; $2)
C_POINTER:C301(DB_DIFFList; $3)
C_POINTER:C301(DB_DIFFList; $4)
C_POINTER:C301(DB_DIFFList; $5)
C_POINTER:C301(DB_DIFFList; $6)
C_POINTER:C301(DB_DIFFList; $7)
C_POINTER:C301(DB_DIFFList; $8)

//DB_DIFFSYNCHRONIZE
C_POINTER:C301(DB_DIFFSynchronize; $1)
C_POINTER:C301(DB_DIFFSynchronize; $2)
C_POINTER:C301(DB_DIFFSynchronize; $3)
C_POINTER:C301(DB_DIFFSynchronize; $4)
C_POINTER:C301(DB_DIFFSynchronize; $5)
C_POINTER:C301(DB_DIFFSynchronize; $6)
C_POINTER:C301(DB_DIFFSynchronize; $7)
C_POINTER:C301(DB_DIFFSynchronize; $8)
C_POINTER:C301(DB_DIFFSynchronize; $9)
C_LONGINT:C283(DB_DIFFSynchronize; $10)
C_LONGINT:C283(DB_DIFFSynchronize; $11)
C_LONGINT:C283(DB_DIFFSynchronize; $12)

//DB_TEXTTOARRAY
C_POINTER:C301(DB_TextToarray; $1)
C_POINTER:C301(DB_TextToarray; $2)
C_TEXT:C284(DB_TextToarray; $3)
C_BOOLEAN:C305(DB_TextToarray; $4)
C_BOOLEAN:C305(DB_TextToarray; $5)
C_BOOLEAN:C305(DB_TextToarray; $6)

//STK_GETTAKEFROMCURRENTSTOCKID
C_LONGINT:C283(STK_GetTakeFromCurrentStockID; $0)
C_TEXT:C284(STK_GetTakeFromCurrentStockID; $1)
C_TEXT:C284(STK_GetTakeFromCurrentStockID; $2)
C_TEXT:C284(STK_GetTakeFromCurrentStockID; $3)
C_REAL:C285(STK_GetTakeFromCurrentStockID; $4)
C_TEXT:C284(STK_GetTakeFromCurrentStockID; $5)
C_TEXT:C284(STK_GetTakeFromCurrentStockID; $6)
C_TEXT:C284(STK_GetTakeFromCurrentStockID; $7)
C_REAL:C285(STK_GetTakeFromCurrentStockID; $8)
C_LONGINT:C283(STK_GetTakeFromCurrentStockID; $9)
C_TEXT:C284(STK_GetTakeFromCurrentStockID; $10)
C_TEXT:C284(STK_GetTakeFromCurrentStockID; $11)
C_LONGINT:C283(STK_GetTakeFromCurrentStockID; $12)
C_LONGINT:C283(STK_GetTakeFromCurrentStockID; $13)
C_DATE:C307(STK_GetTakeFromCurrentStockID; $14)
C_BOOLEAN:C305(STK_GetTakeFromCurrentStockID; $15)
C_TEXT:C284(STK_GetTakeFromCurrentStockID; $16)

//STK_GETCURRENTSTOCKID
C_LONGINT:C283(STK_GetCurrentStockID; $0)
C_LONGINT:C283(STK_GetCurrentStockID; $1)
C_TEXT:C284(STK_GetCurrentStockID; $2)
C_TEXT:C284(STK_GetCurrentStockID; $3)
C_LONGINT:C283(STK_GetCurrentStockID; $4)
C_TEXT:C284(STK_GetCurrentStockID; $5)
C_TEXT:C284(STK_GetCurrentStockID; $6)
C_TEXT:C284(STK_GetCurrentStockID; $7)
C_TEXT:C284(STK_GetCurrentStockID; $8)
C_TEXT:C284(STK_GetCurrentStockID; $9)
C_REAL:C285(STK_GetCurrentStockID; $10)
C_BOOLEAN:C305(STK_GetCurrentStockID; $11)
C_BOOLEAN:C305(STK_GetCurrentStockID; $12)
C_LONGINT:C283(STK_GetCurrentStockID; $13)
C_LONGINT:C283(STK_GetCurrentStockID; $14)
C_DATE:C307(STK_GetCurrentStockID; $15)
C_REAL:C285(STK_GetCurrentStockID; $16)
C_BOOLEAN:C305(STK_GetCurrentStockID; $17)
C_TEXT:C284(STK_GetCurrentStockID; $18)

//STK_GETADDTOCURRENTSTOCKID
C_LONGINT:C283(STK_GetAddtoCurrentStockID; $0)
C_TEXT:C284(STK_GetAddtoCurrentStockID; $1)
C_TEXT:C284(STK_GetAddtoCurrentStockID; $2)
C_TEXT:C284(STK_GetAddtoCurrentStockID; $3)
C_REAL:C285(STK_GetAddtoCurrentStockID; $4)
C_TEXT:C284(STK_GetAddtoCurrentStockID; $5)
C_TEXT:C284(STK_GetAddtoCurrentStockID; $6)
C_TEXT:C284(STK_GetAddtoCurrentStockID; $7)
C_REAL:C285(STK_GetAddtoCurrentStockID; $8)
C_LONGINT:C283(STK_GetAddtoCurrentStockID; $9)
C_TEXT:C284(STK_GetAddtoCurrentStockID; $10)
C_TEXT:C284(STK_GetAddtoCurrentStockID; $11)

//STOCK_CREATESTOCKLEVELRECORD
C_REAL:C285(STOCK_CreateStockLevelRecord; $1)
C_TEXT:C284(STOCK_CreateStockLevelRecord; $2)
C_TEXT:C284(STOCK_CreateStockLevelRecord; $3)
C_TEXT:C284(STOCK_CreateStockLevelRecord; $4)
C_TEXT:C284(STOCK_CreateStockLevelRecord; $5)
C_TEXT:C284(STOCK_CreateStockLevelRecord; $6)

//STK_UPDATESTOCKLEVELS
C_LONGINT:C283(STK_UpdateStockLevels; $1)
C_TEXT:C284(STK_UpdateStockLevels; $2)
C_TEXT:C284(STK_UpdateStockLevels; $3)
C_TEXT:C284(STK_UpdateStockLevels; $4)
C_TEXT:C284(STK_UpdateStockLevels; $5)
C_TEXT:C284(STK_UpdateStockLevels; $6)

//STK_UPDATECURRENTSTOCK2011
C_REAL:C285(STK_UpdateCurrentStock2011; $1)
C_REAL:C285(STK_UpdateCurrentStock2011; $2)
C_REAL:C285(STK_UpdateCurrentStock2011; $3)
C_LONGINT:C283(STK_UpdateCurrentStock2011; $4)
C_TEXT:C284(STK_UpdateCurrentStock2011; $5)
C_BOOLEAN:C305(STK_UpdateCurrentStock2011; $6)

//STK_CREATECURRENTSTOCK
C_REAL:C285(STK_CreateCurrentStock; $1)
C_TEXT:C284(STK_CreateCurrentStock; $2)
C_TEXT:C284(STK_CreateCurrentStock; $3)
C_REAL:C285(STK_CreateCurrentStock; $4)
C_TEXT:C284(STK_CreateCurrentStock; $5)
C_TEXT:C284(STK_CreateCurrentStock; $6)
C_TEXT:C284(STK_CreateCurrentStock; $7)
C_TEXT:C284(STK_CreateCurrentStock; $8)
C_TEXT:C284(STK_CreateCurrentStock; $9)
C_REAL:C285(STK_CreateCurrentStock; $10)

//DB_PSEUDOTRIGGER
C_REAL:C285(DB_PseudoTrigger; $1)
C_REAL:C285(DB_PseudoTrigger; $2)

//STK_GETPREVIOUSSTOCKMOVEMENT
C_LONGINT:C283(STK_GetPreviousStockMovement; $1)
C_LONGINT:C283(STK_GetPreviousStockMovement; $2)
C_LONGINT:C283(STK_GetPreviousStockMovement; $3)
C_TEXT:C284(STK_GetPreviousStockMovement; $4)
C_TEXT:C284(STK_GetPreviousStockMovement; $5)
C_TEXT:C284(STK_GetPreviousStockMovement; $6)
C_TEXT:C284(STK_GetPreviousStockMovement; $7)
C_TEXT:C284(STK_GetPreviousStockMovement; $8)
C_DATE:C307(STK_GetPreviousStockMovement; $9)
C_REAL:C285(STK_GetPreviousStockMovement; $10)
C_REAL:C285(STK_GetPreviousStockMovement; $11)
C_LONGINT:C283(STK_GetPreviousStockMovement; $12)

//STK_ADJUSTCURRENTSTOCKID
C_LONGINT:C283(STK_ADJUSTCURRENTSTOCKID; $1)
C_LONGINT:C283(STK_ADJUSTCURRENTSTOCKID; $2)

//STK_UPDATECALLEDOFFQUANTITY
C_LONGINT:C283(STK_UpdateCalledOffQuantity; $1)
C_REAL:C285(STK_UpdateCalledOffQuantity; $2)

//DB_GETCOUNTRIESUSED
C_LONGINT:C283(DB_GetCountriesUsed; $1)

//DB_SALESPERSONSUSED
C_REAL:C285(DB_SalesPersonsUsed; $1)

//DB_GETCOUNTIESUSED
C_LONGINT:C283(DB_GetCountiesUsed; $1)

//DB_GETAREAS
C_LONGINT:C283(DB_GetAreas; $1)
C_BOOLEAN:C305(DB_GetAreas; $2)
C_LONGINT:C283(DB_GetAreas; $3)

//DB_GETTYPES
C_LONGINT:C283(DB_GetTypes; $1)
C_LONGINT:C283(DB_GetTypes; $2)
C_TEXT:C284(DB_GetTypes; $3)
C_BOOLEAN:C305(DB_GetTypes; $4)

//DB_GETSTATUS
C_LONGINT:C283(DB_GetStatus; $1)
C_BOOLEAN:C305(DB_GetStatus; $2)
C_LONGINT:C283(DB_GetStatus; $3)

//DB_GETROLES
C_LONGINT:C283(DB_GetRoles; $1)
C_BOOLEAN:C305(DB_GetRoles; $2)

//DB_GETHEADINGS
C_LONGINT:C283(DB_GetHeadings; $1)

//DB_GETGROUPS
C_LONGINT:C283(DB_GetGroups; $1)

//DB_GETBRANDS
C_LONGINT:C283(DB_GetBrands; $1)

//DB_GETCOLLECTIONS
C_LONGINT:C283(DB_GetCollections; $1)

//DB_GETORDERTYPES
C_LONGINT:C283(DB_GetOrderTypes; $1)
C_LONGINT:C283(DB_GetOrderTypes; $2)
C_TEXT:C284(DB_GetOrderTypes; $3)

//DB_GETSTATES
C_LONGINT:C283(DB_GetStates; $1)
C_LONGINT:C283(DB_GetStates; $2)

//DB_GETCONTRACTTYPES
C_LONGINT:C283(DB_GetContractTypes; $1)

//DB_GETSTOCKTYPES
C_LONGINT:C283(DB_GetStockTypes; $1)

//DB_GETLOCATIONS
C_LONGINT:C283(DB_GetLocations; $1)

//DB_CREDITSTAGES
C_LONGINT:C283(DB_CreditStages; $1)

//DB_GETMOVETYPES
C_LONGINT:C283(DB_GetMoveTypes; $1)

//LAY_LOADACCOUNTSARRAYS
C_BOOLEAN:C305(LAY_LoadAccountsArrays; $1)

//GET_USERGROUP
C_LONGINT:C283(Get_UserGroup; $1)
C_TEXT:C284(Get_UserGroup; $2)

//DB_SETINPUTFORMMENU
C_REAL:C285(DB_SetInputFormMenu; $1)
C_TEXT:C284(DB_SetInputFormMenu; $2)
C_TEXT:C284(DB_SetInputFormMenu; $3)

//DB_MENUCREATEVIEWSMENU
C_TEXT:C284(DB_MenuCreateViewsMenu; $0)
C_REAL:C285(DB_MenuCreateViewsMenu; $1)
C_TEXT:C284(DB_MenuCreateViewsMenu; $2)

//DB_GETBUTTONFUNCTION
C_LONGINT:C283(DB_GetButtonFunction; $0)
C_TEXT:C284(DB_GetButtonFunction; $1)

//PER_SHOWSCHEDULE
C_BOOLEAN:C305(PER_ShowSchedule; $0)

//PER_SHOWWORKFLOW
C_BOOLEAN:C305(PER_ShowWorkflow; $0)

//PER_SHOWREMINDERS
C_BOOLEAN:C305(PER_ShowReminders; $0)

//DB_OUTPUTUPDATECOLUMNS
C_REAL:C285(DB_OutputUpdateColumns; $1)
C_TEXT:C284(DB_OutputUpdateColumns; $2)

//DB_ISCOMPONENTINSTALLED
C_BOOLEAN:C305(DB_IsComponentInstalled; $0)
C_TEXT:C284(DB_IsComponentInstalled; $1)

//EN_CUMULUSSHOW
C_TEXT:C284(EN_cumulusShow; $1)
C_LONGINT:C283(EN_cumulusShow; $2)
C_LONGINT:C283(EN_cumulusShow; $3)

//PRD_l_EDITSUBSCRIPTIONPRODUCT
C_REAL:C285(PRD_L_EditSubscriptionProduct; $1)

//DB_GETSOURCES
C_REAL:C285(DB_GetSources; $1)
C_LONGINT:C283(DB_GetSources; $2)

//DB_INITSTATSVIEW
C_BOOLEAN:C305(DB_InitStatsView; $0)
C_REAL:C285(DB_InitStatsView; $1)

//OI_UPDATESUBSCRIPTIONS
C_LONGINT:C283(OI_UpdateSubscriptions; $1)

//DB_SAVEFILTERSETTINGS
C_LONGINT:C283(DB_SaveFilterSettings; $0)
C_LONGINT:C283(DB_SaveFilterSettings; $1)
C_TEXT:C284(DB_SaveFilterSettings; $2)
C_LONGINT:C283(DB_SaveFilterSettings; $3)
C_LONGINT:C283(DB_SaveFilterSettings; $4)
C_POINTER:C301(DB_SaveFilterSettings; $5)
C_LONGINT:C283(DB_SaveFilterSettings; $6)

//DB_LOADFILTERS
C_LONGINT:C283(DB_LoadFilters; $1)
C_LONGINT:C283(DB_LoadFilters; $2)
C_LONGINT:C283(DB_LoadFilters; $3)
C_LONGINT:C283(DB_LoadFilters; $4)

//DB_LOADFILTERPARAMETERS
C_REAL:C285(DB_LoadFilterParameters; $1)
C_REAL:C285(DB_LoadFilterParameters; $2)

//DB_GETDEFAULTFILTERID
C_LONGINT:C283(DB_GetdefaultFilterID; $0)
C_LONGINT:C283(DB_GetdefaultFilterID; $1)

//SUBS_GETDIARYPRODUCTCODES
C_TEXT:C284(SUBS_GetDiaryProductCodes; $1)
C_REAL:C285(SUBS_GetDiaryProductCodes; $2)

//DB_SETGRAPH
C_POINTER:C301(DB_SetGraph; $1)
C_REAL:C285(DB_SetGraph; $2)
C_REAL:C285(DB_SetGraph; $3)
C_REAL:C285(DB_SetGraph; $4)

//ACC_RECORDBALANCE
C_TEXT:C284(ACC_RecordBalance; $1)
C_TEXT:C284(ACC_RecordBalance; $2)
C_REAL:C285(ACC_RecordBalance; $3)
C_REAL:C285(ACC_RecordBalance; $4)
C_REAL:C285(ACC_RecordBalance; $5)
C_TEXT:C284(ACC_RecordBalance; $6)

//RR_ZENCARTADDRESSDECODE
C_TEXT:C284(RR_ZenCartAddressDecode; $1)
C_POINTER:C301(RR_ZenCartAddressDecode; $2)
C_POINTER:C301(RR_ZenCartAddressDecode; $3)

//GEN_GETAUSTRALIANSTATECODES
C_TEXT:C284(GEN_GetAustralianStateCodes; $0)
C_TEXT:C284(GEN_GetAustralianStateCodes; $1)

//GET_USASTATECODES
C_TEXT:C284(Get_USAstateCodes; $0)
C_TEXT:C284(Get_USAstateCodes; $1)

//RR_ZENCARTMANAGER
C_TEXT:C284(RR_ZenCartManager; $1)
C_LONGINT:C283(RR_ZenCartManager; $2)
C_LONGINT:C283(RR_ZenCartManager; $3)

//STK_GETSTOCKLEVELID
C_REAL:C285(STK_GetStockLevelID; $0)
C_TEXT:C284(STK_GetStockLevelID; $1)
C_TEXT:C284(STK_GetStockLevelID; $2)
C_REAL:C285(STK_GetStockLevelID; $3)
C_TEXT:C284(STK_GetStockLevelID; $4)
C_TEXT:C284(STK_GetStockLevelID; $5)
C_TEXT:C284(STK_GetStockLevelID; $6)
C_TEXT:C284(STK_GetStockLevelID; $7)

//STK_POSTUPDATECSLEVEL
C_REAL:C285(STK_PostUpdateCSLevel; $1)

//STK_GETCSFROMSTOCKITEM
C_LONGINT:C283(STK_GetCSFromStockItem; $1)
C_LONGINT:C283(STK_GetCSFromStockItem; $2)
C_LONGINT:C283(STK_GetCSFromStockItem; $3)

//Check_Modules
C_TEXT:C284(Check_Modules; $2)

//Gen_ModMidAster
C_TEXT:C284(Gen_ModMidAster; $7)

//GEN_CONFIRMPASSWORD
C_BOOLEAN:C305(Gen_ConfirmPassword; $4)
C_TEXT:C284(Gen_ConfirmPassword; $5)

//Modules_MenuExe
C_LONGINT:C283(Modules_MenuExe; $2)
C_TEXT:C284(Modules_MenuExe; $3)
C_TEXT:C284(Modules_MenuExe; $4)
C_TEXT:C284(Modules_MenuExe; $5)
//OrdDel_StockP
C_TEXT:C284(OrdDel_StockP; $0)
C_TEXT:C284(OrdDel_StockP; $6)

//Sel_NoAtAt
C_BOOLEAN:C305(Sel_NoAtAt; $5)

//User_Details
C_LONGINT:C283(User_Details; $3)

//SM_CREATEAUTOSEARCH
C_LONGINT:C283(SM_CreateAutoSearch; $2)
C_TEXT:C284(SM_CreateAutoSearch; $3)

//SM_EDITMACRO
C_TEXT:C284(SM_EditMacro; $6)

//LB_STYLESETTINGS
C_LONGINT:C283(LB_StyleSettings; $6)
C_TEXT:C284(LB_StyleSettings; $7)
C_LONGINT:C283(LB_StyleSettings; $8)

//MACRO_PARSEFORCODE
C_TEXT:C284(MACRO_ParseForCode; $1)

//DB_GETMODULESETTINGBYNUM
C_TEXT:C284(DB_GetModuleSettingByNUM; $2)

//INV_SALESDAYBOOK
C_TEXT:C284(INV_SalesDaybook; $1)

//INV_LISTSALESLEDGER
C_TEXT:C284(INV_ListSalesLedger; $1)

//INV_STATEMENTDUEAMOUNTS
C_TEXT:C284(INV_StatementDueAmounts; $1)

//INV_PRINTEUSALESLIST
C_TEXT:C284(INV_PrintEUSalesList; $1)

//STK_2011VALIDATECSIDS
C_TEXT:C284(STK_2011ValidateCSIDS; $1)

//STK_GETADDTOCURRENTSTOCKID
C_BOOLEAN:C305(STK_GetAddtoCurrentStockID; $12)

//STK_2011SETINVERTED
C_TEXT:C284(STK_2011SetInverted; $1)

//INV_PRINTAGEDDEBTORS
C_TEXT:C284(INV_PrintAgedDebtors; $1)

//INV_PRINTAGEDDEBTORSASAT
C_TEXT:C284(INV_PrintAgedDebtorsAsAt; $1)

//ACC_PRINTTRIALBALANCE
C_TEXT:C284(ACC_PrintTrialBalance; $1)

//ACC_PRINTPROFITLOSS
C_TEXT:C284(ACC_PrintProfitLoss; $1)

//ACC_PRINTPROFITLOSSVSBUDGETS
C_TEXT:C284(ACC_PrintProfitLossVsBudgets; $1)

//ACC_PRINTPROFITLOSSONEYEAR
C_TEXT:C284(ACC_PrintProfitLossoneyear; $1)

//ACC_PRINTBALANCESHEET
C_TEXT:C284(ACC_PrintBalanceSheet; $1)

//ACC_PRINTTAXRETURN
C_TEXT:C284(ACC_PrintTaxReturn; $1)

//ACC_PRINTTAXLISTING
C_TEXT:C284(ACC_PrintTaxListing; $1)

//DB_SETGRAPH
C_LONGINT:C283(DB_SetGraph; $5)


//STK_SPLITCHILDREN
C_LONGINT:C283(STK_SplitChildren; $1)
C_POINTER:C301(STK_SplitChildren; $2)
C_POINTER:C301(STK_SplitChildren; $3)
C_POINTER:C301(STK_SplitChildren; $4)

//STK_bo_SHOWCSBYSI
C_LONGINT:C283(STK_b_ShowCSBySI; $1)
C_LONGINT:C283(STK_b_ShowCSBySI; $2)
C_LONGINT:C283(STK_b_ShowCSBySI; $3)

//STK_ISSOURCESTOCKTYPE
C_BOOLEAN:C305(STK_isSourceStockType; $0)
C_TEXT:C284(STK_isSourceStockType; $1)

//STK_ISPRODUCTANALYSED
C_BOOLEAN:C305(STK_IsProductAnalysed; $0)
C_TEXT:C284(STK_IsProductAnalysed; $1)

//STK_SETHEADERINFO
C_BOOLEAN:C305(STK_SetHeaderInfo; $0)

//SVG_POINTONARC
C_REAL:C285(SVG_PointOnArc; $1)
C_REAL:C285(SVG_PointOnArc; $2)
C_REAL:C285(SVG_PointOnArc; $3)
C_POINTER:C301(SVG_PointOnArc; $4)
C_POINTER:C301(SVG_PointOnArc; $5)

//PDF_ENCRYPT
C_TEXT:C284(PDF_Encrypt; $0)
C_TEXT:C284(PDF_Encrypt; $1)

//STK_CLEARDOWNSETUP
C_TEXT:C284(STK_ClearDownSetup; $1)

//STK_UPDATEPAUSECLIENTSWORKINGHR
C_BOOLEAN:C305(STK_UpdatePauseClientsWorkingHr; $1)

//STK_VALIDATIONREPORT
C_TEXT:C284(STK_ValidationReport; $1)

//STK_GETALLOCATIONITEMNUMBER
C_TEXT:C284(STK_GetAllocationItemNumber; $1)
C_LONGINT:C283(STK_GetAllocationItemNumber; $2)
C_LONGINT:C283(STK_GetAllocationItemNumber; $3)

//STK_GETPREVIOUSSTOCKMOVEMENTPRO
C_LONGINT:C283(STK_GetPreviousStockMovementPro; $1)
C_REAL:C285(STK_GetPreviousStockMovementPro; $2)
C_REAL:C285(STK_GetPreviousStockMovementPro; $3)
C_TEXT:C284(STK_GetPreviousStockMovementPro; $4)
C_TEXT:C284(STK_GetPreviousStockMovementPro; $5)
C_TEXT:C284(STK_GetPreviousStockMovementPro; $6)
C_TEXT:C284(STK_GetPreviousStockMovementPro; $7)
C_TEXT:C284(STK_GetPreviousStockMovementPro; $8)
C_DATE:C307(STK_GetPreviousStockMovementPro; $9)
C_REAL:C285(STK_GetPreviousStockMovementPro; $10)
C_REAL:C285(STK_GetPreviousStockMovementPro; $11)
C_REAL:C285(STK_GetPreviousStockMovementPro; $12)
C_BOOLEAN:C305(STK_GetPreviousStockMovementPro; $13)
C_BOOLEAN:C305(STK_GetPreviousStockMovementPro; $14)
C_REAL:C285(STK_GetPreviousStockMovementPro; $15)
C_BOOLEAN:C305(STK_GetPreviousStockMovementPro; $16)
C_TEXT:C284(STK_GetPreviousStockMovementPro; $17)
C_REAL:C285(STK_GetPreviousStockMovementPro; $18)

//STK_APPLYADDEDTOID
C_BOOLEAN:C305(STK_APPLYADDEDTOID; $0)

//STK_CREATECURRENTSTOCK
C_LONGINT:C283(STK_CreateCurrentStock; $11)

//STOCK_CREATESTOCKLEVELRECORD
C_LONGINT:C283(STOCK_CreateStockLevelRecord; $7)

//STK_CONSILIDATECS
C_TEXT:C284(STK_CONSILIDATECS; $1)

//STK_GETPREVIOUSSTOCKMOVEMENT
C_BOOLEAN:C305(STK_GetPreviousStockMovement; $13)
C_BOOLEAN:C305(STK_GetPreviousStockMovement; $14)
C_LONGINT:C283(STK_GetPreviousStockMovement; $15)
C_BOOLEAN:C305(STK_GetPreviousStockMovement; $16)
C_TEXT:C284(STK_GetPreviousStockMovement; $17)
C_LONGINT:C283(STK_GetPreviousStockMovement; $18)

//STK_MANAGE2011UPDATES
C_TEXT:C284(STK_Manage2011Updates; $1)
C_LONGINT:C283(STK_Manage2011Updates; $2)
C_LONGINT:C283(STK_Manage2011Updates; $3)
C_TEXT:C284(STK_Manage2011Updates; $4)

//STK_MENUUPDATE
C_TEXT:C284(STK_MenuUpdate; $1)
C_TEXT:C284(STK_MenuUpdate; $2)
C_BOOLEAN:C305(STK_MenuUpdate; $3)
C_BOOLEAN:C305(STK_MenuUpdate; $4)

//ORDERI_GETALLOCATED
C_REAL:C285(ORDERI_GetAllocated; $0)
C_LONGINT:C283(ORDERI_GetAllocated; $1)

//PDF_ENCYPTLOADPREFS
C_BOOLEAN:C305(PDF_EncyptLoadPrefs; $1)

//PDF_ENCRYPTVERFIFYLICENCE
C_BOOLEAN:C305(PDF_EncryptVerfifyLicence; $0)

//DBWS_COOKIESET
C_TEXT:C284(DBWS_CookieSet; $1)

//DBWS_GETWSFORM
C_TEXT:C284(DBWS_GetWSForm; $0)
C_TEXT:C284(DBWS_GetWSForm; $1)
C_TEXT:C284(DBWS_GetWSForm; $2)

//DBWS_SETPAGE
C_TEXT:C284(DBWS_SetPage; $1)
C_TEXT:C284(DBWS_SetPage; $2)

//DBWS_SMARTQUERY
C_TEXT:C284(DBWS_SmartQuery; $1)

//DBWS_GETINPUTVALUE
C_TEXT:C284(DBWS_GetInputValue; $0)
C_TEXT:C284(DBWS_GetInputValue; $1)

//DBWS_SMARTCREATE
C_TEXT:C284(DBWS_SmartCreate; $1)

//DBWS_CONTEXTTOTABLE
C_TEXT:C284(DBWS_ContexttoTable; $0)
C_TEXT:C284(DBWS_ContexttoTable; $1)

//DBWS_MESSAGE
C_TEXT:C284(DBWS_Message; $1)
C_TEXT:C284(DBWS_Message; $2)

//PROD_CHANGENLA
C_LONGINT:C283(PROD_ChangeNLA; $1)

//SF_MOVEMENTIN_LP
C_REAL:C285(SF_MovementIN_LP; $1)

//SF_MOVEMENTCODE
C_TEXT:C284(SF_MovementCode; $0)
C_TEXT:C284(SF_MovementCode; $1)

//SF_GETSTOCKMOVEMENTTYPENAME
C_TEXT:C284(SF_GetStockMovementTypeName; $0)

//SF_STOCKINLOADITEMS
C_TEXT:C284(SF_StockINLoadItems; $1)

//SF_MOVEMENTIN_TYPECHECK
C_TEXT:C284(SF_MovementIN_TypeCheck; $0)

//STK_SFITEM_LPX
C_POINTER:C301(STK_SFITEM_Lpx; $1)

//STK_SFITEM_SERIALNUMBER
C_POINTER:C301(STK_SFITEM_SerialNumber; $1)
C_POINTER:C301(STK_SFITEM_SerialNumber; $2)
C_POINTER:C301(STK_SFITEM_SerialNumber; $3)

//STK_l_ITEMGETDIRECTION
C_LONGINT:C283(STK_L_ItemGetDirection; $0)
C_TEXT:C284(STK_L_ItemGetDirection; $1)
C_TEXT:C284(STK_L_ItemGetDirection; $2)
C_TEXT:C284(STK_L_ItemGetDirection; $3)

//DBWS_GETPREFERENCES
C_TEXT:C284(DBWS_GetPreferences; $0)
C_BOOLEAN:C305(DBWS_GetPreferences; $1)

//MACRO_BREAKLINE
C_TEXT:C284(Macro_BreakLine; $1)
C_POINTER:C301(Macro_BreakLine; $2)
C_POINTER:C301(Macro_BreakLine; $3)
C_POINTER:C301(Macro_BreakLine; $4)

//MACRO_PLAY
C_REAL:C285(Macro_Play; $1)
C_POINTER:C301(Macro_Play; $2)
C_POINTER:C301(Macro_Play; $3)
C_POINTER:C301(Macro_Play; $4)
C_POINTER:C301(Macro_Play; $5)
C_POINTER:C301(Macro_Play; $6)

//PUR_PRINTAGEDCREDITORS
C_TEXT:C284(PUR_PrintAgedCreditors; $1)

//PUR_PRINTAGEDASATCREDITORS
C_TEXT:C284(PUR_PrintAgedasatCreditors; $1)

//MAC_TESTMACRO
C_TEXT:C284(MAC_TestMacro; $1)

//TRANSACTIONS_SEL2
C_TEXT:C284(Transactions_Sel2; $1)

//DBSWS_MENUJSON
C_TEXT:C284(DBSWS_MenuJSON; $1)

//DBWS_USERDATA
C_LONGINT:C283(DBWS_UserData; $1)

//DBWS_GETMENU
C_TEXT:C284(DBWS_GetMenu; $0)
C_LONGINT:C283(DBWS_GetMenu; $1)

//DBSW_MODULESJSON
C_TEXT:C284(DBSW_ModulesJSON; $1)

//AA_JUNK100
C_TEXT:C284(AA_JUNK100; $1)

//DBWS_DATATOJSON
C_TEXT:C284(DBWS_DatatoJSON; $0)
C_POINTER:C301(DBWS_DatatoJSON; ${-1})
C_POINTER:C301(DBWS_DatatoJSON; $1)
C_POINTER:C301(DBWS_DatatoJSON; $2)
C_POINTER:C301(DBWS_DatatoJSON; $3)
C_POINTER:C301(DBWS_DatatoJSON; $4)
C_POINTER:C301(DBWS_DatatoJSON; $5)
C_POINTER:C301(DBWS_DatatoJSON; $6)
C_POINTER:C301(DBWS_DatatoJSON; $7)
C_POINTER:C301(DBWS_DatatoJSON; $8)
C_POINTER:C301(DBWS_DatatoJSON; $9)

//GEN_ENTERRESTRICTEDMACRO
C_TEXT:C284(Gen_EnterRestrictedMacro; $0)
C_REAL:C285(Gen_EnterRestrictedMacro; $1)
C_REAL:C285(Gen_EnterRestrictedMacro; $2)
C_REAL:C285(Gen_EnterRestrictedMacro; $3)

//MACRO_RESULT_PICTURE
C_PICTURE:C286(Macro_Result_Picture; $0)
C_TEXT:C284(Macro_Result_Picture; $1)
C_TEXT:C284(Macro_Result_Picture; $2)

//MACRO_RESULT_BOOLEAN
C_BOOLEAN:C305(Macro_Result_Boolean; $0)
C_TEXT:C284(Macro_Result_Boolean; $1)
C_TEXT:C284(Macro_Result_Boolean; $2)

//MACRO_RESULT_TIME
C_TIME:C306(Macro_Result_Time; $0)
C_TEXT:C284(Macro_Result_Time; $1)
C_TEXT:C284(Macro_Result_Time; $2)

//MACRO_RESULT_DATE
C_DATE:C307(Macro_Result_Date; $0)
C_TEXT:C284(Macro_Result_Date; $1)
C_TEXT:C284(Macro_Result_Date; $2)

//MACRO_RESULT_TEXT
C_TEXT:C284(Macro_Result_Text; $0)
C_TEXT:C284(Macro_Result_Text; $1)
C_TEXT:C284(Macro_Result_Text; $2)

//MACRO_RESULT_REAL
C_REAL:C285(Macro_Result_Real; $0)
C_TEXT:C284(Macro_Result_Real; $1)
C_TEXT:C284(Macro_Result_Real; $2)

//MACRO_RESULT_LONG
C_LONGINT:C283(Macro_Result_Long; $0)
C_TEXT:C284(Macro_Result_Long; $1)
C_TEXT:C284(Macro_Result_Long; $2)

//GEN_EDITRESTICTEDMACRO
C_TEXT:C284(GEN_editRestictedMacro; $0)
C_TEXT:C284(GEN_editRestictedMacro; $1)
C_REAL:C285(GEN_editRestictedMacro; $2)
C_REAL:C285(GEN_editRestictedMacro; $3)

//STK_GETNEXTDELIVERY
C_DATE:C307(STK_GetNextDelivery; $0)

//STK_MODIFYPOONRECEIPT
C_LONGINT:C283(STK_ModifyPOonReceipt; $1)
C_REAL:C285(STK_ModifyPOonReceipt; $2)
C_BOOLEAN:C305(STK_ModifyPOonReceipt; $3)
C_LONGINT:C283(STK_ModifyPOonReceipt; $4)
//STK_GETMOVEMENTCLASS
C_TEXT:C284(STK_GetMovementClass; $0)
C_LONGINT:C283(STK_GetMovementClass; $1)
C_BOOLEAN:C305(STK_GetMovementClass; $2)
C_LONGINT:C283(STK_GetMovementClass; $3)

//ORDI_GETDELIVERYDATE
C_DATE:C307(OrdI_GetDeliveryDate; $0)

//ORDI_GETDELIVERYNUM
C_TEXT:C284(ORDI_GetDeliveryNum; $0)

//STK_GETCOMPANY
C_REAL:C285(STK_GetCompany; $1)
C_TEXT:C284(STK_GetCompany; $2)
C_LONGINT:C283(STK_GetCompany; $3)

//STK_ALLOCAUTOONRECEIPT
C_REAL:C285(STK_AllocAutoOnReceipt; $1)

//STK_UNALLOCATEINPROCESS
C_LONGINT:C283(STK_unallocateinprocess; $1)
C_REAL:C285(STK_unallocateinprocess; $2)

//STK_GETSTOCKITEMSP2
C_TEXT:C284(STK_GetStockItemsP2; $1)
C_TEXT:C284(STK_GetStockItemsP2; $2)
C_TEXT:C284(STK_GetStockItemsP2; $3)

//STK_ENTERMOVEMENTTYPE
C_TEXT:C284(STK_EnterMovementType; $1)
C_TEXT:C284(STK_EnterMovementType; $2)
C_TEXT:C284(STK_EnterMovementType; $3)
C_TEXT:C284(STK_EnterMovementType; $4)

//STK_RECEIVEFROMONORDER
C_TEXT:C284(STK_ReceiveFromOnOrder; $1)

//STK_UPDATEPAUSEWORKING
C_BOOLEAN:C305(STK_UpdatePauseWorking; $1)

//DBQR_HANDLEMENUS
C_LONGINT:C283(DBQR_HandleMenus; $1)
C_LONGINT:C283(DBQR_HandleMenus; $2)

//DB_REPLOADREPORT
C_BOOLEAN:C305(DB_REPLoadReport; $1)

//DB_REP_NEWREPORT
C_BOOLEAN:C305(DB_REP_NewReport; $1)

//MAC_NEWPROCESS
C_TIME:C306(MAC_NewProcess; $1)

//STK_VALIDATECALLEDOFF
C_REAL:C285(STK_ValidateCalledOff; $1)
C_REAL:C285(STK_ValidateCalledOff; $2)
C_TEXT:C284(STK_ValidateCalledOff; $3)

//AA_ListAddIteminProcess
C_LONGINT:C283(AA_ListAddIteminProcess; $3)

//AA_LoadNameArrays
C_POINTER:C301(AA_LoadNameArrays; $1)
C_POINTER:C301(AA_LoadNameArrays; $2)
C_POINTER:C301(AA_LoadNameArrays; $3)

//AA_SetIDbyTableNum
C_BOOLEAN:C305(AA_SetIDbyTableNum; $2)
C_POINTER:C301(AA_SetIDbyTableNum; $3)

//Acc_BalPage
C_LONGINT:C283(Acc_BalPage; $4)

//ACC_AddSubEntityLayers
C_TEXT:C284(ACC_AddSubEntityLayers; $1)

//ACC_DelSubEntityAnalyses
C_TEXT:C284(ACC_DelSubEntityAnalyses; $1)

//ACC_DelSubEntityLayers
C_TEXT:C284(ACC_DelSubEntityLayers; $1)

//ACC_GetTransactions
C_TEXT:C284(ACC_GetTransactions; $1)
C_TEXT:C284(ACC_GetTransactions; $2)
C_TEXT:C284(ACC_GetTransactions; $3)
C_TEXT:C284(ACC_GetTransactions; $4)
C_TEXT:C284(ACC_GetTransactions; $5)

//ACC_ValidateSubitems
C_LONGINT:C283(ACC_ValidateSubitems; $4)
C_LONGINT:C283(ACC_ValidateSubitems; $5)
C_LONGINT:C283(ACC_ValidateSubitems; $6)
C_LONGINT:C283(ACC_ValidateSubitems; $7)

//Address_ContactName
C_POINTER:C301(Address_ContactName; $1)
C_POINTER:C301(Address_ContactName; $2)
C_POINTER:C301(Address_ContactName; $3)
C_POINTER:C301(Address_ContactName; $4)
C_POINTER:C301(Address_ContactName; $5)
C_POINTER:C301(Address_ContactName; $6)
C_LONGINT:C283(Address_ContactName; $7)
C_LONGINT:C283(Address_ContactName; $8)

//Address_DetailsConstruct
C_POINTER:C301(Address_DetailsConstruct; $4)

//Array_CopyFiles
C_POINTER:C301(Array_CopyFiles; $1)

//Ask_PersonOK
C_TEXT:C284(Ask_PersonOK; $0)
C_TEXT:C284(Ask_PersonOK; $1)

//Check_Analysis
C_LONGINT:C283(Check_Analysis; $5)
C_LONGINT:C283(Check_Analysis; $6)
C_REAL:C285(Check_Analysis; $7)
C_REAL:C285(Check_Analysis; $8)

//Check_Locked
C_BOOLEAN:C305(Check_Locked; $3)

//Check_MinorNC
C_REAL:C285(Check_MinorNC; $11)
C_REAL:C285(Check_MinorNC; $12)

//Cont_SelPifs
C_TEXT:C284(Cont_SelPifs; $3)

//Cont_SelPOther
C_TEXT:C284(Cont_SelPOther; $6)

//DB_SaveRecord
C_BOOLEAN:C305(DB_SaveRecord; $2)

//Diary_SeqCreate
C_TEXT:C284(Diary_SeqCreate; $1)
C_OBJECT:C1216(Diary_SeqCreate; $2)

//FSettings_loadPreferences
C_TEXT:C284(FSettings_loadPreferences; $2)

//FurthFld_Arr
C_POINTER:C301(FurthFld_Arr; $2)
C_POINTER:C301(FurthFld_Arr; $3)
C_POINTER:C301(FurthFld_Arr; $4)
C_POINTER:C301(FurthFld_Arr; $5)
C_POINTER:C301(FurthFld_Arr; $6)
C_POINTER:C301(FurthFld_Arr; $7)
C_POINTER:C301(FurthFld_Arr; $8)
C_POINTER:C301(FurthFld_Arr; $9)

//FurthFld_Get
C_TEXT:C284(FurthFld_Get; $4)

//Gen_CUScript
C_LONGINT:C283(Gen_CUScript; $1)

//Gen_ListAp2
C_TEXT:C284(Gen_ListAp2; $3)
C_TEXT:C284(Gen_ListAp2; $4)
C_TEXT:C284(Gen_ListAp2; $5)
C_BOOLEAN:C305(Gen_ListAp2; $6)

//Gen_ListApFF
C_TEXT:C284(Gen_ListApFF; $3)
C_TEXT:C284(Gen_ListApFF; $4)
C_TEXT:C284(Gen_ListApFF; $5)
C_BOOLEAN:C305(Gen_ListApFF; $6)

//Gen_ListSet
C_POINTER:C301(Gen_ListSet; $2)

//Gen_Message
C_LONGINT:C283(Gen_Message; $3)

//GEN_CONVERT
C_TEXT:C284(GEN_CONVERT; $4)

//INT_SkinsPrefs
C_LONGINT:C283(INT_SkinsPrefs; $0)

//Letters_InSWTem
C_TEXT:C284(Letters_InSWTem; $1)

//Macro
C_TEXT:C284(Macro; $3)
C_LONGINT:C283(Macro; $4)

//Mail_MSProcess
C_POINTER:C301(Mail_MSProcess; $1)

//Mail_MSProcess_NEW
C_POINTER:C301(Mail_MSProcess_NEW; $1)

//MAsk_MS
C_POINTER:C301(MAsk_MS; $1)

//Menu_CM
C_LONGINT:C283(Menu_CM; $1)

//Menu Jobs
C_LONGINT:C283(Menu_Jobs; $1)

//Menu Lists
C_LONGINT:C283(Menu_Lists; $1)

//Menu ListsS
C_LONGINT:C283(Menu_ListsS; $1)

//Menu Main
C_LONGINT:C283(Menu_Main; $1)

//Menu Nom
C_LONGINT:C283(Menu_Nom; $1)

//Menu POP
C_LONGINT:C283(Menu_POP; $1)


//Menu Purch
C_LONGINT:C283(Menu_Purch; $1)

//Menu_Remote
C_LONGINT:C283(Menu_Remote; $1)

//Menu Sales
C_LONGINT:C283(Menu_Sales; $1)

//Menu Silver
C_LONGINT:C283(Menu_Silver; $1)

//Menu SilverP
C_LONGINT:C283(Menu_SilverP; $1)

//Menu SOP
C_TEXT:C284(Menu_SOP; $1)

C_TEXT:C284(Menu_SOP; $2)
C_TEXT:C284(Menu_SOP; $3)
C_LONGINT:C283(Menu_SOP; $4)

//Menu Stock
C_LONGINT:C283(Menu_Stock; $1)

//Menu Tech
C_LONGINT:C283(Menu_Tech; $1)

//Menu WP
C_LONGINT:C283(Menu_WP; $1)

//MList_Print
C_POINTER:C301(MList_Print; $1)

//MonthName
C_LONGINT:C283(MonthName; $2)

//UTI_VarIsNull
C_BOOLEAN:C305(UTI_VarIsNull; $0)
C_POINTER:C301(UTI_VarIsNull; $1)

//On Event Wait
C_TEXT:C284(On_Event_Wait; $1)

//OPEN_THERMOMETER
C_BOOLEAN:C305(OPEN_THERMOMETER; $4)

//OPEN_THERMOMETER1
C_BOOLEAN:C305(OPEN_THERMOMETER1; $3)

//OrderI_AllocAu2
C_LONGINT:C283(OrderI_AllocAu2; $1)
C_LONGINT:C283(OrderI_AllocAu2; $2)
C_LONGINT:C283(OrderI_AllocAu2; $3)
C_POINTER:C301(OrderI_AllocAu2; $4)
C_POINTER:C301(OrderI_AllocAu2; $5)

//OrderI_Split2
C_BOOLEAN:C305(OrderI_Split2; $1)

//Period_Create
C_LONGINT:C283(Period_Create; $2)
C_BOOLEAN:C305(Period_Create; $3)

//PurchOrd_InLPß
C_BOOLEAN:C305(PurchOrd_InLPß; $2)

//PW_CHECKUSERS
C_BOOLEAN:C305(PW_CHECKUSERS; $1)

//QV_SaveCurrentQuality
C_BOOLEAN:C305(QV_SaveCurrentQuality; $3)

//QV_ShowQualities
C_LONGINT:C283(QV_ShowQualities; $0)

//Record_EditLst
C_LONGINT:C283(Record_EditLst; $2)
C_TEXT:C284(Record_EditLst; $3)

//Record_Macro
C_TEXT:C284(Record_Macro; $1)
C_LONGINT:C283(Record_Macro; $2)

//Record_Play
C_TEXT:C284(Record_Play; $4)
C_BOOLEAN:C305(Record_Play; $5)

//SD_GetGroups
C_OBJECT:C1216(SD_GetGroups; $0)

//SD_groupPrefs
C_OBJECT:C1216(SD_groupPrefs; $0)

//SD_LoadPrefs
C_OBJECT:C1216(SD_LoadPrefs; $0)

//StatsView_View
C_LONGINT:C283(StatsView_View; $1)

//StatsView_ViewR
C_REAL:C285(StatsView_ViewR; $1)

//StockI_InLPB
C_TEXT:C284(StockI_InLPB; $1)

//ST_LoadFunctions
C_POINTER:C301(ST_LoadFunctions; $3)

//Trans_SubLPLayer
C_LONGINT:C283(Trans_SubLPLayer; $8)
C_LONGINT:C283(Trans_SubLPLayer; $9)

//Trans_SVCF
C_POINTER:C301(Trans_SVCF; $1)
C_LONGINT:C283(Trans_SVCF; $2)

//User_vAT
C_TEXT:C284(User_vAT; $1)

//ZRecord_EditLst
C_LONGINT:C283(ZRecord_EditLst; $0)
C_LONGINT:C283(ZRecord_EditLst; $1)
C_TEXT:C284(ZRecord_EditLst; $2)
C_TEXT:C284(ZRecord_EditLst; $3)

//ACC_AutoPostProfit
C_REAL:C285(ACC_AutoPostProfit; $0)
C_BOOLEAN:C305(ACC_AutoPostProfit; $5)

//SD2_ActionAttributesToArrays
C_POINTER:C301(SD2_ActionAttributesToArrays; $1)

//GEN_ChoicePopupCall
C_LONGINT:C283(GEN_ChoicePopupCall; $7)
C_LONGINT:C283(GEN_ChoicePopupCall; $8)
C_LONGINT:C283(GEN_ChoicePopupCall; $9)
C_LONGINT:C283(GEN_ChoicePopupCall; $10)

//SD2_Actions_Mod
C_TEXT:C284(SD2_Actions_Mod; $1)
C_TEXT:C284(SD2_Actions_Mod; $2)

//AAJunk_5
C_REAL:C285(AAJunk_5; $0)
C_LONGINT:C283(AAJunk_5; $1)
C_BOOLEAN:C305(AAJunk_5; $2)

//SuperReportToPDF
C_POINTER:C301(SuperReportToPDF; $4)

//SD2_LoadDefaultAttributes
C_OBJECT:C1216(SD2_LoadDefaultAttributes; $0)
C_POINTER:C301(SD2_LoadDefaultAttributes; $1)

//ORDI_GetSortRef
C_REAL:C285(ORDI_GetSortRef; $3)

//LBi_DragCopy
C_TEXT:C284(LBi_DragCopy; $4)

//LBi_LoadSetup
C_LONGINT:C283(LBi_LoadSetup; $4)

//LBi_Xminus
C_BOOLEAN:C305(LBi_Xminus; $2)

//LBi_xPlus
C_LONGINT:C283(LBi_xPlus; $0)
C_LONGINT:C283(LBi_xPlus; $6)

//LB_SetChoiceList
C_POINTER:C301(LB_SetChoiceList; $4)

//LB_SetColumnHeaders
C_LONGINT:C283(LB_SetColumnHeaders; $0)

//LB_SetColumnWidths
C_LONGINT:C283(LB_SetColumnWidths; $0)

//LBi_ArrUpdate
C_REAL:C285(LBi_ArrUpdate; $4)
C_REAL:C285(LBi_ArrUpdate; $5)

//LBi_AreaScript
C_TEXT:C284(LBi_AreaScript; $9)

//SRCH_StandardSearch
C_TEXT:C284(SRCH_StandardSearch; $2)
C_LONGINT:C283(SRCH_StandardSearch; $4)

//SD2_AddDiaryRecord
C_REAL:C285(SD2_AddDiaryRecord; $5)

//COM_SelectDiaryRecords
C_TEXT:C284(COM_SelectDiaryRecords; $0)

//FUR_FIELDSLOAD
C_POINTER:C301(FUR_FIELDSLOAD; $2)
C_POINTER:C301(FUR_FIELDSLOAD; $3)

//DB_ProcessMemoryinit
C_LONGINT:C283(DB_ProcessMemoryinit; $0)
C_LONGINT:C283(DB_ProcessMemoryinit; $1)

//START_RegisterPlugins
C_BOOLEAN:C305(START_RegisterPlugins; $0)

//PREF_GetPreferenceID
C_LONGINT:C283(PREF_GetPreferenceID; $3)

//BAR_ButtonMethod
C_LONGINT:C283(BAR_ButtonMethod; $3)

//MACRO_ParseForCode
C_BOOLEAN:C305(MACRO_ParseForCode; $2)

//DB_BigUnittest
C_BOOLEAN:C305(DB_BigUnittest; $0)
C_TEXT:C284(DB_BigUnittest; $1)

//DB_Get_Designer
C_BOOLEAN:C305(DB_Get_Designer; $2)

//DB_EditFieldNames
C_POINTER:C301(DB_EditFieldNames; $3)

//DB_MenuCreateFunctionsMenu
C_TEXT:C284(DB_MenuCreateFunctionsMenu; $4)

//DB_SetBrowserBarSelection
C_TEXT:C284(DB_SetBrowserBarSelection; $5)

//DB_MenuCreateReportsMenu
C_TEXT:C284(DB_MenuCreateReportsMenu; $4)

//DB_MenuCreateFileMenu
C_TEXT:C284(DB_MenuCreateFileMenu; $4)

//DB_MenuCreateEditMenu
C_TEXT:C284(DB_MenuCreateEditMenu; $3)

//DB_BuildVolumesMenu
C_TEXT:C284(DB_BuildVolumesMenu; $1)
C_TEXT:C284(DB_BuildVolumesMenu; $2)
C_TEXT:C284(DB_BuildVolumesMenu; $3)

//DB_CreateFilemenu
C_TEXT:C284(DB_CreateFilemenu; $1)
C_TEXT:C284(DB_CreateFilemenu; $2)
C_TEXT:C284(DB_CreateFilemenu; $3)

//DB_CreateEditMenu
C_TEXT:C284(DB_CreateEditMenu; $1)
C_TEXT:C284(DB_CreateEditMenu; $2)
C_TEXT:C284(DB_CreateEditMenu; $3)

//DB_SetFormSortOrder
C_POINTER:C301(DB_SetFormSortOrder; $5)

//DB_OutEditRecord
C_LONGINT:C283(DB_OutEditRecord; $2)

//SEL_CurrentRecordSelection
C_BOOLEAN:C305(SEL_CurrentRecordSelection; $1)

//SM_BlobtoSeachVars
C_POINTER:C301(SM_BlobtoSeachVars; $30)
C_POINTER:C301(SM_BlobtoSeachVars; $31)
C_POINTER:C301(SM_BlobtoSeachVars; $32)
C_POINTER:C301(SM_BlobtoSeachVars; $33)
C_POINTER:C301(SM_BlobtoSeachVars; $34)
C_POINTER:C301(SM_BlobtoSeachVars; $35)

//DB_GetRelatedRecords
C_BOOLEAN:C305(DB_GetRelatedRecords; $3)

//DB_OpenRecordFromSelection
C_LONGINT:C283(DB_OpenRecordFromSelection; $1)
C_REAL:C285(DB_OpenRecordFromSelection; $2)
C_TEXT:C284(DB_OpenRecordFromSelection; $3)

//DB_MenuNewRecord
C_POINTER:C301(DB_MenuNewRecord; $9)

//DB_HandleInputFormButtons
C_LONGINT:C283(DB_HandleInputFormButtons; $2)

//ProductDeletionPreferences
C_BOOLEAN:C305(ProductDeletionPreferences; $1)

//DB_SalesPersonsUsed
C_LONGINT:C283(DB_SalesPersonsUsed; $2)

//DB_MenuCreateViewsMenu
C_TEXT:C284(DB_MenuCreateViewsMenu; $3)

//STK_UpdateStockLevels
C_LONGINT:C283(STK_UpdateStockLevels; $7)

//STK_GetPreviousStockMovementPro
C_BOOLEAN:C305(STK_GetPreviousStockMovementPro; $19)
C_BOOLEAN:C305(STK_GetPreviousStockMovementPro; $20)

//STK_CreateCurrentStock
C_BOOLEAN:C305(STK_CreateCurrentStock; $12)

//STK_GetPreviousStockMovement
C_BOOLEAN:C305(STK_GetPreviousStockMovement; $19)

//ORDERI_GetAllocated
C_BOOLEAN:C305(ORDERI_GetAllocated; $2)

//AA_Junk101
C_LONGINT:C283(AA_Junk101; $1)
C_LONGINT:C283(AA_Junk101; $2)

//DBWS_DatatoJSON
C_POINTER:C301(DBWS_DatatoJSON; $10)
C_POINTER:C301(DBWS_DatatoJSON; $11)
C_POINTER:C301(DBWS_DatatoJSON; $12)

//DB_MenuToArray
C_TEXT:C284(DB_MenuToArray; $1)
C_TEXT:C284(DB_MenuToArray; $2)

//DB_MenuValidateShortcut
C_TEXT:C284(DB_MenuValidateShortcut; $1)
C_TEXT:C284(DB_MenuValidateShortcut; $2)
C_LONGINT:C283(DB_MenuValidateShortcut; $3)

//DB_MenuGetSRreports
C_LONGINT:C283(DB_MenuGetSRreports; $1)
C_BOOLEAN:C305(DB_MenuGetSRreports; $2)
C_BOOLEAN:C305(DB_MenuGetSRreports; $3)
C_TEXT:C284(DB_MenuGetSRreports; $4)
C_TEXT:C284(DB_MenuGetSRreports; $5)
C_BOOLEAN:C305(DB_MenuGetSRreports; $6)
C_BOOLEAN:C305(DB_MenuGetSRreports; $7)

//DB_MenuAppendItem
C_TEXT:C284(DB_MenuAppendItem; $1)
C_TEXT:C284(DB_MenuAppendItem; $2)
C_TEXT:C284(DB_MenuAppendItem; $3)
C_TEXT:C284(DB_MenuAppendItem; $4)
C_TEXT:C284(DB_MenuAppendItem; $5)
C_LONGINT:C283(DB_MenuAppendItem; $6)
C_BOOLEAN:C305(DB_MenuAppendItem; $7)
C_LONGINT:C283(DB_MenuAppendItem; $8)
C_POINTER:C301(DB_MenuAppendItem; $9)
C_POINTER:C301(DB_MenuAppendItem; $10)
C_POINTER:C301(DB_MenuAppendItem; $11)
C_POINTER:C301(DB_MenuAppendItem; $12)
C_POINTER:C301(DB_MenuAppendItem; $13)

//ORD_QuickAddButtons
C_LONGINT:C283(ORD_QuickAddButtons; $1)
C_LONGINT:C283(ORD_QuickAddButtons; $2)
C_LONGINT:C283(ORD_QuickAddButtons; $3)

//STK_reAllocAutoOnReceipt
C_LONGINT:C283(STK_reAllocAutoOnReceipt; $1)

//OrderI_fullyAllocated
C_BOOLEAN:C305(OrderI_fullyAllocated; $0)

//STK_GetMovementCompany
C_TEXT:C284(STK_GetMovementCompany; $1)
C_LONGINT:C283(STK_GetMovementCompany; $2)

//CreatePSInProcess
C_LONGINT:C283(CreatePSInProcess; $1)
C_LONGINT:C283(CreatePSInProcess; $2)
C_LONGINT:C283(CreatePSInProcess; $3)
C_TEXT:C284(CreatePSInProcess; $4)
C_LONGINT:C283(CreatePSInProcess; $5)
C_LONGINT:C283(CreatePSInProcess; $6)
C_LONGINT:C283(CreatePSInProcess; $7)
C_BOOLEAN:C305(CreatePSInProcess; $8)
C_POINTER:C301(CreatePSInProcess; $9)

//STK_SetItemNumber
C_LONGINT:C283(STK_SetItemNumber; $1)

//STK_SetCalledOffInProcess
C_LONGINT:C283(STK_SetCalledOffInProcess; $1)
C_REAL:C285(STK_SetCalledOffInProcess; $2)
C_LONGINT:C283(STK_SetCalledOffInProcess; $3)

//STK_ValidateCalledAfterProcess
C_LONGINT:C283(STK_ValidateCalledAfterProcess; $1)
C_LONGINT:C283(STK_ValidateCalledAfterProcess; $2)

//STK_GetDestination
C_LONGINT:C283(STK_GetDestination; $1)
C_LONGINT:C283(STK_GetDestination; $2)

//STK_GetOriginInformation
C_TEXT:C284(STK_GetOriginInformation; $0)
C_LONGINT:C283(STK_GetOriginInformation; $1)
C_LONGINT:C283(STK_GetOriginInformation; $2)

//ACC_ImportStatementRecords
C_TEXT:C284(ACC_ImportStatementRecords; $1)

//ACC_EditImportSettings
C_TEXT:C284(ACC_EditImportSettings; $1)
C_TEXT:C284(ACC_EditImportSettings; $2)
C_BOOLEAN:C305(ACC_EditImportSettings; $3)
C_POINTER:C301(ACC_EditImportSettings; $4)

//ACC_ReconcileTransaction
C_LONGINT:C283(ACC_ReconcileTransaction; $1)
C_TEXT:C284(ACC_ReconcileTransaction; $2)
C_REAL:C285(ACC_ReconcileTransaction; $3)
C_REAL:C285(ACC_ReconcileTransaction; $4)
C_TEXT:C284(ACC_ReconcileTransaction; $5)
C_TEXT:C284(ACC_ReconcileTransaction; $6)

//ABR_CalculateBalance
C_REAL:C285(ABR_CalculateBalance; $0)
C_POINTER:C301(ABR_CalculateBalance; $1)

//STK_VerifyCopiedFrom
C_BOOLEAN:C305(STK_VerifyCopiedFrom; $0)
C_LONGINT:C283(STK_VerifyCopiedFrom; $1)
C_LONGINT:C283(STK_VerifyCopiedFrom; $2)
C_TEXT:C284(STK_VerifyCopiedFrom; $3)
C_REAL:C285(STK_VerifyCopiedFrom; $4)
C_TEXT:C284(STK_VerifyCopiedFrom; $5)
C_TEXT:C284(STK_VerifyCopiedFrom; $6)
C_TEXT:C284(STK_VerifyCopiedFrom; $7)
C_TEXT:C284(STK_VerifyCopiedFrom; $8)

//DBWS_MenutoJSON
C_TEXT:C284(DBWS_MenutoJSON; $0)
C_TEXT:C284(DBWS_MenutoJSON; $1)
C_TEXT:C284(DBWS_MenutoJSON; $2)

//CCM_PaypalRequest
C_LONGINT:C283(CCM_PaypalRequest; $0)
C_BOOLEAN:C305(CCM_PaypalRequest; $1)
C_TEXT:C284(CCM_PaypalRequest; $2)
C_TEXT:C284(CCM_PaypalRequest; $3)
C_TEXT:C284(CCM_PaypalRequest; $4)
C_TEXT:C284(CCM_PaypalRequest; $5)
C_LONGINT:C283(CCM_PaypalRequest; $6)
C_TEXT:C284(CCM_PaypalRequest; $7)
C_TEXT:C284(CCM_PaypalRequest; $8)

//CCM_PP_Initiate
C_LONGINT:C283(CCM_PP_Initiate; $0)

//CCM_PP_InsertData
C_LONGINT:C283(CCM_PP_InsertData; $1)
C_TEXT:C284(CCM_PP_InsertData; $2)
C_TEXT:C284(CCM_PP_InsertData; $3)
C_TEXT:C284(CCM_PP_InsertData; $4)
C_TEXT:C284(CCM_PP_InsertData; $5)
C_TEXT:C284(CCM_PP_InsertData; $6)
C_TEXT:C284(CCM_PP_InsertData; $7)
C_TEXT:C284(CCM_PP_InsertData; $8)
C_TEXT:C284(CCM_PP_InsertData; $9)
C_TEXT:C284(CCM_PP_InsertData; $10)
C_TEXT:C284(CCM_PP_InsertData; $11)
C_TEXT:C284(CCM_PP_InsertData; $12)
C_TEXT:C284(CCM_PP_InsertData; $13)

//CCM_PaypalGetTransactionDetails
C_TEXT:C284(CCM_PaypalGetTransactionDetails; $0)
C_TEXT:C284(CCM_PaypalGetTransactionDetails; $1)
C_TEXT:C284(CCM_PaypalGetTransactionDetails; $2)
C_TEXT:C284(CCM_PaypalGetTransactionDetails; $3)
C_TEXT:C284(CCM_PaypalGetTransactionDetails; $4)
C_BOOLEAN:C305(CCM_PaypalGetTransactionDetails; $5)

//STK_ISHC_GetParent
C_TEXT:C284(STK_ISHC_GetParent; $1)

//STK_DeleteUsedNulItems
C_BOOLEAN:C305(STK_DeleteUsedNulItems; $1)

//STK_ResetCalledOff
C_BOOLEAN:C305(STK_ResetCalledOff; $1)

//STK_ManageCalledOff
C_LONGINT:C283(STK_ManageCalledOff; $1)
C_LONGINT:C283(STK_ManageCalledOff; $2)

//STK_GetPOItemNumber
C_LONGINT:C283(STK_GetPOItemNumber; $0)
C_LONGINT:C283(STK_GetPOItemNumber; $1)
C_LONGINT:C283(STK_GetPOItemNumber; $2)

//DB_CompareOldVersion
C_TEXT:C284(DB_CompareOldVersion; $0)

//CCM_DisplayActivityPP
C_TEXT:C284(CCM_DisplayActivityPP; $1)

//PRT_DymoLabel
C_TEXT:C284(PRT_DymoLabel; $1)
C_POINTER:C301(PRT_DymoLabel; $2)
C_LONGINT:C283(PRT_DymoLabel; $3)

//DYMO_GetOrderAddress
C_TEXT:C284(DYMO_GetOrderAddress; $0)

//PRT_ManageDymoSettings
C_BOOLEAN:C305(PRT_ManageDymoSettings; $1)

//PRT_DymoSelectLabel
C_TEXT:C284(PRT_DymoSelectLabel; $0)
C_BOOLEAN:C305(PRT_DymoSelectLabel; $1)

//DOC_LoadAccess
C_TEXT:C284(DOC_LoadAccess; $1)

//DOC_SaveAccess
C_TEXT:C284(DOC_SaveAccess; $1)

//SM_SetUpFFArray
C_POINTER:C301(SM_SetUpFFArray; $1)

//SRCH_SetupContextualPeriods
C_POINTER:C301(SRCH_SetupContextualPeriods; $1)
C_POINTER:C301(SRCH_SetupContextualPeriods; $2)

//SRCH_SetHLContextualDates
C_POINTER:C301(SRCH_SetHLContextualDates; $1)

//BAR_DisplayDates
C_LONGINT:C283(BAR_DisplayDates; $1)
C_LONGINT:C283(BAR_DisplayDates; $2)
C_LONGINT:C283(BAR_DisplayDates; $3)
C_TEXT:C284(BAR_DisplayDates; $4)

//DB_SetFieldDefTable
C_TEXT:C284(DB_SetFieldDefTable; $1)

//DB_ShowFloatingButtons
C_LONGINT:C283(DB_ShowFloatingButtons; $1)
C_TEXT:C284(DB_ShowFloatingButtons; $2)
C_LONGINT:C283(DB_ShowFloatingButtons; $3)
C_LONGINT:C283(DB_ShowFloatingButtons; $4)
C_TEXT:C284(DB_ShowFloatingButtons; $5)

//DB_FloatingButtons
C_LONGINT:C283(DB_FloatingButtons; $1)
C_TEXT:C284(DB_FloatingButtons; $2)
C_LONGINT:C283(DB_FloatingButtons; $3)
C_LONGINT:C283(DB_FloatingButtons; $4)
C_TEXT:C284(DB_FloatingButtons; $5)

//SR_FormExists
C_BOOLEAN:C305(SR_FormExists; $0)
C_TEXT:C284(SR_FormExists; $1)
C_TEXT:C284(SR_FormExists; $2)

//DirectoryFromPathName
C_TEXT:C284(DirectoryFromPathName; $0)
C_TEXT:C284(DirectoryFromPathName; $1)

//LBi_ArrDef07
C_LONGINT:C283(LBi_ArrDef07; $1)

//LBi_ArrDef10
C_LONGINT:C283(LBi_ArrDef10; $1)

//LBi_ArrDef20
C_LONGINT:C283(LBi_ArrDef20; $1)

//LBi_ArrDef30
C_LONGINT:C283(LBi_ArrDef30; $1)

//LBi_ArrDef40
C_LONGINT:C283(LBi_ArrDef40; $1)

//LBi_ArrDef50
C_LONGINT:C283(LBi_ArrDef50; $1)

//LBi_ArrDef60
C_LONGINT:C283(LBi_ArrDef60; $1)

//LBi_ArrDef70
C_LONGINT:C283(LBi_ArrDef70; $1)

//LBi_ArrDef80
C_LONGINT:C283(LBi_ArrDef80; $1)

//LBi_ArrDef90
C_LONGINT:C283(LBi_ArrDef90; $1)

//SCPT_MiniMacros
C_LONGINT:C283(SCPT_MiniMacros; $1)
C_TEXT:C284(SCPT_MiniMacros; $2)

//SCPT_HideLargePallete
C_LONGINT:C283(SCPT_HideLargePallete; $1)

//SCPT_Palette
C_LONGINT:C283(SCPT_Palette; $1)
C_LONGINT:C283(SCPT_Palette; $2)

//DB_BuildWIndowsMenu
C_TEXT:C284(DB_BuildWIndowsMenu; $0)
C_TEXT:C284(DB_BuildWIndowsMenu; $1)
C_TEXT:C284(DB_BuildWIndowsMenu; $2)
C_TEXT:C284(DB_BuildWIndowsMenu; $3)
C_TEXT:C284(DB_BuildWIndowsMenu; $4)

//DB_ProcesstoFront
C_TEXT:C284(DB_ProcesstoFront; $1)

//Sel_SSStringSINArray
C_POINTER:C301(Sel_SSStringSINArray; $1)
C_POINTER:C301(Sel_SSStringSINArray; $2)
C_POINTER:C301(Sel_SSStringSINArray; $3)
C_POINTER:C301(Sel_SSStringSINArray; $4)

//ORDI_RejectCells
C_BOOLEAN:C305(ORDI_RejectCells; $0)
C_POINTER:C301(ORDI_RejectCells; $1)
C_BOOLEAN:C305(ORDI_RejectCells; $2)
C_POINTER:C301(ORDI_RejectCells; $3)

//AA_LoadOwnedListByName
C_LONGINT:C283(AA_LoadOwnedListByName; $0)
C_LONGINT:C283(AA_LoadOwnedListByName; $1)
C_TEXT:C284(AA_LoadOwnedListByName; $2)
C_POINTER:C301(AA_LoadOwnedListByName; $3)
C_POINTER:C301(AA_LoadOwnedListByName; $4)
C_BOOLEAN:C305(AA_LoadOwnedListByName; $5)
C_POINTER:C301(AA_LoadOwnedListByName; $6)
C_POINTER:C301(AA_LoadOwnedListByName; $7)
C_POINTER:C301(AA_LoadOwnedListByName; $8)
C_POINTER:C301(AA_LoadOwnedListByName; $9)
C_POINTER:C301(AA_LoadOwnedListByName; $10)

//AA_GetOwnedTopLevelListNames
C_LONGINT:C283(AA_GetOwnedTopLevelListNames; $1)
C_POINTER:C301(AA_GetOwnedTopLevelListNames; $2)
C_POINTER:C301(AA_GetOwnedTopLevelListNames; $3)

//AA_LoadOwnedListName
C_LONGINT:C283(AA_LoadOwnedListName; $0)
C_LONGINT:C283(AA_LoadOwnedListName; $1)
C_LONGINT:C283(AA_LoadOwnedListName; $2)
C_TEXT:C284(AA_LoadOwnedListName; $3)

//AA_LoadOwnedListByID
C_LONGINT:C283(AA_LoadOwnedListByID; $1)
C_LONGINT:C283(AA_LoadOwnedListByID; $2)
C_POINTER:C301(AA_LoadOwnedListByID; $3)
C_POINTER:C301(AA_LoadOwnedListByID; $4)
C_BOOLEAN:C305(AA_LoadOwnedListByID; $5)
C_POINTER:C301(AA_LoadOwnedListByID; $6)
C_POINTER:C301(AA_LoadOwnedListByID; $7)
C_POINTER:C301(AA_LoadOwnedListByID; $8)
C_POINTER:C301(AA_LoadOwnedListByID; $9)

//DB_GetOrganisation
C_TEXT:C284(DB_GetOrganisation; $0)

//DB_GetOrganisationAddress
C_TEXT:C284(DB_GetOrganisationAddress; $0)

//DB_GetOrganisationTelephone
C_TEXT:C284(DB_GetOrganisationTelephone; $0)

//DB_GetOrganisationVAT
C_TEXT:C284(DB_GetOrganisationVAT; $0)

//DB_LoadConfigurationPrefs
C_BOOLEAN:C305(DB_LoadConfigurationPrefs; $1)
C_BOOLEAN:C305(DB_LoadConfigurationPrefs; $2)
C_LONGINT:C283(DB_LoadConfigurationPrefs; $3)

//DB_GetOrganisationVATPrefix
C_TEXT:C284(DB_GetOrganisationVATPrefix; $0)

//DB_GetOrganisationOfficeCode
C_TEXT:C284(DB_GetOrganisationOfficeCode; $0)

//DB_LoadLedgerPreferences
C_BOOLEAN:C305(DB_LoadLedgerPreferences; $1)
C_BOOLEAN:C305(DB_LoadLedgerPreferences; $2)
C_LONGINT:C283(DB_LoadLedgerPreferences; $3)

//DB_GetSalesLedgerFromDate
C_DATE:C307(DB_GetSalesLedgerFromDate; $0)

//DB_GetSalesLedgerBankFrom
C_TEXT:C284(DB_GetSalesLedgerBankFrom; $0)

//DB_SaveLedgerPreferences
C_BOOLEAN:C305(DB_SaveLedgerPreferences; $1)

//DB_GetSalesLedgerBankTo
C_TEXT:C284(DB_GetSalesLedgerBankTo; $0)

//DB_GetLedgerExchangeControlACC
C_TEXT:C284(DB_GetLedgerExchangeControlACC; $0)

//DB_GetLedgerExchangeACC
C_TEXT:C284(DB_GetLedgerExchangeACC; $0)

//DB_GetLedgerProfitAdjACC
C_TEXT:C284(DB_GetLedgerProfitAdjACC; $0)

//DB_GetLedgerBroughtforwardACC
C_TEXT:C284(DB_GetLedgerBroughtforwardACC; $0)

//DB_GetLedgerProfitACC
C_TEXT:C284(DB_GetLedgerProfitACC; $0)

//DB_GetLedgerCashFromACC
C_TEXT:C284(DB_GetLedgerCashFromACC; $0)

//DB_GetLedgerCashToACC
C_TEXT:C284(DB_GetLedgerCashToACC; $0)

//DB_GetLedgerVatInputACC
C_TEXT:C284(DB_GetLedgerVatInputACC; $0)

//DB_GetLedgerVatoutputACC
C_TEXT:C284(DB_GetLedgerVatoutputACC; $0)

//DB_GetLedgerCreditNotSeqPref
C_BOOLEAN:C305(DB_GetLedgerCreditNotSeqPref; $0)

//DB_GetLedgerActualLayer
C_TEXT:C284(DB_GetLedgerActualLayer; $0)

//DB_GetLedgerDefaultTerms
C_TEXT:C284(DB_GetLedgerDefaultTerms; $0)
C_TEXT:C284(DB_GetLedgerDefaultTerms; $1)

//DB_GetLedgerInvoiceDefaultStage
C_TEXT:C284(DB_GetLedgerInvoiceDefaultStage; $0)

//DB_GetLedgerADStageOne
C_LONGINT:C283(DB_GetLedgerADStageOne; $0)

//DB_GetLedgerADStageTwo
C_LONGINT:C283(DB_GetLedgerADStageTwo; $0)

//DB_GetLedgerADStageThree
C_LONGINT:C283(DB_GetLedgerADStageThree; $0)

//DB_GetLedgerDefaultPurchaseTax
C_TEXT:C284(DB_GetLedgerDefaultPurchaseTax; $0)

//DB_GetLedgerDefaultSalesTax
C_TEXT:C284(DB_GetLedgerDefaultSalesTax; $0)

//DB_LoadTerminologyPreferences
C_BOOLEAN:C305(DB_LoadTerminologyPreferences; $1)
C_BOOLEAN:C305(DB_LoadTerminologyPreferences; $2)
C_LONGINT:C283(DB_LoadTerminologyPreferences; $3)

//DB_GetTranslatedTerminology
C_TEXT:C284(DB_GetTranslatedTerminology; $0)
C_LONGINT:C283(DB_GetTranslatedTerminology; $1)
C_TEXT:C284(DB_GetTranslatedTerminology; $2)

//DB_GetLedgerisCashVAT
C_BOOLEAN:C305(DB_GetLedgerisCashVAT; $0)

//DB_GetLedgerCashvatACC
C_TEXT:C284(DB_GetLedgerCashvatACC; $0)

//DB_GetLedgerECcreditor
C_TEXT:C284(DB_GetLedgerECcreditor; $0)

//DB_GetLedgerTransDepositRec
C_TEXT:C284(DB_GetLedgerTransDepositRec; $0)

//DB_GetLedgerTRANSDeposit
C_TEXT:C284(DB_GetLedgerTRANSDeposit; $0)

//DB_GetLedgerTRANSINVpost
C_TEXT:C284(DB_GetLedgerTRANSINVpost; $0)

//DB_GetLedgerTRANSRECpost
C_TEXT:C284(DB_GetLedgerTRANSRECpost; $0)

//DB_GetLedgerTRANSPREpost
C_TEXT:C284(DB_GetLedgerTRANSPREpost; $0)

//DB_GetLedgerTRANSPURPrePay
C_TEXT:C284(DB_GetLedgerTRANSPURPrePay; $0)

//DB_GetLedgerTRANSPURpost
C_TEXT:C284(DB_GetLedgerTRANSPURpost; $0)

//DB_GetLedgerTRANSPurINVPay
C_TEXT:C284(DB_GetLedgerTRANSPurINVPay; $0)

//DB_LedgerAllowZeroInvoices
C_BOOLEAN:C305(DB_LedgerAllowZeroInvoices; $0)

//DB_GetLedgerViaBatch
C_BOOLEAN:C305(DB_GetLedgerViaBatch; $0)

//DB_GetLedgerCheckJournals
C_BOOLEAN:C305(DB_GetLedgerCheckJournals; $0)

//DB_GetLedgerAllowUnproc
C_BOOLEAN:C305(DB_GetLedgerAllowUnproc; $0)

//DB_GetLedgerPostBatch
C_BOOLEAN:C305(DB_GetLedgerPostBatch; $0)

//DB_GetLedgerByCompany
C_BOOLEAN:C305(DB_GetLedgerByCompany; $0)

//DB_GetLedgerRequireAnalysis
C_BOOLEAN:C305(DB_GetLedgerRequireAnalysis; $0)

//DB_GetLedgerRecalcSingleSide
C_BOOLEAN:C305(DB_GetLedgerRecalcSingleSide; $0)

//DB_GetLedgerAllowZeroPinvoices
C_BOOLEAN:C305(DB_GetLedgerAllowZeroPinvoices; $0)

//DB_GetLedgerINVAllowCancel
C_BOOLEAN:C305(DB_GetLedgerINVAllowCancel; $0)

//DB_GetLedgerINVAllownoPrint
C_BOOLEAN:C305(DB_GetLedgerINVAllownoPrint; $0)

//DB_GetLedgerINVAllowUnproc
C_BOOLEAN:C305(DB_GetLedgerINVAllowUnproc; $0)

//DB_GetLedgerShowReceipt
C_BOOLEAN:C305(DB_GetLedgerShowReceipt; $0)

//AA_ListCreateIteminProcess
C_LONGINT:C283(AA_ListCreateIteminProcess; $1)
C_TEXT:C284(AA_ListCreateIteminProcess; $2)

//AA_ListAddOWNEDitembyID
C_LONGINT:C283(AA_ListAddOWNEDitembyID; $0)
C_LONGINT:C283(AA_ListAddOWNEDitembyID; $1)
C_LONGINT:C283(AA_ListAddOWNEDitembyID; $2)
C_TEXT:C284(AA_ListAddOWNEDitembyID; $3)

//DB_GetOrganisationScreenName
C_TEXT:C284(DB_GetOrganisationScreenName; $0)

//DB_GetOrganisationCountry
C_TEXT:C284(DB_GetOrganisationCountry; $0)

//DB_LicenceNUMfromCode
C_TEXT:C284(DB_LicenceNUMfromCode; $0)
C_TEXT:C284(DB_LicenceNUMfromCode; $1)

//DB_LicenceOrgFromcode
C_TEXT:C284(DB_LicenceOrgFromcode; $0)
C_TEXT:C284(DB_LicenceOrgFromcode; $1)

//DB_LicenceWPusersfromCode
C_LONGINT:C283(DB_LicenceWPusersfromCode; $0)
C_TEXT:C284(DB_LicenceWPusersfromCode; $1)

//DB_LicenceIMusersfromCode
C_LONGINT:C283(DB_LicenceIMusersfromCode; $0)
C_TEXT:C284(DB_LicenceIMusersfromCode; $1)

//DB_LicenceUsersFromCode
C_LONGINT:C283(DB_LicenceUsersFromCode; $0)
C_TEXT:C284(DB_LicenceUsersFromCode; $1)

//DB_LicenceModulesFromCode
C_TEXT:C284(DB_LicenceModulesFromCode; $1)
C_POINTER:C301(DB_LicenceModulesFromCode; $2)
C_LONGINT:C283(DB_LicenceModulesFromCode; $3)

//DB_GetNewLicence
C_LONGINT:C283(DB_GetNewLicence; $0)
C_REAL:C285(DB_GetNewLicence; $1)
C_REAL:C285(DB_GetNewLicence; $2)
C_TEXT:C284(DB_GetNewLicence; $3)

//DB_GetLicenceMaxUsers
C_LONGINT:C283(DB_GetLicenceMaxUsers; $0)
C_TEXT:C284(DB_GetLicenceMaxUsers; $1)

//DB_GetLicencedModuleSettings
C_POINTER:C301(DB_GetLicencedModuleSettings; $1)

//DB_GetOrganisationAdministrator
C_TEXT:C284(DB_GetOrganisationAdministrator; $0)

//DB_GetLicenceString
C_TEXT:C284(DB_GetLicenceString; $0)

//DB_GetLicenceExpiryDate
C_DATE:C307(DB_GetLicenceExpiryDate; $0)

//DB_LICENCECODETEST
C_TEXT:C284(DB_LICENCECODETEST; $0)
C_TEXT:C284(DB_LICENCECODETEST; $1)

//DB_ValidateDateCode
C_TEXT:C284(DB_ValidateDateCode; $1)
C_TEXT:C284(DB_ValidateDateCode; $2)

//DB_LoadLicenceOverridesPrefs
C_BOOLEAN:C305(DB_LoadLicenceOverridesPrefs; $1)
C_BOOLEAN:C305(DB_LoadLicenceOverridesPrefs; $2)
C_LONGINT:C283(DB_LoadLicenceOverridesPrefs; $3)

//DB_LoadUserTableNames
C_BOOLEAN:C305(DB_LoadUserTableNames; $1)
C_BOOLEAN:C305(DB_LoadUserTableNames; $2)
C_LONGINT:C283(DB_LoadUserTableNames; $3)

//DB_EditTableSetup
C_LONGINT:C283(DB_EditTableSetup; $1)

//QR_GetStringData
C_TEXT:C284(QR_GetStringData; $0)
C_TEXT:C284(QR_GetStringData; $1)
C_LONGINT:C283(QR_GetStringData; $2)

//QR_GetRealData
C_REAL:C285(QR_GetRealData; $0)
C_TEXT:C284(QR_GetRealData; $1)
C_LONGINT:C283(QR_GetRealData; $2)

//QR_GetLongData
C_LONGINT:C283(QR_GetLongData; $0)
C_TEXT:C284(QR_GetLongData; $1)
C_LONGINT:C283(QR_GetLongData; $2)

//QR_GetBooleanData
C_BOOLEAN:C305(QR_GetBooleanData; $0)
C_TEXT:C284(QR_GetBooleanData; $1)
C_LONGINT:C283(QR_GetBooleanData; $2)

//QR_GetDateData
C_DATE:C307(QR_GetDateData; $0)
C_TEXT:C284(QR_GetDateData; $1)
C_LONGINT:C283(QR_GetDateData; $2)

//QR_AdvanceArray
C_TEXT:C284(QR_AdvanceArray; $1)
C_LONGINT:C283(QR_AdvanceArray; $2)

//LB_ImportDefault
C_BOOLEAN:C305(LB_ImportDefault; $0)
C_TEXT:C284(LB_ImportDefault; $1)

//LBI_saveLayoutName
C_TEXT:C284(LBI_saveLayoutName; $1)
C_TEXT:C284(LBI_saveLayoutName; $2)

//LBI_GetLayoutName
C_TEXT:C284(LBI_GetLayoutName; $0)
C_TEXT:C284(LBI_GetLayoutName; $1)

//LBI_initLayoutNames
C_POINTER:C301(LBI_initLayoutNames; $1)

//DB_GetDiaryDocumentType
C_TEXT:C284(DB_GetDiaryDocumentType; $0)

//PI_undoPayment
C_BOOLEAN:C305(PI_undoPayment; $1)
C_REAL:C285(PI_undoPayment; $2)

//AA_ValidatePropertySublist
C_REAL:C285(AA_ValidatePropertySublist; $1)
C_TEXT:C284(AA_ValidatePropertySublist; $2)
C_POINTER:C301(AA_ValidatePropertySublist; $3)
C_POINTER:C301(AA_ValidatePropertySublist; $4)

//XML_ExtractSubEntities
C_TEXT:C284(XML_ExtractSubEntities; $1)
C_TEXT:C284(XML_ExtractSubEntities; $2)
C_POINTER:C301(XML_ExtractSubEntities; $3)

//DB_ShowFloatingRecord
C_LONGINT:C283(DB_ShowFloatingRecord; $1)
C_REAL:C285(DB_ShowFloatingRecord; $2)
C_REAL:C285(DB_ShowFloatingRecord; $3)
C_REAL:C285(DB_ShowFloatingRecord; $4)
C_LONGINT:C283(DB_ShowFloatingRecord; $5)
C_LONGINT:C283(DB_ShowFloatingRecord; $6)
C_LONGINT:C283(DB_ShowFloatingRecord; $7)
C_LONGINT:C283(DB_ShowFloatingRecord; $8)

//LR_CreatePublicKey
C_BOOLEAN:C305(LR_CreatePublicKey; $1)

//LR_GetLicencePublicKey
C_BOOLEAN:C305(LR_GetLicencePublicKey; $1)

//proxy_LC_CreateUser
C_LONGINT:C283(proxy_LC_CreateUser; $0)
C_TEXT:C284(proxy_LC_CreateUser; $1)
C_TEXT:C284(proxy_LC_CreateUser; $2)

//LC_GetLicenceViaSoap
C_LONGINT:C283(LC_GetLicenceViaSoap; $0)
C_LONGINT:C283(LC_GetLicenceViaSoap; $1)
C_TEXT:C284(LC_GetLicenceViaSoap; $2)
C_BOOLEAN:C305(LC_GetLicenceViaSoap; $3)

//EW_ManageProjects
C_LONGINT:C283(EW_ManageProjects; $1)

//DBWS_GetCurrentUserProcess
C_LONGINT:C283(DBWS_GetCurrentUserProcess; $0)
C_LONGINT:C283(DBWS_GetCurrentUserProcess; $1)
C_TEXT:C284(DBWS_GetCurrentUserProcess; $2)

//DBWS_AlterUserPreference
C_TEXT:C284(DBWS_AlterUserPreference; $1)

//DBWS_GetDataGrid
C_TEXT:C284(DBWS_GetDataGrid; $1)

//DBWS_FormNametoIdentity
C_TEXT:C284(DBWS_FormNametoIdentity; $0)
C_TEXT:C284(DBWS_FormNametoIdentity; $1)
C_TEXT:C284(DBWS_FormNametoIdentity; $2)
C_TEXT:C284(DBWS_FormNametoIdentity; $3)

//LB_LayoutstoJson
C_TEXT:C284(LB_LayoutstoJson; $0)
C_TEXT:C284(LB_LayoutstoJson; $1)
C_TEXT:C284(LB_LayoutstoJson; $2)
C_POINTER:C301(LB_LayoutstoJson; $3)
C_POINTER:C301(LB_LayoutstoJson; $4)
C_POINTER:C301(LB_LayoutstoJson; $5)

//COM_CommentstoDiary
C_POINTER:C301(COM_CommentstoDiary; $1)

//SD2_GETDIARYCOMPANY
C_TEXT:C284(SD2_GETDIARYCOMPANY; $0)
C_LONGINT:C283(SD2_GETDIARYCOMPANY; $1)
C_TEXT:C284(SD2_GETDIARYCOMPANY; $2)

//COM_GETLASTCOMMENT
C_TEXT:C284(COM_GETLASTCOMMENT; $0)

//ORD_CommentstoDiary
C_POINTER:C301(ORD_CommentstoDiary; $1)

//DBWS_GetDataGridLabels
C_TEXT:C284(DBWS_GetDataGridLabels; $1)

//DBWS_GetCachedData
C_TEXT:C284(DBWS_GetCachedData; $1)

//DB_CurrentSelectiontoXML
C_TEXT:C284(DB_CurrentSelectiontoXML; $0)
C_LONGINT:C283(DB_CurrentSelectiontoXML; $1)
C_LONGINT:C283(DB_CurrentSelectiontoXML; $2)
C_LONGINT:C283(DB_CurrentSelectiontoXML; $3)
C_POINTER:C301(DB_CurrentSelectiontoXML; $4)
C_POINTER:C301(DB_CurrentSelectiontoXML; $5)

//DBWS__GetQuerySetup
C_TEXT:C284(DBWS__GetQuerySetup; $1)

//DBWS_GetTableWebCall
C_LONGINT:C283(DBWS_GetTableWebCall; $0)
C_TEXT:C284(DBWS_GetTableWebCall; $1)

//DBWS_GetQuerySetup
C_TEXT:C284(DBWS_GetQuerySetup; $1)

//DBWS_TableNametoNumber
C_LONGINT:C283(DBWS_TableNametoNumber; $0)
C_TEXT:C284(DBWS_TableNametoNumber; $1)

//PREF_LoadPreference
C_LONGINT:C283(PREF_LoadPreference; $1)
C_TEXT:C284(PREF_LoadPreference; $2)
C_LONGINT:C283(PREF_LoadPreference; $3)

//PREF_GetPreferenceBLOB
C_BLOB:C604(PREF_GetPreferenceBLOB; $0)
C_LONGINT:C283(PREF_GetPreferenceBLOB; $1)
C_TEXT:C284(PREF_GetPreferenceBLOB; $2)
C_LONGINT:C283(PREF_GetPreferenceBLOB; $3)

//PREF_GetPrefVariables
C_TEXT:C284(PREF_GetPrefVariables; $1)
C_POINTER:C301(PREF_GetPrefVariables; $2)
C_POINTER:C301(PREF_GetPrefVariables; $3)

//DIA_GetContactname
C_TEXT:C284(DIA_GetContactname; $0)
C_LONGINT:C283(DIA_GetContactname; $1)
C_TEXT:C284(DIA_GetContactname; $2)

//ValidateMovement
C_TEXT:C284(ValidateMovement; $1)
C_LONGINT:C283(ValidateMovement; $2)
C_BOOLEAN:C305(ValidateMovement; $3)

//DB_WaitForBooleanVar
C_LONGINT:C283(DB_WaitForBooleanVar; $1)
C_TEXT:C284(DB_WaitForBooleanVar; $2)
C_LONGINT:C283(DB_WaitForBooleanVar; $3)
C_TEXT:C284(DB_WaitForBooleanVar; $4)

//DB_WaitforProcessToEnd
C_LONGINT:C283(DB_WaitforProcessToEnd; $1)
C_TEXT:C284(DB_WaitforProcessToEnd; $2)
C_LONGINT:C283(DB_WaitforProcessToEnd; $3)
C_TEXT:C284(DB_WaitforProcessToEnd; $4)

//DB_WaitForSemaphore
C_TEXT:C284(DB_WaitForSemaphore; $1)
C_LONGINT:C283(DB_WaitForSemaphore; $2)
C_LONGINT:C283(DB_WaitForSemaphore; $3)
C_LONGINT:C283(DB_WaitForSemaphore; $4)

//PurchaseOrderItemsSel2
C_TEXT:C284(PurchaseOrderItemsSel2; $1)

//STK_ChangeStockItem
C_LONGINT:C283(STK_ChangeStockItem; $1)
C_LONGINT:C283(STK_ChangeStockItem; $2)
C_LONGINT:C283(STK_ChangeStockItem; $3)

//STK_ItemsResetCalledFrom
C_REAL:C285(STK_ItemsResetCalledFrom; $1)
C_LONGINT:C283(STK_ItemsResetCalledFrom; $2)
C_LONGINT:C283(STK_ItemsResetCalledFrom; $3)

//DB_MenuTest
C_TEXT:C284(DB_MenuTest; $1)

//DB_FIltersAvailable
C_BOOLEAN:C305(DB_FIltersAvailable; $0)
C_LONGINT:C283(DB_FIltersAvailable; $1)
C_TEXT:C284(DB_FIltersAvailable; $2)

//DB_SetOutPutFilters
C_BOOLEAN:C305(DB_SetOutPutFilters; $1)
C_LONGINT:C283(DB_SetOutPutFilters; $2)
C_LONGINT:C283(DB_SetOutPutFilters; $3)
C_LONGINT:C283(DB_SetOutPutFilters; $4)
C_LONGINT:C283(DB_SetOutPutFilters; $5)
C_LONGINT:C283(DB_SetOutPutFilters; $6)
C_LONGINT:C283(DB_SetOutPutFilters; $7)
C_LONGINT:C283(DB_SetOutPutFilters; $8)

//DB_DropTabs
C_LONGINT:C283(DB_DropTabs; $1)

//DB_SetFilterObject
C_LONGINT:C283(DB_SetFilterObject; $0)
C_LONGINT:C283(DB_SetFilterObject; $1)
C_LONGINT:C283(DB_SetFilterObject; $2)
C_TEXT:C284(DB_SetFilterObject; $3)
C_LONGINT:C283(DB_SetFilterObject; $4)
C_POINTER:C301(DB_SetFilterObject; $5)
C_POINTER:C301(DB_SetFilterObject; $6)

//LBI_HandleRollover
C_BOOLEAN:C305(LBI_HandleRollover; $1)
C_TEXT:C284(LBI_HandleRollover; $2)
C_POINTER:C301(LBI_HandleRollover; $3)
C_LONGINT:C283(LBI_HandleRollover; $4)
C_POINTER:C301(LBI_HandleRollover; $5)

//CD_Setup
C_TEXT:C284(CD_Setup; $1)

//DB_ControlDataFilePath
C_BOOLEAN:C305(DB_ControlDataFilePath; $0)
C_BOOLEAN:C305(DB_ControlDataFilePath; $1)

//DB_GetUserWidthPreference
C_LONGINT:C283(DB_GetUserWidthPreference; $0)
C_BOOLEAN:C305(DB_GetUserWidthPreference; $1)
C_TEXT:C284(DB_GetUserWidthPreference; $2)
C_LONGINT:C283(DB_GetUserWidthPreference; $3)

//START_SetTablesAndFields
C_BOOLEAN:C305(START_SetTablesAndFields; $1)

//DB_GetNormalisedTableName
C_TEXT:C284(DB_GetNormalisedTableName; $0)
C_POINTER:C301(DB_GetNormalisedTableName; $1)

//DB_DataisSetup
C_BOOLEAN:C305(DB_DataisSetup; $0)
C_LONGINT:C283(DB_DataisSetup; $1)

//STK_Outputhistory
C_TEXT:C284(STK_Outputhistory; $1)
C_TIME:C306(STK_Outputhistory; $2)

//INV_PPaymentUNDO
C_TEXT:C284(INV_PPaymentUNDO; $1)
C_REAL:C285(INV_PPaymentUNDO; $2)

//LBI_UpdateFooters
C_POINTER:C301(LBI_UpdateFooters; $1)
C_LONGINT:C283(LBI_UpdateFooters; $2)
C_LONGINT:C283(LBI_UpdateFooters; $3)

//DB_GetTableNumFromNameString
C_LONGINT:C283(DB_GetTableNumFromNameString; $0)
C_TEXT:C284(DB_GetTableNumFromNameString; $1)

//DB_SetOutFIlterSalesPersons
C_LONGINT:C283(DB_SetOutFIlterSalesPersons; $0)
C_POINTER:C301(DB_SetOutFIlterSalesPersons; $1)
C_POINTER:C301(DB_SetOutFIlterSalesPersons; $2)
C_POINTER:C301(DB_SetOutFIlterSalesPersons; $3)
C_POINTER:C301(DB_SetOutFIlterSalesPersons; $4)
C_POINTER:C301(DB_SetOutFIlterSalesPersons; $5)
C_POINTER:C301(DB_SetOutFIlterSalesPersons; $6)
C_POINTER:C301(DB_SetOutFIlterSalesPersons; $7)
C_POINTER:C301(DB_SetOutFIlterSalesPersons; $8)
C_POINTER:C301(DB_SetOutFIlterSalesPersons; $9)
C_POINTER:C301(DB_SetOutFIlterSalesPersons; $10)
C_POINTER:C301(DB_SetOutFIlterSalesPersons; $11)

//DB_SetOutFIlterCountries
C_LONGINT:C283(DB_SetOutFIlterCountries; $0)
C_POINTER:C301(DB_SetOutFIlterCountries; $1)
C_POINTER:C301(DB_SetOutFIlterCountries; $2)
C_POINTER:C301(DB_SetOutFIlterCountries; $3)
C_POINTER:C301(DB_SetOutFIlterCountries; $4)
C_POINTER:C301(DB_SetOutFIlterCountries; $5)
C_POINTER:C301(DB_SetOutFIlterCountries; $6)
C_POINTER:C301(DB_SetOutFIlterCountries; $7)
C_POINTER:C301(DB_SetOutFIlterCountries; $8)
C_POINTER:C301(DB_SetOutFIlterCountries; $9)
C_POINTER:C301(DB_SetOutFIlterCountries; $10)
C_POINTER:C301(DB_SetOutFIlterCountries; $11)

//DB_SetOutFIlterCounties
C_LONGINT:C283(DB_SetOutFIlterCounties; $0)
C_POINTER:C301(DB_SetOutFIlterCounties; $1)
C_POINTER:C301(DB_SetOutFIlterCounties; $2)
C_POINTER:C301(DB_SetOutFIlterCounties; $3)
C_POINTER:C301(DB_SetOutFIlterCounties; $4)
C_POINTER:C301(DB_SetOutFIlterCounties; $5)
C_POINTER:C301(DB_SetOutFIlterCounties; $6)
C_POINTER:C301(DB_SetOutFIlterCounties; $7)
C_POINTER:C301(DB_SetOutFIlterCounties; $8)
C_POINTER:C301(DB_SetOutFIlterCounties; $9)
C_POINTER:C301(DB_SetOutFIlterCounties; $10)
C_POINTER:C301(DB_SetOutFIlterCounties; $11)

//DB_SetoutFilterAreas
C_LONGINT:C283(DB_SetoutFilterAreas; $0)
C_POINTER:C301(DB_SetoutFilterAreas; $1)
C_POINTER:C301(DB_SetoutFilterAreas; $2)
C_POINTER:C301(DB_SetoutFilterAreas; $3)
C_POINTER:C301(DB_SetoutFilterAreas; $4)
C_POINTER:C301(DB_SetoutFilterAreas; $5)
C_POINTER:C301(DB_SetoutFilterAreas; $6)
C_POINTER:C301(DB_SetoutFilterAreas; $7)
C_POINTER:C301(DB_SetoutFilterAreas; $8)
C_POINTER:C301(DB_SetoutFilterAreas; $9)
C_POINTER:C301(DB_SetoutFilterAreas; $10)
C_POINTER:C301(DB_SetoutFilterAreas; $11)

//DB_SetoutFilterCoType
C_LONGINT:C283(DB_SetoutFilterCoType; $0)
C_POINTER:C301(DB_SetoutFilterCoType; $1)
C_POINTER:C301(DB_SetoutFilterCoType; $2)
C_POINTER:C301(DB_SetoutFilterCoType; $3)
C_POINTER:C301(DB_SetoutFilterCoType; $4)
C_POINTER:C301(DB_SetoutFilterCoType; $5)
C_POINTER:C301(DB_SetoutFilterCoType; $6)
C_POINTER:C301(DB_SetoutFilterCoType; $7)
C_POINTER:C301(DB_SetoutFilterCoType; $8)
C_POINTER:C301(DB_SetoutFilterCoType; $9)
C_POINTER:C301(DB_SetoutFilterCoType; $10)
C_POINTER:C301(DB_SetoutFilterCoType; $11)

//DB_SetoutFilterCoStatus
C_LONGINT:C283(DB_SetoutFilterCoStatus; $0)
C_POINTER:C301(DB_SetoutFilterCoStatus; $1)
C_POINTER:C301(DB_SetoutFilterCoStatus; $2)
C_POINTER:C301(DB_SetoutFilterCoStatus; $3)
C_POINTER:C301(DB_SetoutFilterCoStatus; $4)
C_POINTER:C301(DB_SetoutFilterCoStatus; $5)
C_POINTER:C301(DB_SetoutFilterCoStatus; $6)
C_POINTER:C301(DB_SetoutFilterCoStatus; $7)
C_POINTER:C301(DB_SetoutFilterCoStatus; $8)
C_POINTER:C301(DB_SetoutFilterCoStatus; $9)
C_POINTER:C301(DB_SetoutFilterCoStatus; $10)
C_POINTER:C301(DB_SetoutFilterCoStatus; $11)

//DB_SetOutputFiltersSources
C_LONGINT:C283(DB_SetOutputFiltersSources; $0)
C_POINTER:C301(DB_SetOutputFiltersSources; $1)
C_POINTER:C301(DB_SetOutputFiltersSources; $2)
C_POINTER:C301(DB_SetOutputFiltersSources; $3)
C_POINTER:C301(DB_SetOutputFiltersSources; $4)
C_POINTER:C301(DB_SetOutputFiltersSources; $5)
C_POINTER:C301(DB_SetOutputFiltersSources; $6)
C_POINTER:C301(DB_SetOutputFiltersSources; $7)
C_POINTER:C301(DB_SetOutputFiltersSources; $8)
C_POINTER:C301(DB_SetOutputFiltersSources; $9)
C_POINTER:C301(DB_SetOutputFiltersSources; $10)
C_POINTER:C301(DB_SetOutputFiltersSources; $11)

//DB_SetOutFilterPeriods
C_POINTER:C301(DB_SetOutFilterPeriods; $1)
C_POINTER:C301(DB_SetOutFilterPeriods; $2)
C_POINTER:C301(DB_SetOutFilterPeriods; $3)
C_POINTER:C301(DB_SetOutFilterPeriods; $4)
C_POINTER:C301(DB_SetOutFilterPeriods; $5)
C_POINTER:C301(DB_SetOutFilterPeriods; $6)
C_POINTER:C301(DB_SetOutFilterPeriods; $7)
C_POINTER:C301(DB_SetOutFilterPeriods; $8)
C_POINTER:C301(DB_SetOutFilterPeriods; $9)
C_POINTER:C301(DB_SetOutFilterPeriods; $10)

//DB_SetOutFiltersAnalysis
C_LONGINT:C283(DB_SetOutFiltersAnalysis; $0)
C_POINTER:C301(DB_SetOutFiltersAnalysis; $1)
C_POINTER:C301(DB_SetOutFiltersAnalysis; $2)
C_POINTER:C301(DB_SetOutFiltersAnalysis; $3)
C_POINTER:C301(DB_SetOutFiltersAnalysis; $4)
C_POINTER:C301(DB_SetOutFiltersAnalysis; $5)
C_POINTER:C301(DB_SetOutFiltersAnalysis; $6)
C_POINTER:C301(DB_SetOutFiltersAnalysis; $7)
C_POINTER:C301(DB_SetOutFiltersAnalysis; $8)
C_POINTER:C301(DB_SetOutFiltersAnalysis; $9)
C_POINTER:C301(DB_SetOutFiltersAnalysis; $10)
C_POINTER:C301(DB_SetOutFiltersAnalysis; $11)

//DB_SetoutFilterLayers
C_LONGINT:C283(DB_SetoutFilterLayers; $0)
C_POINTER:C301(DB_SetoutFilterLayers; $1)
C_POINTER:C301(DB_SetoutFilterLayers; $2)
C_POINTER:C301(DB_SetoutFilterLayers; $3)
C_POINTER:C301(DB_SetoutFilterLayers; $4)
C_POINTER:C301(DB_SetoutFilterLayers; $5)
C_POINTER:C301(DB_SetoutFilterLayers; $6)
C_POINTER:C301(DB_SetoutFilterLayers; $7)
C_POINTER:C301(DB_SetoutFilterLayers; $8)
C_POINTER:C301(DB_SetoutFilterLayers; $9)
C_POINTER:C301(DB_SetoutFilterLayers; $10)
C_POINTER:C301(DB_SetoutFilterLayers; $11)

//DB_SetoutFilterCurrencies
C_LONGINT:C283(DB_SetoutFilterCurrencies; $0)
C_POINTER:C301(DB_SetoutFilterCurrencies; $1)
C_POINTER:C301(DB_SetoutFilterCurrencies; $2)
C_POINTER:C301(DB_SetoutFilterCurrencies; $3)
C_POINTER:C301(DB_SetoutFilterCurrencies; $4)
C_POINTER:C301(DB_SetoutFilterCurrencies; $5)
C_POINTER:C301(DB_SetoutFilterCurrencies; $6)
C_POINTER:C301(DB_SetoutFilterCurrencies; $7)
C_POINTER:C301(DB_SetoutFilterCurrencies; $8)
C_POINTER:C301(DB_SetoutFilterCurrencies; $9)
C_POINTER:C301(DB_SetoutFilterCurrencies; $10)
C_POINTER:C301(DB_SetoutFilterCurrencies; $11)

//DB_SetOutFIlterRoles
C_LONGINT:C283(DB_SetOutFIlterRoles; $0)
C_POINTER:C301(DB_SetOutFIlterRoles; $1)
C_POINTER:C301(DB_SetOutFIlterRoles; $2)
C_POINTER:C301(DB_SetOutFIlterRoles; $3)
C_POINTER:C301(DB_SetOutFIlterRoles; $4)
C_POINTER:C301(DB_SetOutFIlterRoles; $5)
C_POINTER:C301(DB_SetOutFIlterRoles; $6)
C_POINTER:C301(DB_SetOutFIlterRoles; $7)
C_POINTER:C301(DB_SetOutFIlterRoles; $8)
C_POINTER:C301(DB_SetOutFIlterRoles; $9)
C_POINTER:C301(DB_SetOutFIlterRoles; $10)
C_POINTER:C301(DB_SetOutFIlterRoles; $11)

//DB_SetOutputFilterHeadings
C_LONGINT:C283(DB_SetOutputFilterHeadings; $0)
C_POINTER:C301(DB_SetOutputFilterHeadings; $1)
C_POINTER:C301(DB_SetOutputFilterHeadings; $2)
C_POINTER:C301(DB_SetOutputFilterHeadings; $3)
C_POINTER:C301(DB_SetOutputFilterHeadings; $4)
C_POINTER:C301(DB_SetOutputFilterHeadings; $5)
C_POINTER:C301(DB_SetOutputFilterHeadings; $6)
C_POINTER:C301(DB_SetOutputFilterHeadings; $7)
C_POINTER:C301(DB_SetOutputFilterHeadings; $8)
C_POINTER:C301(DB_SetOutputFilterHeadings; $9)
C_POINTER:C301(DB_SetOutputFilterHeadings; $10)
C_POINTER:C301(DB_SetOutputFilterHeadings; $11)

//DB_SetOutFilterGroups
C_LONGINT:C283(DB_SetOutFilterGroups; $0)
C_POINTER:C301(DB_SetOutFilterGroups; $1)
C_POINTER:C301(DB_SetOutFilterGroups; $2)
C_POINTER:C301(DB_SetOutFilterGroups; $3)
C_POINTER:C301(DB_SetOutFilterGroups; $4)
C_POINTER:C301(DB_SetOutFilterGroups; $5)
C_POINTER:C301(DB_SetOutFilterGroups; $6)
C_POINTER:C301(DB_SetOutFilterGroups; $7)
C_POINTER:C301(DB_SetOutFilterGroups; $8)
C_POINTER:C301(DB_SetOutFilterGroups; $9)
C_POINTER:C301(DB_SetOutFilterGroups; $10)

//DB_SetOutFIlterBrands
C_LONGINT:C283(DB_SetOutFIlterBrands; $0)
C_POINTER:C301(DB_SetOutFIlterBrands; $1)
C_POINTER:C301(DB_SetOutFIlterBrands; $2)
C_POINTER:C301(DB_SetOutFIlterBrands; $3)
C_POINTER:C301(DB_SetOutFIlterBrands; $4)
C_POINTER:C301(DB_SetOutFIlterBrands; $5)
C_POINTER:C301(DB_SetOutFIlterBrands; $6)
C_POINTER:C301(DB_SetOutFIlterBrands; $7)
C_POINTER:C301(DB_SetOutFIlterBrands; $8)
C_POINTER:C301(DB_SetOutFIlterBrands; $9)
C_POINTER:C301(DB_SetOutFIlterBrands; $10)

//DB_setOutFilterCollections
C_LONGINT:C283(DB_setOutFilterCollections; $0)
C_POINTER:C301(DB_setOutFilterCollections; $1)
C_POINTER:C301(DB_setOutFilterCollections; $2)
C_POINTER:C301(DB_setOutFilterCollections; $3)
C_POINTER:C301(DB_setOutFilterCollections; $4)
C_POINTER:C301(DB_setOutFilterCollections; $5)
C_POINTER:C301(DB_setOutFilterCollections; $6)
C_POINTER:C301(DB_setOutFilterCollections; $7)
C_POINTER:C301(DB_setOutFilterCollections; $8)
C_POINTER:C301(DB_setOutFilterCollections; $9)
C_POINTER:C301(DB_setOutFilterCollections; $10)

//DB_SetOutFilterMoveTypes
C_LONGINT:C283(DB_SetOutFilterMoveTypes; $0)
C_POINTER:C301(DB_SetOutFilterMoveTypes; $1)
C_POINTER:C301(DB_SetOutFilterMoveTypes; $2)
C_POINTER:C301(DB_SetOutFilterMoveTypes; $3)
C_POINTER:C301(DB_SetOutFilterMoveTypes; $4)
C_POINTER:C301(DB_SetOutFilterMoveTypes; $5)
C_POINTER:C301(DB_SetOutFilterMoveTypes; $6)
C_POINTER:C301(DB_SetOutFilterMoveTypes; $7)
C_POINTER:C301(DB_SetOutFilterMoveTypes; $8)
C_POINTER:C301(DB_SetOutFilterMoveTypes; $9)
C_POINTER:C301(DB_SetOutFilterMoveTypes; $10)
C_POINTER:C301(DB_SetOutFilterMoveTypes; $11)

//DB_SetOutFilterStockTypes
C_LONGINT:C283(DB_SetOutFilterStockTypes; $0)
C_POINTER:C301(DB_SetOutFilterStockTypes; $1)
C_POINTER:C301(DB_SetOutFilterStockTypes; $2)
C_POINTER:C301(DB_SetOutFilterStockTypes; $3)
C_POINTER:C301(DB_SetOutFilterStockTypes; $4)
C_POINTER:C301(DB_SetOutFilterStockTypes; $5)
C_POINTER:C301(DB_SetOutFilterStockTypes; $6)
C_POINTER:C301(DB_SetOutFilterStockTypes; $7)
C_POINTER:C301(DB_SetOutFilterStockTypes; $8)
C_POINTER:C301(DB_SetOutFilterStockTypes; $9)
C_POINTER:C301(DB_SetOutFilterStockTypes; $10)
C_POINTER:C301(DB_SetOutFilterStockTypes; $11)

//DB_SetOutFilterRecordStates
C_LONGINT:C283(DB_SetOutFilterRecordStates; $0)
C_POINTER:C301(DB_SetOutFilterRecordStates; $1)
C_POINTER:C301(DB_SetOutFilterRecordStates; $2)
C_POINTER:C301(DB_SetOutFilterRecordStates; $3)
C_POINTER:C301(DB_SetOutFilterRecordStates; $4)
C_POINTER:C301(DB_SetOutFilterRecordStates; $5)
C_POINTER:C301(DB_SetOutFilterRecordStates; $6)
C_POINTER:C301(DB_SetOutFilterRecordStates; $7)
C_POINTER:C301(DB_SetOutFilterRecordStates; $8)
C_POINTER:C301(DB_SetOutFilterRecordStates; $9)
C_POINTER:C301(DB_SetOutFilterRecordStates; $10)
C_POINTER:C301(DB_SetOutFilterRecordStates; $11)

//DB_SetoutfilterCreditStages
C_LONGINT:C283(DB_SetoutfilterCreditStages; $0)
C_POINTER:C301(DB_SetoutfilterCreditStages; $1)
C_POINTER:C301(DB_SetoutfilterCreditStages; $2)
C_POINTER:C301(DB_SetoutfilterCreditStages; $3)
C_POINTER:C301(DB_SetoutfilterCreditStages; $4)
C_POINTER:C301(DB_SetoutfilterCreditStages; $5)
C_POINTER:C301(DB_SetoutfilterCreditStages; $6)
C_POINTER:C301(DB_SetoutfilterCreditStages; $7)
C_POINTER:C301(DB_SetoutfilterCreditStages; $8)
C_POINTER:C301(DB_SetoutfilterCreditStages; $9)
C_POINTER:C301(DB_SetoutfilterCreditStages; $10)

//DB_SetoutfilterLocations
C_LONGINT:C283(DB_SetoutfilterLocations; $0)
C_POINTER:C301(DB_SetoutfilterLocations; $1)
C_POINTER:C301(DB_SetoutfilterLocations; $2)
C_POINTER:C301(DB_SetoutfilterLocations; $3)
C_POINTER:C301(DB_SetoutfilterLocations; $4)
C_POINTER:C301(DB_SetoutfilterLocations; $5)
C_POINTER:C301(DB_SetoutfilterLocations; $6)
C_POINTER:C301(DB_SetoutfilterLocations; $7)
C_POINTER:C301(DB_SetoutfilterLocations; $8)
C_POINTER:C301(DB_SetoutfilterLocations; $9)
C_POINTER:C301(DB_SetoutfilterLocations; $10)

//DB_SetOutFilterContractTypes
C_LONGINT:C283(DB_SetOutFilterContractTypes; $0)
C_POINTER:C301(DB_SetOutFilterContractTypes; $1)
C_POINTER:C301(DB_SetOutFilterContractTypes; $2)
C_POINTER:C301(DB_SetOutFilterContractTypes; $3)
C_POINTER:C301(DB_SetOutFilterContractTypes; $4)
C_POINTER:C301(DB_SetOutFilterContractTypes; $5)
C_POINTER:C301(DB_SetOutFilterContractTypes; $6)
C_POINTER:C301(DB_SetOutFilterContractTypes; $7)
C_POINTER:C301(DB_SetOutFilterContractTypes; $8)
C_POINTER:C301(DB_SetOutFilterContractTypes; $9)
C_POINTER:C301(DB_SetOutFilterContractTypes; $10)

//PUR_UndoOnePayment
C_TEXT:C284(PUR_UndoOnePayment; $1)
C_REAL:C285(PUR_UndoOnePayment; $2)

//SCPT_VBS
C_TEXT:C284(SCPT_VBS; $0)
C_TEXT:C284(SCPT_VBS; $1)
C_TEXT:C284(SCPT_VBS; $2)

//SCPT_OSA
C_TEXT:C284(SCPT_OSA; $0)
C_TEXT:C284(SCPT_OSA; $1)

//SCPT_XL
C_TEXT:C284(SCPT_XL; $0)
C_TEXT:C284(SCPT_XL; $1)

//SCPT_XL_WORKBOOK
C_TEXT:C284(SCPT_XL_WORKBOOK; $1)

//SCPT_XL_APPLICATION
C_TEXT:C284(SCPT_XL_APPLICATION; $0)
C_TEXT:C284(SCPT_XL_APPLICATION; $1)
C_LONGINT:C283(SCPT_XL_APPLICATION; $2)
C_REAL:C285(SCPT_XL_APPLICATION; $3)
C_REAL:C285(SCPT_XL_APPLICATION; $4)
C_REAL:C285(SCPT_XL_APPLICATION; $5)

//SCPT_XL_WINDOW
C_LONGINT:C283(SCPT_XL_WINDOW; $0)
C_TEXT:C284(SCPT_XL_WINDOW; $1)
C_LONGINT:C283(SCPT_XL_WINDOW; $2)

//SCPT_XL_SetParameter
C_TEXT:C284(SCPT_XL_SetParameter; $1)
C_TEXT:C284(SCPT_XL_SetParameter; $2)

//SCPT_XL_BORDER
C_LONGINT:C283(SCPT_XL_BORDER; $0)
C_TEXT:C284(SCPT_XL_BORDER; $1)
C_LONGINT:C283(SCPT_XL_BORDER; $2)

//SCPT_XL_BORDER_STYLE
C_LONGINT:C283(SCPT_XL_BORDER_STYLE; $0)
C_TEXT:C284(SCPT_XL_BORDER_STYLE; $1)
C_LONGINT:C283(SCPT_XL_BORDER_STYLE; $2)

//SCPT_XL_BORDER_WEIGHT
C_LONGINT:C283(SCPT_XL_BORDER_WEIGHT; $0)
C_TEXT:C284(SCPT_XL_BORDER_WEIGHT; $1)
C_LONGINT:C283(SCPT_XL_BORDER_WEIGHT; $2)

//SCPT_XL_PageOrientation
C_LONGINT:C283(SCPT_XL_PageOrientation; $0)
C_TEXT:C284(SCPT_XL_PageOrientation; $1)
C_LONGINT:C283(SCPT_XL_PageOrientation; $2)

//SCPT_XL_PageNumbering
C_LONGINT:C283(SCPT_XL_PageNumbering; $0)
C_TEXT:C284(SCPT_XL_PageNumbering; $1)
C_LONGINT:C283(SCPT_XL_PageNumbering; $2)

//SCPT_XL_PictureAppearance
C_LONGINT:C283(SCPT_XL_PictureAppearance; $0)
C_TEXT:C284(SCPT_XL_PictureAppearance; $1)
C_LONGINT:C283(SCPT_XL_PictureAppearance; $2)

//SCPT_XL_PictureFormat
C_LONGINT:C283(SCPT_XL_PictureFormat; $0)
C_TEXT:C284(SCPT_XL_PictureFormat; $1)
C_LONGINT:C283(SCPT_XL_PictureFormat; $2)

//SCPT_XL_Placement
C_LONGINT:C283(SCPT_XL_Placement; $0)
C_TEXT:C284(SCPT_XL_Placement; $1)
C_LONGINT:C283(SCPT_XL_Placement; $2)

//SCPT_XL_ReadingOrder
C_TEXT:C284(SCPT_XL_ReadingOrder; $1)
C_REAL:C285(SCPT_XL_ReadingOrder; $2)

//SCPT_XL_UNDERLINE
C_LONGINT:C283(SCPT_XL_UNDERLINE; $0)
C_TEXT:C284(SCPT_XL_UNDERLINE; $1)
C_LONGINT:C283(SCPT_XL_UNDERLINE; $2)

//SCPT_XL_View
C_LONGINT:C283(SCPT_XL_View; $0)
C_TEXT:C284(SCPT_XL_View; $1)
C_LONGINT:C283(SCPT_XL_View; $2)

//SCPT_XL_APPLICATION_GET
C_TEXT:C284(SCPT_XL_APPLICATION_GET; $0)
C_TEXT:C284(SCPT_XL_APPLICATION_GET; $1)
C_POINTER:C301(SCPT_XL_APPLICATION_GET; $2)
C_POINTER:C301(SCPT_XL_APPLICATION_GET; $3)
C_POINTER:C301(SCPT_XL_APPLICATION_GET; $4)
C_POINTER:C301(SCPT_XL_APPLICATION_GET; $5)

//SCPT_XL_PARAMETER_GET
C_POINTER:C301(SCPT_XL_PARAMETER_GET; $1)
C_POINTER:C301(SCPT_XL_PARAMETER_GET; $2)

//SCPT_XL_CHART
C_TEXT:C284(SCPT_XL_CHART; $0)
C_TEXT:C284(SCPT_XL_CHART; $1)
C_TEXT:C284(SCPT_XL_CHART; $2)
C_TEXT:C284(SCPT_XL_CHART; $3)
C_TEXT:C284(SCPT_XL_CHART; $4)
C_LONGINT:C283(SCPT_XL_CHART; $5)
C_LONGINT:C283(SCPT_XL_CHART; $6)
C_TEXT:C284(SCPT_XL_CHART; $7)
C_REAL:C285(SCPT_XL_CHART; $8)
C_REAL:C285(SCPT_XL_CHART; $9)
C_REAL:C285(SCPT_XL_CHART; $10)
C_REAL:C285(SCPT_XL_CHART; $11)

//SCPT_XL_PictureCreate
C_TEXT:C284(SCPT_XL_PictureCreate; $0)
C_TEXT:C284(SCPT_XL_PictureCreate; $1)
C_TEXT:C284(SCPT_XL_PictureCreate; $2)
C_TEXT:C284(SCPT_XL_PictureCreate; $3)
C_REAL:C285(SCPT_XL_PictureCreate; $4)
C_REAL:C285(SCPT_XL_PictureCreate; $5)
C_REAL:C285(SCPT_XL_PictureCreate; $6)
C_REAL:C285(SCPT_XL_PictureCreate; $7)

//SCPT_XL_Range_Copy_Picture
C_TEXT:C284(SCPT_XL_Range_Copy_Picture; $1)
C_TEXT:C284(SCPT_XL_Range_Copy_Picture; $2)
C_TEXT:C284(SCPT_XL_Range_Copy_Picture; $3)
C_LONGINT:C283(SCPT_XL_Range_Copy_Picture; $4)
C_LONGINT:C283(SCPT_XL_Range_Copy_Picture; $5)

//SCPT_XL_Range_Get_Border
C_TEXT:C284(SCPT_XL_Range_Get_Border; $1)
C_TEXT:C284(SCPT_XL_Range_Get_Border; $2)
C_TEXT:C284(SCPT_XL_Range_Get_Border; $3)
C_LONGINT:C283(SCPT_XL_Range_Get_Border; $4)
C_POINTER:C301(SCPT_XL_Range_Get_Border; $5)
C_POINTER:C301(SCPT_XL_Range_Get_Border; $6)
C_POINTER:C301(SCPT_XL_Range_Get_Border; $7)

//SCPT_XL_Range_Get_Font_Bold
C_BOOLEAN:C305(SCPT_XL_Range_Get_Font_Bold; $0)
C_TEXT:C284(SCPT_XL_Range_Get_Font_Bold; $1)
C_TEXT:C284(SCPT_XL_Range_Get_Font_Bold; $2)
C_TEXT:C284(SCPT_XL_Range_Get_Font_Bold; $3)

//SCPT_Range_GetFontColor
C_LONGINT:C283(SCPT_Range_GetFontColor; $0)
C_TEXT:C284(SCPT_Range_GetFontColor; $1)
C_TEXT:C284(SCPT_Range_GetFontColor; $2)
C_TEXT:C284(SCPT_Range_GetFontColor; $3)

//SCPT_XL_Range_Get_Font_Italic
C_BOOLEAN:C305(SCPT_XL_Range_Get_Font_Italic; $0)
C_TEXT:C284(SCPT_XL_Range_Get_Font_Italic; $1)
C_TEXT:C284(SCPT_XL_Range_Get_Font_Italic; $2)
C_TEXT:C284(SCPT_XL_Range_Get_Font_Italic; $3)

//SCPT_XL_Range_Get_Font_Name
C_TEXT:C284(SCPT_XL_Range_Get_Font_Name; $0)
C_TEXT:C284(SCPT_XL_Range_Get_Font_Name; $1)
C_TEXT:C284(SCPT_XL_Range_Get_Font_Name; $2)
C_TEXT:C284(SCPT_XL_Range_Get_Font_Name; $3)

//SCPT_XL_Range_Get_Font_Outline
C_BOOLEAN:C305(SCPT_XL_Range_Get_Font_Outline; $0)
C_TEXT:C284(SCPT_XL_Range_Get_Font_Outline; $1)
C_TEXT:C284(SCPT_XL_Range_Get_Font_Outline; $2)
C_TEXT:C284(SCPT_XL_Range_Get_Font_Outline; $3)

//SCPT_XL_Range_Get_Font_Shadow
C_BOOLEAN:C305(SCPT_XL_Range_Get_Font_Shadow; $0)
C_TEXT:C284(SCPT_XL_Range_Get_Font_Shadow; $1)
C_TEXT:C284(SCPT_XL_Range_Get_Font_Shadow; $2)
C_TEXT:C284(SCPT_XL_Range_Get_Font_Shadow; $3)

//SCPT_XL_Range_Get_Font_SIze
C_REAL:C285(SCPT_XL_Range_Get_Font_SIze; $0)
C_TEXT:C284(SCPT_XL_Range_Get_Font_SIze; $1)
C_TEXT:C284(SCPT_XL_Range_Get_Font_SIze; $2)
C_TEXT:C284(SCPT_XL_Range_Get_Font_SIze; $3)

//SCPT_XL_Range_Get_Formula
C_TEXT:C284(SCPT_XL_Range_Get_Formula; $0)
C_TEXT:C284(SCPT_XL_Range_Get_Formula; $1)
C_TEXT:C284(SCPT_XL_Range_Get_Formula; $2)
C_TEXT:C284(SCPT_XL_Range_Get_Formula; $3)

//SCPT_XL_Range_get_Height
C_REAL:C285(SCPT_XL_Range_get_Height; $0)
C_TEXT:C284(SCPT_XL_Range_get_Height; $1)
C_TEXT:C284(SCPT_XL_Range_get_Height; $2)
C_TEXT:C284(SCPT_XL_Range_get_Height; $3)

//SCPT_XL_range_get_interior_colo
C_LONGINT:C283(SCPT_XL_range_get_interior_colo; $0)
C_TEXT:C284(SCPT_XL_range_get_interior_colo; $1)
C_TEXT:C284(SCPT_XL_range_get_interior_colo; $2)
C_TEXT:C284(SCPT_XL_range_get_interior_colo; $3)

//SCPT_XL_range_get_locked
C_BOOLEAN:C305(SCPT_XL_range_get_locked; $0)
C_TEXT:C284(SCPT_XL_range_get_locked; $1)
C_TEXT:C284(SCPT_XL_range_get_locked; $2)
C_TEXT:C284(SCPT_XL_range_get_locked; $3)

//SCPT_XL_range_get_name
C_TEXT:C284(SCPT_XL_range_get_name; $0)
C_TEXT:C284(SCPT_XL_range_get_name; $1)
C_TEXT:C284(SCPT_XL_range_get_name; $2)
C_TEXT:C284(SCPT_XL_range_get_name; $3)

//SCPT_XL_range_get_number_format
C_TEXT:C284(SCPT_XL_range_get_number_format; $0)
C_TEXT:C284(SCPT_XL_range_get_number_format; $1)
C_TEXT:C284(SCPT_XL_range_get_number_format; $2)
C_TEXT:C284(SCPT_XL_range_get_number_format; $3)

//SCPT_XL_range_get_orientation
C_REAL:C285(SCPT_XL_range_get_orientation; $0)
C_TEXT:C284(SCPT_XL_range_get_orientation; $1)
C_TEXT:C284(SCPT_XL_range_get_orientation; $2)
C_TEXT:C284(SCPT_XL_range_get_orientation; $3)

//SCPT_XL_range_get_rect
C_TEXT:C284(SCPT_XL_range_get_rect; $1)
C_TEXT:C284(SCPT_XL_range_get_rect; $2)
C_TEXT:C284(SCPT_XL_range_get_rect; $3)
C_POINTER:C301(SCPT_XL_range_get_rect; $4)
C_POINTER:C301(SCPT_XL_range_get_rect; $5)
C_POINTER:C301(SCPT_XL_range_get_rect; $6)
C_POINTER:C301(SCPT_XL_range_get_rect; $7)

//SCPT_XL_range_get_shrink_to_fit
C_BOOLEAN:C305(SCPT_XL_range_get_shrink_to_fit; $0)
C_TEXT:C284(SCPT_XL_range_get_shrink_to_fit; $1)
C_TEXT:C284(SCPT_XL_range_get_shrink_to_fit; $2)
C_TEXT:C284(SCPT_XL_range_get_shrink_to_fit; $3)

//SCPT_XL_range_get_strike_throug
C_BOOLEAN:C305(SCPT_XL_range_get_strike_throug; $0)
C_TEXT:C284(SCPT_XL_range_get_strike_throug; $1)
C_TEXT:C284(SCPT_XL_range_get_strike_throug; $2)
C_TEXT:C284(SCPT_XL_range_get_strike_throug; $3)

//SCPT_XL_range_get_subscript
C_BOOLEAN:C305(SCPT_XL_range_get_subscript; $0)
C_TEXT:C284(SCPT_XL_range_get_subscript; $1)
C_TEXT:C284(SCPT_XL_range_get_subscript; $2)
C_TEXT:C284(SCPT_XL_range_get_subscript; $3)

//SCPT_XL_range_get_superscript
C_BOOLEAN:C305(SCPT_XL_range_get_superscript; $0)
C_TEXT:C284(SCPT_XL_range_get_superscript; $1)
C_TEXT:C284(SCPT_XL_range_get_superscript; $2)
C_TEXT:C284(SCPT_XL_range_get_superscript; $3)

//SCPT_XL_range_get_underline
C_LONGINT:C283(SCPT_XL_range_get_underline; $0)
C_TEXT:C284(SCPT_XL_range_get_underline; $1)
C_TEXT:C284(SCPT_XL_range_get_underline; $2)
C_TEXT:C284(SCPT_XL_range_get_underline; $3)

//SCPT_XL_range_get_value
C_TEXT:C284(SCPT_XL_range_get_value; $0)
C_TEXT:C284(SCPT_XL_range_get_value; $1)
C_TEXT:C284(SCPT_XL_range_get_value; $2)
C_TEXT:C284(SCPT_XL_range_get_value; $3)

//SCPT_XL_range_get_value2
C_TEXT:C284(SCPT_XL_range_get_value2; $0)
C_TEXT:C284(SCPT_XL_range_get_value2; $1)
C_TEXT:C284(SCPT_XL_range_get_value2; $2)
C_TEXT:C284(SCPT_XL_range_get_value2; $3)

//SCPT_XL_range_get_width
C_REAL:C285(SCPT_XL_range_get_width; $0)
C_TEXT:C284(SCPT_XL_range_get_width; $1)
C_TEXT:C284(SCPT_XL_range_get_width; $2)
C_TEXT:C284(SCPT_XL_range_get_width; $3)

//SCPT_XL_range_get_wrap_text
C_BOOLEAN:C305(SCPT_XL_range_get_wrap_text; $0)
C_TEXT:C284(SCPT_XL_range_get_wrap_text; $1)
C_TEXT:C284(SCPT_XL_range_get_wrap_text; $2)
C_TEXT:C284(SCPT_XL_range_get_wrap_text; $3)

//SCPT_XL_range_merge
C_TEXT:C284(SCPT_XL_range_merge; $1)
C_TEXT:C284(SCPT_XL_range_merge; $2)
C_TEXT:C284(SCPT_XL_range_merge; $3)

//SCPT_XL_range_merge_across
C_TEXT:C284(SCPT_XL_range_merge_across; $1)
C_TEXT:C284(SCPT_XL_range_merge_across; $2)
C_TEXT:C284(SCPT_XL_range_merge_across; $3)

//SCPT_XL_range_set_border
C_TEXT:C284(SCPT_XL_range_set_border; $1)
C_TEXT:C284(SCPT_XL_range_set_border; $2)
C_TEXT:C284(SCPT_XL_range_set_border; $3)
C_LONGINT:C283(SCPT_XL_range_set_border; $4)
C_LONGINT:C283(SCPT_XL_range_set_border; $5)
C_LONGINT:C283(SCPT_XL_range_set_border; $6)
C_LONGINT:C283(SCPT_XL_range_set_border; $7)

//SCPT_XL_range_set_font_bold
C_TEXT:C284(SCPT_XL_range_set_font_bold; $1)
C_TEXT:C284(SCPT_XL_range_set_font_bold; $2)
C_TEXT:C284(SCPT_XL_range_set_font_bold; $3)
C_BOOLEAN:C305(SCPT_XL_range_set_font_bold; $4)

//SCPT_XL_range_set_font_color
C_TEXT:C284(SCPT_XL_range_set_font_color; $1)
C_TEXT:C284(SCPT_XL_range_set_font_color; $2)
C_TEXT:C284(SCPT_XL_range_set_font_color; $3)
C_LONGINT:C283(SCPT_XL_range_set_font_color; $4)

//SCPT_XL_range_set_font_italic
C_TEXT:C284(SCPT_XL_range_set_font_italic; $1)
C_TEXT:C284(SCPT_XL_range_set_font_italic; $2)
C_TEXT:C284(SCPT_XL_range_set_font_italic; $3)
C_BOOLEAN:C305(SCPT_XL_range_set_font_italic; $4)

//SCPT_XL_range_set_font_name
C_TEXT:C284(SCPT_XL_range_set_font_name; $1)
C_TEXT:C284(SCPT_XL_range_set_font_name; $2)
C_TEXT:C284(SCPT_XL_range_set_font_name; $3)
C_TEXT:C284(SCPT_XL_range_set_font_name; $4)

//SCPT_XL_range_set_font_outline
C_TEXT:C284(SCPT_XL_range_set_font_outline; $1)
C_TEXT:C284(SCPT_XL_range_set_font_outline; $2)
C_TEXT:C284(SCPT_XL_range_set_font_outline; $3)
C_BOOLEAN:C305(SCPT_XL_range_set_font_outline; $4)

//SCPT_XL_range_set_font_shadow
C_TEXT:C284(SCPT_XL_range_set_font_shadow; $1)
C_TEXT:C284(SCPT_XL_range_set_font_shadow; $2)
C_TEXT:C284(SCPT_XL_range_set_font_shadow; $3)
C_BOOLEAN:C305(SCPT_XL_range_set_font_shadow; $4)

//SCPT_XL_range_set_font_size
C_TEXT:C284(SCPT_XL_range_set_font_size; $1)
C_TEXT:C284(SCPT_XL_range_set_font_size; $2)
C_TEXT:C284(SCPT_XL_range_set_font_size; $3)
C_REAL:C285(SCPT_XL_range_set_font_size; $4)

//SCPT_XL_range_set_formula
C_TEXT:C284(SCPT_XL_range_set_formula; $1)
C_TEXT:C284(SCPT_XL_range_set_formula; $2)
C_TEXT:C284(SCPT_XL_range_set_formula; $3)
C_TEXT:C284(SCPT_XL_range_set_formula; $4)

//SCPT_XL_range_set_height
C_TEXT:C284(SCPT_XL_range_set_height; $1)
C_TEXT:C284(SCPT_XL_range_set_height; $2)
C_TEXT:C284(SCPT_XL_range_set_height; $3)
C_REAL:C285(SCPT_XL_range_set_height; $4)

//SCPT_XL_range_set_interior_colo
C_TEXT:C284(SCPT_XL_range_set_interior_colo; $1)
C_TEXT:C284(SCPT_XL_range_set_interior_colo; $2)
C_TEXT:C284(SCPT_XL_range_set_interior_colo; $3)
C_LONGINT:C283(SCPT_XL_range_set_interior_colo; $4)

//SCPT_XL_range_set_locked
C_TEXT:C284(SCPT_XL_range_set_locked; $1)
C_TEXT:C284(SCPT_XL_range_set_locked; $2)
C_TEXT:C284(SCPT_XL_range_set_locked; $3)
C_BOOLEAN:C305(SCPT_XL_range_set_locked; $4)

//SCPT_XL_range_set_name
C_TEXT:C284(SCPT_XL_range_set_name; $1)
C_TEXT:C284(SCPT_XL_range_set_name; $2)
C_TEXT:C284(SCPT_XL_range_set_name; $3)
C_TEXT:C284(SCPT_XL_range_set_name; $4)

//SCPT_XL_range_set_number_format
C_TEXT:C284(SCPT_XL_range_set_number_format; $1)
C_TEXT:C284(SCPT_XL_range_set_number_format; $2)
C_TEXT:C284(SCPT_XL_range_set_number_format; $3)
C_TEXT:C284(SCPT_XL_range_set_number_format; $4)

//SCPT_XL_range_set_orientation
C_TEXT:C284(SCPT_XL_range_set_orientation; $1)
C_TEXT:C284(SCPT_XL_range_set_orientation; $2)
C_TEXT:C284(SCPT_XL_range_set_orientation; $3)
C_REAL:C285(SCPT_XL_range_set_orientation; $4)

//SCPT_XL_range_set_shrink_to_fit
C_TEXT:C284(SCPT_XL_range_set_shrink_to_fit; $1)
C_TEXT:C284(SCPT_XL_range_set_shrink_to_fit; $2)
C_TEXT:C284(SCPT_XL_range_set_shrink_to_fit; $3)
C_BOOLEAN:C305(SCPT_XL_range_set_shrink_to_fit; $4)

//SCPT_XL_range_set_strike_throug
C_TEXT:C284(SCPT_XL_range_set_strike_throug; $1)
C_TEXT:C284(SCPT_XL_range_set_strike_throug; $2)
C_TEXT:C284(SCPT_XL_range_set_strike_throug; $3)
C_BOOLEAN:C305(SCPT_XL_range_set_strike_throug; $4)

//SCPT_XL_range_set_subscript
C_TEXT:C284(SCPT_XL_range_set_subscript; $1)
C_TEXT:C284(SCPT_XL_range_set_subscript; $2)
C_TEXT:C284(SCPT_XL_range_set_subscript; $3)
C_BOOLEAN:C305(SCPT_XL_range_set_subscript; $4)

//SCPT_XL_range_set_superscript
C_TEXT:C284(SCPT_XL_range_set_superscript; $1)
C_TEXT:C284(SCPT_XL_range_set_superscript; $2)
C_TEXT:C284(SCPT_XL_range_set_superscript; $3)
C_BOOLEAN:C305(SCPT_XL_range_set_superscript; $4)

//SCPT_XL_range_set_underline
C_TEXT:C284(SCPT_XL_range_set_underline; $1)
C_TEXT:C284(SCPT_XL_range_set_underline; $2)
C_TEXT:C284(SCPT_XL_range_set_underline; $3)
C_LONGINT:C283(SCPT_XL_range_set_underline; $4)

//SCPT_XL_range_set_value
C_TEXT:C284(SCPT_XL_range_set_value; $1)
C_TEXT:C284(SCPT_XL_range_set_value; $2)
C_TEXT:C284(SCPT_XL_range_set_value; $3)
C_TEXT:C284(SCPT_XL_range_set_value; $4)

//SCPT_XL_range_set_value_array
C_TEXT:C284(SCPT_XL_range_set_value_array; $1)
C_TEXT:C284(SCPT_XL_range_set_value_array; $2)
C_TEXT:C284(SCPT_XL_range_set_value_array; $3)
C_POINTER:C301(SCPT_XL_range_set_value_array; $4)

//SCPT_XL_range_set_width
C_TEXT:C284(SCPT_XL_range_set_width; $1)
C_TEXT:C284(SCPT_XL_range_set_width; $2)
C_TEXT:C284(SCPT_XL_range_set_width; $3)
C_REAL:C285(SCPT_XL_range_set_width; $4)

//SCPT_XL_range_set_wrap_text
C_TEXT:C284(SCPT_XL_range_set_wrap_text; $1)
C_TEXT:C284(SCPT_XL_range_set_wrap_text; $2)
C_TEXT:C284(SCPT_XL_range_set_wrap_text; $3)
C_BOOLEAN:C305(SCPT_XL_range_set_wrap_text; $4)

//SCPT_XL_range_unmerge
C_TEXT:C284(SCPT_XL_range_unmerge; $1)
C_TEXT:C284(SCPT_XL_range_unmerge; $2)
C_TEXT:C284(SCPT_XL_range_unmerge; $3)

//SCPT_XL_setup_get_1st_page_num
C_LONGINT:C283(SCPT_XL_setup_get_1st_page_num; $0)
C_TEXT:C284(SCPT_XL_setup_get_1st_page_num; $1)
C_TEXT:C284(SCPT_XL_setup_get_1st_page_num; $2)

//SCPT_XL_setup_get_bo_and_w

//SCPT_XL_setup_get_bottom_mar
C_REAL:C285(SCPT_XL_setup_get_bottom_mar; $0)
C_TEXT:C284(SCPT_XL_setup_get_bottom_mar; $1)
C_TEXT:C284(SCPT_XL_setup_get_bottom_mar; $2)
C_REAL:C285(SCPT_XL_setup_get_bottom_mar; $3)

//SCPT_XL_setup_get_draft
C_BOOLEAN:C305(SCPT_XL_setup_get_draft; $0)
C_TEXT:C284(SCPT_XL_setup_get_draft; $1)
C_TEXT:C284(SCPT_XL_setup_get_draft; $2)
C_REAL:C285(SCPT_XL_setup_get_draft; $3)

//SCPT_XL_setup_get_fit_pages_tal
C_LONGINT:C283(SCPT_XL_setup_get_fit_pages_tal; $0)
C_TEXT:C284(SCPT_XL_setup_get_fit_pages_tal; $1)
C_TEXT:C284(SCPT_XL_setup_get_fit_pages_tal; $2)

//SCPT_XL_setup_get_fit_pages_wid
C_LONGINT:C283(SCPT_XL_setup_get_fit_pages_wid; $0)
C_TEXT:C284(SCPT_XL_setup_get_fit_pages_wid; $1)
C_TEXT:C284(SCPT_XL_setup_get_fit_pages_wid; $2)

//SCPT_XL_setup_get_footer_margin
C_REAL:C285(SCPT_XL_setup_get_footer_margin; $0)
C_TEXT:C284(SCPT_XL_setup_get_footer_margin; $1)
C_TEXT:C284(SCPT_XL_setup_get_footer_margin; $2)
C_REAL:C285(SCPT_XL_setup_get_footer_margin; $3)

//SCPT_XL_setup_get_header_margin
C_REAL:C285(SCPT_XL_setup_get_header_margin; $0)
C_TEXT:C284(SCPT_XL_setup_get_header_margin; $1)
C_TEXT:C284(SCPT_XL_setup_get_header_margin; $2)
C_REAL:C285(SCPT_XL_setup_get_header_margin; $3)

//SCPT_XL_setup_get_left_margin
C_REAL:C285(SCPT_XL_setup_get_left_margin; $0)
C_TEXT:C284(SCPT_XL_setup_get_left_margin; $1)
C_TEXT:C284(SCPT_XL_setup_get_left_margin; $2)
C_REAL:C285(SCPT_XL_setup_get_left_margin; $3)

//SCPT_XL_setup_get_orientation
C_REAL:C285(SCPT_XL_setup_get_orientation; $0)
C_TEXT:C284(SCPT_XL_setup_get_orientation; $1)
C_TEXT:C284(SCPT_XL_setup_get_orientation; $2)

//SCPT_XL_setup_get_right_mar
C_REAL:C285(SCPT_XL_setup_get_right_mar; $0)
C_TEXT:C284(SCPT_XL_setup_get_right_mar; $1)
C_TEXT:C284(SCPT_XL_setup_get_right_mar; $2)
C_REAL:C285(SCPT_XL_setup_get_right_mar; $3)

//SCPT_XL_setup_get_top_mar
C_REAL:C285(SCPT_XL_setup_get_top_mar; $0)
C_TEXT:C284(SCPT_XL_setup_get_top_mar; $1)
C_TEXT:C284(SCPT_XL_setup_get_top_mar; $2)
C_REAL:C285(SCPT_XL_setup_get_top_mar; $3)

//SCPT_XL_setup_get_zoom
C_REAL:C285(SCPT_XL_setup_get_zoom; $0)
C_TEXT:C284(SCPT_XL_setup_get_zoom; $1)
C_TEXT:C284(SCPT_XL_setup_get_zoom; $2)

//SCPT_XL_setup_set_1st_page_num
C_TEXT:C284(SCPT_XL_setup_set_1st_page_num; $1)
C_TEXT:C284(SCPT_XL_setup_set_1st_page_num; $2)
C_LONGINT:C283(SCPT_XL_setup_set_1st_page_num; $3)

//SCPT_XL_setup_set_bo_and_w

//SCPT_XL_setup_set_bottom_mar_cm
C_TEXT:C284(SCPT_XL_setup_set_bottom_mar_cm; $1)
C_TEXT:C284(SCPT_XL_setup_set_bottom_mar_cm; $2)
C_REAL:C285(SCPT_XL_setup_set_bottom_mar_cm; $3)

//SCPT_XL_setup_set_bottom_margin
C_TEXT:C284(SCPT_XL_setup_set_bottom_margin; $1)
C_TEXT:C284(SCPT_XL_setup_set_bottom_margin; $2)
C_REAL:C285(SCPT_XL_setup_set_bottom_margin; $3)

//SCPT_XL_setup_set_draft
C_TEXT:C284(SCPT_XL_setup_set_draft; $1)
C_TEXT:C284(SCPT_XL_setup_set_draft; $2)
C_BOOLEAN:C305(SCPT_XL_setup_set_draft; $3)

//SCPT_XL_setup_set_fit_pages_tal
C_TEXT:C284(SCPT_XL_setup_set_fit_pages_tal; $1)
C_TEXT:C284(SCPT_XL_setup_set_fit_pages_tal; $2)
C_LONGINT:C283(SCPT_XL_setup_set_fit_pages_tal; $3)

//SCPT_XL_setup_set_fit_pages_wid
C_TEXT:C284(SCPT_XL_setup_set_fit_pages_wid; $1)
C_TEXT:C284(SCPT_XL_setup_set_fit_pages_wid; $2)
C_LONGINT:C283(SCPT_XL_setup_set_fit_pages_wid; $3)

//SCPT_XL_setup_set_footer_mar_cm
C_TEXT:C284(SCPT_XL_setup_set_footer_mar_cm; $1)
C_TEXT:C284(SCPT_XL_setup_set_footer_mar_cm; $2)
C_REAL:C285(SCPT_XL_setup_set_footer_mar_cm; $3)

//SCPT_XL_setup_set_footer_mar_in
C_TEXT:C284(SCPT_XL_setup_set_footer_mar_in; $1)
C_TEXT:C284(SCPT_XL_setup_set_footer_mar_in; $2)
C_REAL:C285(SCPT_XL_setup_set_footer_mar_in; $3)

//SCPT_XL_setup_set_header_mar_cm
C_TEXT:C284(SCPT_XL_setup_set_header_mar_cm; $1)
C_TEXT:C284(SCPT_XL_setup_set_header_mar_cm; $2)
C_REAL:C285(SCPT_XL_setup_set_header_mar_cm; $3)

//SCPT_XL_setup_set_header_mar_in
C_TEXT:C284(SCPT_XL_setup_set_header_mar_in; $1)
C_TEXT:C284(SCPT_XL_setup_set_header_mar_in; $2)
C_REAL:C285(SCPT_XL_setup_set_header_mar_in; $3)

//SCPT_XL_setup_set_left_mar_cm
C_TEXT:C284(SCPT_XL_setup_set_left_mar_cm; $1)
C_TEXT:C284(SCPT_XL_setup_set_left_mar_cm; $2)
C_REAL:C285(SCPT_XL_setup_set_left_mar_cm; $3)

//SCPT_XL_setup_set_left_mar_in
C_TEXT:C284(SCPT_XL_setup_set_left_mar_in; $1)
C_TEXT:C284(SCPT_XL_setup_set_left_mar_in; $2)
C_REAL:C285(SCPT_XL_setup_set_left_mar_in; $3)

//SCPT_XL_setup_set_orientation
C_TEXT:C284(SCPT_XL_setup_set_orientation; $1)
C_TEXT:C284(SCPT_XL_setup_set_orientation; $2)
C_LONGINT:C283(SCPT_XL_setup_set_orientation; $3)

//SCPT_XL_setup_set_right_mar_cm
C_TEXT:C284(SCPT_XL_setup_set_right_mar_cm; $1)
C_TEXT:C284(SCPT_XL_setup_set_right_mar_cm; $2)
C_REAL:C285(SCPT_XL_setup_set_right_mar_cm; $3)

//SCPT_XL_setup_set_right_margin_
C_TEXT:C284(SCPT_XL_setup_set_right_margin_; $1)
C_TEXT:C284(SCPT_XL_setup_set_right_margin_; $2)
C_REAL:C285(SCPT_XL_setup_set_right_margin_; $3)

//SCPT_XL_setup_set_top_margin_cm
C_TEXT:C284(SCPT_XL_setup_set_top_margin_cm; $1)
C_TEXT:C284(SCPT_XL_setup_set_top_margin_cm; $2)
C_REAL:C285(SCPT_XL_setup_set_top_margin_cm; $3)

//SCPT_XL_setup_set_top_margin_in
C_TEXT:C284(SCPT_XL_setup_set_top_margin_in; $1)
C_TEXT:C284(SCPT_XL_setup_set_top_margin_in; $2)
C_REAL:C285(SCPT_XL_setup_set_top_margin_in; $3)

//SCPT_XL_setup_set_zoom
C_TEXT:C284(SCPT_XL_setup_set_zoom; $1)
C_TEXT:C284(SCPT_XL_setup_set_zoom; $2)
C_REAL:C285(SCPT_XL_setup_set_zoom; $3)

//SCPT_XL_shape_count
C_LONGINT:C283(SCPT_XL_shape_count; $0)
C_TEXT:C284(SCPT_XL_shape_count; $1)
C_TEXT:C284(SCPT_XL_shape_count; $2)

//SCPT_XL_shape_get_lock_ratio
C_BOOLEAN:C305(SCPT_XL_shape_get_lock_ratio; $0)
C_TEXT:C284(SCPT_XL_shape_get_lock_ratio; $1)
C_TEXT:C284(SCPT_XL_shape_get_lock_ratio; $2)
C_TEXT:C284(SCPT_XL_shape_get_lock_ratio; $3)

//SCPT_XL_shape_get_name
C_TEXT:C284(SCPT_XL_shape_get_name; $0)
C_TEXT:C284(SCPT_XL_shape_get_name; $1)
C_TEXT:C284(SCPT_XL_shape_get_name; $2)
C_LONGINT:C283(SCPT_XL_shape_get_name; $3)

//SCPT_XL_shape_get_placement
C_LONGINT:C283(SCPT_XL_shape_get_placement; $0)
C_TEXT:C284(SCPT_XL_shape_get_placement; $1)
C_TEXT:C284(SCPT_XL_shape_get_placement; $2)
C_TEXT:C284(SCPT_XL_shape_get_placement; $3)

//SCPT_XL_shape_get_rect
C_TEXT:C284(SCPT_XL_shape_get_rect; $1)
C_TEXT:C284(SCPT_XL_shape_get_rect; $2)
C_TEXT:C284(SCPT_XL_shape_get_rect; $3)
C_POINTER:C301(SCPT_XL_shape_get_rect; $4)
C_POINTER:C301(SCPT_XL_shape_get_rect; $5)
C_POINTER:C301(SCPT_XL_shape_get_rect; $6)
C_POINTER:C301(SCPT_XL_shape_get_rect; $7)

//SCPT_XL_shape_get_rotation
C_REAL:C285(SCPT_XL_shape_get_rotation; $0)
C_TEXT:C284(SCPT_XL_shape_get_rotation; $1)
C_TEXT:C284(SCPT_XL_shape_get_rotation; $2)
C_TEXT:C284(SCPT_XL_shape_get_rotation; $3)

//SCPT_XL_shape_set_lock_ratio
C_TEXT:C284(SCPT_XL_shape_set_lock_ratio; $1)
C_TEXT:C284(SCPT_XL_shape_set_lock_ratio; $2)
C_TEXT:C284(SCPT_XL_shape_set_lock_ratio; $3)
C_BOOLEAN:C305(SCPT_XL_shape_set_lock_ratio; $4)

//SCPT_XL_shape_set_name
C_TEXT:C284(SCPT_XL_shape_set_name; $1)
C_TEXT:C284(SCPT_XL_shape_set_name; $2)
C_LONGINT:C283(SCPT_XL_shape_set_name; $3)
C_TEXT:C284(SCPT_XL_shape_set_name; $4)

//SCPT_XL_shape_set_placement
C_TEXT:C284(SCPT_XL_shape_set_placement; $1)
C_TEXT:C284(SCPT_XL_shape_set_placement; $2)
C_TEXT:C284(SCPT_XL_shape_set_placement; $3)
C_LONGINT:C283(SCPT_XL_shape_set_placement; $4)

//SCPT_XL_shape_set_rect
C_TEXT:C284(SCPT_XL_shape_set_rect; $1)
C_TEXT:C284(SCPT_XL_shape_set_rect; $2)
C_TEXT:C284(SCPT_XL_shape_set_rect; $3)
C_REAL:C285(SCPT_XL_shape_set_rect; $4)
C_REAL:C285(SCPT_XL_shape_set_rect; $5)
C_REAL:C285(SCPT_XL_shape_set_rect; $6)
C_REAL:C285(SCPT_XL_shape_set_rect; $7)

//SCPT_XL_shape_set_rotation
C_TEXT:C284(SCPT_XL_shape_set_rotation; $1)
C_TEXT:C284(SCPT_XL_shape_set_rotation; $2)
C_TEXT:C284(SCPT_XL_shape_set_rotation; $3)
C_REAL:C285(SCPT_XL_shape_set_rotation; $4)

//SCPT_XL_sheet_break_create_h
C_TEXT:C284(SCPT_XL_sheet_break_create_h; $1)
C_TEXT:C284(SCPT_XL_sheet_break_create_h; $2)
C_LONGINT:C283(SCPT_XL_sheet_break_create_h; $3)

//SCPT_XL_sheet_break_create_v
C_TEXT:C284(SCPT_XL_sheet_break_create_v; $1)
C_TEXT:C284(SCPT_XL_sheet_break_create_v; $2)
C_LONGINT:C283(SCPT_XL_sheet_break_create_v; $3)

//SCPT_XL_sheet_break_reset
C_TEXT:C284(SCPT_XL_sheet_break_reset; $1)
C_TEXT:C284(SCPT_XL_sheet_break_reset; $2)

//SCPT_XL_sheet_count
C_LONGINT:C283(SCPT_XL_sheet_count; $0)
C_TEXT:C284(SCPT_XL_sheet_count; $1)

//SCPT_XL_sheet_create
C_TEXT:C284(SCPT_XL_sheet_create; $0)
C_TEXT:C284(SCPT_XL_sheet_create; $1)

//SCPT_XL_sheet_get_name
C_TEXT:C284(SCPT_XL_sheet_get_name; $0)
C_TEXT:C284(SCPT_XL_sheet_get_name; $1)
C_LONGINT:C283(SCPT_XL_sheet_get_name; $2)

//SCPT_XL_sheet_set_background
C_TEXT:C284(SCPT_XL_sheet_set_background; $1)
C_TEXT:C284(SCPT_XL_sheet_set_background; $2)
C_TEXT:C284(SCPT_XL_sheet_set_background; $3)

//SCPT_XL_sheet_set_name
C_TEXT:C284(SCPT_XL_sheet_set_name; $1)
C_LONGINT:C283(SCPT_XL_sheet_set_name; $2)
C_TEXT:C284(SCPT_XL_sheet_set_name; $3)

//SCPT_XL_win_count
C_LONGINT:C283(SCPT_XL_win_count; $0)
C_TEXT:C284(SCPT_XL_win_count; $1)

//SCPT_XL_win_get_caption
C_TEXT:C284(SCPT_XL_win_get_caption; $0)
C_TEXT:C284(SCPT_XL_win_get_caption; $1)
C_LONGINT:C283(SCPT_XL_win_get_caption; $2)

//SCPT_XL_win_get_display_grid
C_BOOLEAN:C305(SCPT_XL_win_get_display_grid; $0)
C_TEXT:C284(SCPT_XL_win_get_display_grid; $1)
C_TEXT:C284(SCPT_XL_win_get_display_grid; $2)

//SCPT_XL_win_get_enable_resize
C_BOOLEAN:C305(SCPT_XL_win_get_enable_resize; $0)
C_TEXT:C284(SCPT_XL_win_get_enable_resize; $1)
C_TEXT:C284(SCPT_XL_win_get_enable_resize; $2)

//SCPT_XL_win_get_freeze_panes
C_BOOLEAN:C305(SCPT_XL_win_get_freeze_panes; $0)
C_TEXT:C284(SCPT_XL_win_get_freeze_panes; $1)
C_TEXT:C284(SCPT_XL_win_get_freeze_panes; $2)

//SCPT_XL_win_get_gridline_color
C_LONGINT:C283(SCPT_XL_win_get_gridline_color; $0)
C_TEXT:C284(SCPT_XL_win_get_gridline_color; $1)
C_TEXT:C284(SCPT_XL_win_get_gridline_color; $2)

//SCPT_XL_win_get_rect
C_TEXT:C284(SCPT_XL_win_get_rect; $1)
C_TEXT:C284(SCPT_XL_win_get_rect; $2)
C_POINTER:C301(SCPT_XL_win_get_rect; $3)
C_POINTER:C301(SCPT_XL_win_get_rect; $4)
C_POINTER:C301(SCPT_XL_win_get_rect; $5)
C_POINTER:C301(SCPT_XL_win_get_rect; $6)

//SCPT_XL_win_get_show_gridlines
C_BOOLEAN:C305(SCPT_XL_win_get_show_gridlines; $0)
C_TEXT:C284(SCPT_XL_win_get_show_gridlines; $1)
C_TEXT:C284(SCPT_XL_win_get_show_gridlines; $2)

//SCPT_XL_win_get_show_headings
C_BOOLEAN:C305(SCPT_XL_win_get_show_headings; $0)
C_TEXT:C284(SCPT_XL_win_get_show_headings; $1)
C_TEXT:C284(SCPT_XL_win_get_show_headings; $2)

//SCPT_XL_win_get_show_outline
C_BOOLEAN:C305(SCPT_XL_win_get_show_outline; $0)
C_TEXT:C284(SCPT_XL_win_get_show_outline; $1)
C_TEXT:C284(SCPT_XL_win_get_show_outline; $2)

//SCPT_XL_win_get_show_scroll_h
C_BOOLEAN:C305(SCPT_XL_win_get_show_scroll_h; $0)
C_TEXT:C284(SCPT_XL_win_get_show_scroll_h; $1)
C_TEXT:C284(SCPT_XL_win_get_show_scroll_h; $2)

//SCPT_XL_win_get_show_scroll_v
C_BOOLEAN:C305(SCPT_XL_win_get_show_scroll_v; $0)
C_TEXT:C284(SCPT_XL_win_get_show_scroll_v; $1)
C_TEXT:C284(SCPT_XL_win_get_show_scroll_v; $2)

//SCPT_XL_win_get_show_tabs
C_BOOLEAN:C305(SCPT_XL_win_get_show_tabs; $0)
C_TEXT:C284(SCPT_XL_win_get_show_tabs; $1)
C_TEXT:C284(SCPT_XL_win_get_show_tabs; $2)

//SCPT_XL_win_get_split_column
C_LONGINT:C283(SCPT_XL_win_get_split_column; $0)
C_TEXT:C284(SCPT_XL_win_get_split_column; $1)
C_TEXT:C284(SCPT_XL_win_get_split_column; $2)

//SCPT_XL_win_get_split_row
C_LONGINT:C283(SCPT_XL_win_get_split_row; $0)
C_TEXT:C284(SCPT_XL_win_get_split_row; $1)
C_TEXT:C284(SCPT_XL_win_get_split_row; $2)

//SCPT_XL_win_get_tab_ratio
C_REAL:C285(SCPT_XL_win_get_tab_ratio; $0)
C_TEXT:C284(SCPT_XL_win_get_tab_ratio; $1)
C_TEXT:C284(SCPT_XL_win_get_tab_ratio; $2)

//SCPT_XL_win_get_view
C_LONGINT:C283(SCPT_XL_win_get_view; $0)
C_TEXT:C284(SCPT_XL_win_get_view; $1)
C_TEXT:C284(SCPT_XL_win_get_view; $2)

//SCPT_XL_win_get_visible
C_BOOLEAN:C305(SCPT_XL_win_get_visible; $0)
C_TEXT:C284(SCPT_XL_win_get_visible; $1)
C_TEXT:C284(SCPT_XL_win_get_visible; $2)

//SCPT_XL_win_get_zoom
C_BOOLEAN:C305(SCPT_XL_win_get_zoom; $0)
C_TEXT:C284(SCPT_XL_win_get_zoom; $1)
C_TEXT:C284(SCPT_XL_win_get_zoom; $2)

//SCPT_XL_win_set_caption
C_TEXT:C284(SCPT_XL_win_set_caption; $1)
C_LONGINT:C283(SCPT_XL_win_set_caption; $2)
C_TEXT:C284(SCPT_XL_win_set_caption; $3)

//SCPT_XL_win_set_enable_resize
C_TEXT:C284(SCPT_XL_win_set_enable_resize; $1)
C_TEXT:C284(SCPT_XL_win_set_enable_resize; $2)
C_BOOLEAN:C305(SCPT_XL_win_set_enable_resize; $3)

//SCPT_XL_win_set_freeze_panes
C_TEXT:C284(SCPT_XL_win_set_freeze_panes; $1)
C_TEXT:C284(SCPT_XL_win_set_freeze_panes; $2)
C_BOOLEAN:C305(SCPT_XL_win_set_freeze_panes; $3)

//SCPT_XL_win_set_gridline_color
C_TEXT:C284(SCPT_XL_win_set_gridline_color; $1)
C_TEXT:C284(SCPT_XL_win_set_gridline_color; $2)
C_LONGINT:C283(SCPT_XL_win_set_gridline_color; $3)

//SCPT_XL_window_set_rect
C_TEXT:C284(SCPT_XL_window_set_rect; $1)
C_TEXT:C284(SCPT_XL_window_set_rect; $2)
C_REAL:C285(SCPT_XL_window_set_rect; $3)
C_REAL:C285(SCPT_XL_window_set_rect; $4)
C_REAL:C285(SCPT_XL_window_set_rect; $5)
C_REAL:C285(SCPT_XL_window_set_rect; $6)

//SCPT_XL_window_set_show_gridlin
C_TEXT:C284(SCPT_XL_window_set_show_gridlin; $1)
C_TEXT:C284(SCPT_XL_window_set_show_gridlin; $2)
C_BOOLEAN:C305(SCPT_XL_window_set_show_gridlin; $3)

//SCPT_XL_window_set_show_heading
C_TEXT:C284(SCPT_XL_window_set_show_heading; $1)
C_TEXT:C284(SCPT_XL_window_set_show_heading; $2)
C_BOOLEAN:C305(SCPT_XL_window_set_show_heading; $3)

//SCPT_XL_win_set_show_outline
C_TEXT:C284(SCPT_XL_win_set_show_outline; $1)
C_TEXT:C284(SCPT_XL_win_set_show_outline; $2)
C_BOOLEAN:C305(SCPT_XL_win_set_show_outline; $3)

//SCPT_XL_win_set_show_scroll_h
C_TEXT:C284(SCPT_XL_win_set_show_scroll_h; $1)
C_TEXT:C284(SCPT_XL_win_set_show_scroll_h; $2)
C_BOOLEAN:C305(SCPT_XL_win_set_show_scroll_h; $3)

//SCPT_XL_window_set_show_scroll_
C_TEXT:C284(SCPT_XL_window_set_show_scroll_; $1)
C_TEXT:C284(SCPT_XL_window_set_show_scroll_; $2)
C_BOOLEAN:C305(SCPT_XL_window_set_show_scroll_; $3)

//SCPT_XL_window_set_show_tabs
C_TEXT:C284(SCPT_XL_window_set_show_tabs; $1)
C_TEXT:C284(SCPT_XL_window_set_show_tabs; $2)
C_BOOLEAN:C305(SCPT_XL_window_set_show_tabs; $3)

//SCPT_XL_window_set_split_column
C_TEXT:C284(SCPT_XL_window_set_split_column; $1)
C_TEXT:C284(SCPT_XL_window_set_split_column; $2)
C_LONGINT:C283(SCPT_XL_window_set_split_column; $3)

//SCPT_XL_window_set_split_row
C_TEXT:C284(SCPT_XL_window_set_split_row; $1)
C_TEXT:C284(SCPT_XL_window_set_split_row; $2)
C_LONGINT:C283(SCPT_XL_window_set_split_row; $3)

//SCPT_XL_window_set_tab_ratio
C_TEXT:C284(SCPT_XL_window_set_tab_ratio; $1)
C_TEXT:C284(SCPT_XL_window_set_tab_ratio; $2)
C_REAL:C285(SCPT_XL_window_set_tab_ratio; $3)

//SCPT_XL_window_set_view
C_TEXT:C284(SCPT_XL_window_set_view; $1)
C_TEXT:C284(SCPT_XL_window_set_view; $2)
C_LONGINT:C283(SCPT_XL_window_set_view; $3)

//SCPT_XL_window_set_visible
C_TEXT:C284(SCPT_XL_window_set_visible; $1)
C_TEXT:C284(SCPT_XL_window_set_visible; $2)
C_BOOLEAN:C305(SCPT_XL_window_set_visible; $3)

//SCPT_XL_window_set_zoom
C_TEXT:C284(SCPT_XL_window_set_zoom; $1)
C_TEXT:C284(SCPT_XL_window_set_zoom; $2)
C_REAL:C285(SCPT_XL_window_set_zoom; $3)

//SCPT_XL_workbook_close
C_TEXT:C284(SCPT_XL_workbook_close; $1)

//SCPT_XL_workbook_create
C_TEXT:C284(SCPT_XL_workbook_create; $0)

//SCPT_XL_workbook_get_full_name
C_TEXT:C284(SCPT_XL_workbook_get_full_name; $0)
C_TEXT:C284(SCPT_XL_workbook_get_full_name; $1)

//SCPT_XL_workbook_get_path
C_TEXT:C284(SCPT_XL_workbook_get_path; $0)
C_TEXT:C284(SCPT_XL_workbook_get_path; $1)

//SCPT_XL_workbook_open
C_TEXT:C284(SCPT_XL_workbook_open; $0)
C_TEXT:C284(SCPT_XL_workbook_open; $1)

//SCPT_XL_workbook_print_out
C_TEXT:C284(SCPT_XL_workbook_print_out; $1)
C_LONGINT:C283(SCPT_XL_workbook_print_out; $2)

//SCPT_XL_workbook_save
C_TEXT:C284(SCPT_XL_workbook_save; $1)

//SCPT_XL_workbook_save_as_csv
C_TEXT:C284(SCPT_XL_workbook_save_as_csv; $0)
C_TEXT:C284(SCPT_XL_workbook_save_as_csv; $1)
C_TEXT:C284(SCPT_XL_workbook_save_as_csv; $2)

//SCPT_XL_workbook_save_as_dif
C_TEXT:C284(SCPT_XL_workbook_save_as_dif; $0)
C_TEXT:C284(SCPT_XL_workbook_save_as_dif; $1)
C_TEXT:C284(SCPT_XL_workbook_save_as_dif; $2)

//SCPT_XL_workbook_save_as_sylk
C_TEXT:C284(SCPT_XL_workbook_save_as_sylk; $0)
C_TEXT:C284(SCPT_XL_workbook_save_as_sylk; $1)
C_TEXT:C284(SCPT_XL_workbook_save_as_sylk; $2)

//SCPT_XL_workbook_save_as_xls
C_TEXT:C284(SCPT_XL_workbook_save_as_xls; $0)
C_TEXT:C284(SCPT_XL_workbook_save_as_xls; $1)
C_TEXT:C284(SCPT_XL_workbook_save_as_xls; $2)

//SCPT_XL_workbook_save_as_xlsx
C_TEXT:C284(SCPT_XL_workbook_save_as_xlsx; $0)
C_TEXT:C284(SCPT_XL_workbook_save_as_xlsx; $1)
C_TEXT:C284(SCPT_XL_workbook_save_as_xlsx; $2)

//SCPT_XL_workbook_save_as_xml
C_TEXT:C284(SCPT_XL_workbook_save_as_xml; $0)
C_TEXT:C284(SCPT_XL_workbook_save_as_xml; $1)
C_TEXT:C284(SCPT_XL_workbook_save_as_xml; $2)

//SCPT_XL_workbook_send_mail
C_TEXT:C284(SCPT_XL_workbook_send_mail; $1)
C_TEXT:C284(SCPT_XL_workbook_send_mail; $2)
C_TEXT:C284(SCPT_XL_workbook_send_mail; $3)

//SCPT_XL_workbook_send_mail_revi
C_TEXT:C284(SCPT_XL_workbook_send_mail_revi; $1)
C_TEXT:C284(SCPT_XL_workbook_send_mail_revi; $2)
C_TEXT:C284(SCPT_XL_workbook_send_mail_revi; $3)

//SCPT_XL_workbook_web_page_previ
C_TEXT:C284(SCPT_XL_workbook_web_page_previ; $0)
C_TEXT:C284(SCPT_XL_workbook_web_page_previ; $1)

//SCPT_XL_range_get_font_color
C_LONGINT:C283(SCPT_XL_range_get_font_color; $0)
C_TEXT:C284(SCPT_XL_range_get_font_color; $1)
C_TEXT:C284(SCPT_XL_range_get_font_color; $2)
C_TEXT:C284(SCPT_XL_range_get_font_color; $3)

//ACC_SetupManagerRow
C_LONGINT:C283(ACC_SetupManagerRow; $1)
C_POINTER:C301(ACC_SetupManagerRow; $2)
C_LONGINT:C283(ACC_SetupManagerRow; $3)

//onWebConnection
C_TEXT:C284(onWebConnection; $1)
C_TEXT:C284(onWebConnection; $2)
C_TEXT:C284(onWebConnection; $3)
C_TEXT:C284(onWebConnection; $4)
C_TEXT:C284(onWebConnection; $5)
C_TEXT:C284(onWebConnection; $6)

//onBackupStartup
C_LONGINT:C283(onBackupStartup; $0)

//onBackupShutdown
C_LONGINT:C283(onBackupShutdown; $1)

//DB_GetMethodPath
C_TEXT:C284(DB_GetMethodPath; $0)
C_TEXT:C284(DB_GetMethodPath; $1)
C_POINTER:C301(DB_GetMethodPath; $2)

//DB_TranslateMethodPath
C_TEXT:C284(DB_TranslateMethodPath; $0)
C_TEXT:C284(DB_TranslateMethodPath; $1)

//DB_TranslateFieldNames
C_TEXT:C284(DB_TranslateFieldNames; $1)

//DB_MethodChanges
C_TEXT:C284(DB_MethodChanges; $0)
C_POINTER:C301(DB_MethodChanges; $1)
C_POINTER:C301(DB_MethodChanges; $2)
C_POINTER:C301(DB_MethodChanges; $3)
C_POINTER:C301(DB_MethodChanges; $4)
C_LONGINT:C283(DB_MethodChanges; $5)
C_LONGINT:C283(DB_MethodChanges; $6)

//DB_GetFormObjectProperties
C_BOOLEAN:C305(DB_GetFormObjectProperties; $1)

//DB_DecodeMethodPath
C_TEXT:C284(DB_DecodeMethodPath; $0)
C_TEXT:C284(DB_DecodeMethodPath; $1)

//SR_GetReport
C_BOOLEAN:C305(SR_GetReport; $0)
C_POINTER:C301(SR_GetReport; $1)
C_TEXT:C284(SR_GetReport; $2)
C_TEXT:C284(SR_GetReport; $3)
C_TEXT:C284(SR_GetReport; $4)

//ACC_BuildProfitAccount
C_TEXT:C284(ACC_BuildProfitAccount; $0)
C_TEXT:C284(ACC_BuildProfitAccount; $1)

//ACC_LiveProfitPreferences
C_TEXT:C284(ACC_LiveProfitPreferences; $0)
C_BOOLEAN:C305(ACC_LiveProfitPreferences; $1)

//AA_CheckUUID
C_LONGINT:C283(AA_CheckUUID; $1)

//LBI_DefineFooters
C_TEXT:C284(LBI_DefineFooters; $1)

//STK_EditCheckUnallocation
C_BOOLEAN:C305(STK_EditCheckUnallocation; $0)
C_BOOLEAN:C305(STK_EditCheckUnallocation; $1)

//STK_EditCheckAllocation
C_BOOLEAN:C305(STK_EditCheckAllocation; $0)
C_BOOLEAN:C305(STK_EditCheckAllocation; $1)

//STK_EditCheckMovementType
C_BOOLEAN:C305(STK_EditCheckMovementType; $0)

//STK_EditCheckQuantity
C_BOOLEAN:C305(STK_EditCheckQuantity; $0)

//STK_EditCheckItemIntegrity
C_BOOLEAN:C305(STK_EditCheckItemIntegrity; $0)
C_BOOLEAN:C305(STK_EditCheckItemIntegrity; $1)
C_BOOLEAN:C305(STK_EditCheckItemIntegrity; $2)
C_BOOLEAN:C305(STK_EditCheckItemIntegrity; $3)
C_BOOLEAN:C305(STK_EditCheckItemIntegrity; $4)
C_BOOLEAN:C305(STK_EditCheckItemIntegrity; $5)
C_BOOLEAN:C305(STK_EditCheckItemIntegrity; $6)
C_LONGINT:C283(STK_EditCheckItemIntegrity; $7)
C_LONGINT:C283(STK_EditCheckItemIntegrity; $8)
C_LONGINT:C283(STK_EditCheckItemIntegrity; $9)

//Method7200


//STK_DisplayResidual
C_TEXT:C284(STK_DisplayResidual; $0)

//QR_GetFieldName
C_TEXT:C284(QR_GetFieldName; $0)
C_POINTER:C301(QR_GetFieldName; $1)

//Tenthmatrix_SQL_Login
C_LONGINT:C283(Tenthmatrix_SQL_Login; $0)

//DBM_GetSQLData
C_LONGINT:C283(DBM_GetSQLData; $1)

//LB_CalculatedColumnLONG
C_LONGINT:C283(LB_CalculatedColumnLONG; $0)
C_TEXT:C284(LB_CalculatedColumnLONG; $1)
C_TEXT:C284(LB_CalculatedColumnLONG; $2)
C_TEXT:C284(LB_CalculatedColumnLONG; $3)
C_TEXT:C284(LB_CalculatedColumnLONG; $4)

//LB_CalculatedColumnTEXT
C_TEXT:C284(LB_CalculatedColumnTEXT; $0)
C_TEXT:C284(LB_CalculatedColumnTEXT; $1)
C_TEXT:C284(LB_CalculatedColumnTEXT; $2)
C_TEXT:C284(LB_CalculatedColumnTEXT; $3)
C_TEXT:C284(LB_CalculatedColumnTEXT; $4)

//LB_CalculatedColumnDATE
C_DATE:C307(LB_CalculatedColumnDATE; $0)
C_TEXT:C284(LB_CalculatedColumnDATE; $1)
C_TEXT:C284(LB_CalculatedColumnDATE; $2)
C_TEXT:C284(LB_CalculatedColumnDATE; $3)
C_TEXT:C284(LB_CalculatedColumnDATE; $4)

//LB_CalculatedColumnBoolean
C_BOOLEAN:C305(LB_CalculatedColumnBoolean; $0)
C_TEXT:C284(LB_CalculatedColumnBoolean; $1)
C_TEXT:C284(LB_CalculatedColumnBoolean; $2)
C_TEXT:C284(LB_CalculatedColumnBoolean; $3)
C_TEXT:C284(LB_CalculatedColumnBoolean; $4)

//LB_CalculatedColumnREAL
C_REAL:C285(LB_CalculatedColumnREAL; $0)
C_TEXT:C284(LB_CalculatedColumnREAL; $1)
C_TEXT:C284(LB_CalculatedColumnREAL; $2)
C_TEXT:C284(LB_CalculatedColumnREAL; $3)
C_TEXT:C284(LB_CalculatedColumnREAL; $4)

//LB_CalculatedColumnPICT
C_PICTURE:C286(LB_CalculatedColumnPICT; $0)
C_TEXT:C284(LB_CalculatedColumnPICT; $1)
C_TEXT:C284(LB_CalculatedColumnPICT; $2)
C_TEXT:C284(LB_CalculatedColumnPICT; $3)
C_TEXT:C284(LB_CalculatedColumnPICT; $4)

//LB_CalculatedColumnANY
C_LONGINT:C283(LB_CalculatedColumnANY; $0)
C_TEXT:C284(LB_CalculatedColumnANY; $1)
C_TEXT:C284(LB_CalculatedColumnANY; $2)
C_TEXT:C284(LB_CalculatedColumnANY; $3)
C_TEXT:C284(LB_CalculatedColumnANY; $4)
C_LONGINT:C283(LB_CalculatedColumnANY; $5)
C_POINTER:C301(LB_CalculatedColumnANY; $6)

//STK_EndTransaction
C_LONGINT:C283(STK_EndTransaction; $1)
C_BOOLEAN:C305(STK_EndTransaction; $2)

//Stk_AddToONHold
C_LONGINT:C283(Stk_AddToONHold; $1)
C_LONGINT:C283(Stk_AddToONHold; $2)
C_REAL:C285(Stk_AddToONHold; $3)
C_LONGINT:C283(Stk_AddToONHold; $4)

//DB_TablesPalette
C_LONGINT:C283(DB_TablesPalette; $1)

//STK_SHOWPROGRESS
C_LONGINT:C283(STK_SHOWPROGRESS; $1)

//STK_SetCreatedStockItem
C_LONGINT:C283(STK_SetCreatedStockItem; $1)
C_REAL:C285(STK_SetCreatedStockItem; $2)
C_LONGINT:C283(STK_SetCreatedStockItem; $3)
C_LONGINT:C283(STK_SetCreatedStockItem; $4)
C_LONGINT:C283(STK_SetCreatedStockItem; $5)

//STK_CountonHold
C_REAL:C285(STK_CountonHold; $0)
C_LONGINT:C283(STK_CountonHold; $1)
C_BOOLEAN:C305(STK_CountonHold; $2)

//DB_appendPointers
C_LONGINT:C283(DB_appendPointers; $0)
C_POINTER:C301(DB_appendPointers; $1)
C_LONGINT:C283(DB_appendPointers; $2)
C_TEXT:C284(DB_appendPointers; $3)
C_POINTER:C301(DB_appendPointers; $4)
C_POINTER:C301(DB_appendPointers; $5)
C_POINTER:C301(DB_appendPointers; $6)

//DB_TableAreStatsAvailable
C_BOOLEAN:C305(DB_TableAreStatsAvailable; $0)
C_LONGINT:C283(DB_TableAreStatsAvailable; $1)

//DB_SetFormLayoutNEW
C_LONGINT:C283(DB_SetFormLayoutNEW; $1)
C_TEXT:C284(DB_SetFormLayoutNEW; $2)
C_LONGINT:C283(DB_SetFormLayoutNEW; $3)

//Get_Picture
C_PICTURE:C286(Get_Picture; $0)
C_VARIANT:C1683(Get_Picture; $1)

//DATA_GetDataFromTimeStamp
C_LONGINT:C283(DATA_GetDataFromTimeStamp; $1)
C_POINTER:C301(DATA_GetDataFromTimeStamp; $2)
C_POINTER:C301(DATA_GetDataFromTimeStamp; $3)

//DATA_CreateTimeStamp
C_LONGINT:C283(DATA_CreateTimeStamp; $0)
C_DATE:C307(DATA_CreateTimeStamp; $1)
C_TIME:C306(DATA_CreateTimeStamp; $2)

//CORE_GetFormObjects
C_TEXT:C284(CORE_GetFormObjects; $1)
C_LONGINT:C283(CORE_GetFormObjects; $2)
C_POINTER:C301(CORE_GetFormObjects; $3)

//CORE_DBGetMethodPath
C_TEXT:C284(CORE_DBGetMethodPath; $0)
C_TEXT:C284(CORE_DBGetMethodPath; $1)
C_POINTER:C301(CORE_DBGetMethodPath; $2)

//CORE_DBCodeManager
C_TEXT:C284(CORE_DBCodeManager; $1)
C_LONGINT:C283(CORE_DBCodeManager; $2)
C_BOOLEAN:C305(CORE_DBCodeManager; $3)

//CORE_DBCodeBuildTitle
C_TEXT:C284(CORE_DBCodeBuildTitle; $0)
C_TEXT:C284(CORE_DBCodeBuildTitle; $1)
C_POINTER:C301(CORE_DBCodeBuildTitle; $2)
C_POINTER:C301(CORE_DBCodeBuildTitle; $3)

//CORE_DB_CodeExtractComment
C_TEXT:C284(CORE_DB_CodeExtractComment; $0)
C_TEXT:C284(CORE_DB_CodeExtractComment; $1)

//CODE_WatchForms
C_LONGINT:C283(CODE_WatchForms; $1)

//CODE_ManagerStructureExport
C_LONGINT:C283(CODE_ManagerStructureExport; $1)
C_BOOLEAN:C305(CODE_ManagerStructureExport; $2)

//CODE_GetCompilerDirectives
C_POINTER:C301(CODE_GetCompilerDirectives; $1)
C_POINTER:C301(CODE_GetCompilerDirectives; $2)
C_POINTER:C301(CODE_GetCompilerDirectives; $3)
C_POINTER:C301(CODE_GetCompilerDirectives; $4)
C_POINTER:C301(CODE_GetCompilerDirectives; $5)
C_POINTER:C301(CODE_GetCompilerDirectives; $6)
C_POINTER:C301(CODE_GetCompilerDirectives; $7)
C_POINTER:C301(CODE_GetCompilerDirectives; $8)
C_POINTER:C301(CODE_GetCompilerDirectives; $9)
C_POINTER:C301(CODE_GetCompilerDirectives; $10)

//CODE_GetCodeCompilerDIrectives
C_TEXT:C284(CODE_GetCodeCompilerDIrectives; $1)
C_POINTER:C301(CODE_GetCodeCompilerDIrectives; $2)
C_POINTER:C301(CODE_GetCodeCompilerDIrectives; $3)
C_POINTER:C301(CODE_GetCodeCompilerDIrectives; $4)

//UTIL_ResolvePathName
C_TEXT:C284(UTIL_ResolvePathName; $0)
C_TEXT:C284(UTIL_ResolvePathName; $1)

//UTIL_isComponentInstalled
C_BOOLEAN:C305(UTIL_isComponentInstalled; $0)
C_TEXT:C284(UTIL_isComponentInstalled; $1)

//UTIL_GetDocumentNameFromPath
C_TEXT:C284(UTIL_GetDocumentNameFromPath; $0)
C_TEXT:C284(UTIL_GetDocumentNameFromPath; $1)

//UTIL_DelayTicks
C_LONGINT:C283(UTIL_DelayTicks; $1)

//CODE_GetTableInfo
C_LONGINT:C283(CODE_GetTableInfo; $0)
C_LONGINT:C283(CODE_GetTableInfo; $1)
C_LONGINT:C283(CODE_GetTableInfo; $2)
C_LONGINT:C283(CODE_GetTableInfo; $3)
C_POINTER:C301(CODE_GetTableInfo; $4)
C_POINTER:C301(CODE_GetTableInfo; $5)
C_POINTER:C301(CODE_GetTableInfo; $6)
C_POINTER:C301(CODE_GetTableInfo; $7)
C_POINTER:C301(CODE_GetTableInfo; $8)
C_POINTER:C301(CODE_GetTableInfo; $9)
C_POINTER:C301(CODE_GetTableInfo; $10)

//CODE_GetDatabaseSetting
C_LONGINT:C283(CODE_GetDatabaseSetting; $0)
C_LONGINT:C283(CODE_GetDatabaseSetting; $1)
C_POINTER:C301(CODE_GetDatabaseSetting; $2)
C_LONGINT:C283(CODE_GetDatabaseSetting; $3)

//CODE_GetLocalization
C_POINTER:C301(CODE_GetLocalization; $1)
C_POINTER:C301(CODE_GetLocalization; $2)
C_POINTER:C301(CODE_GetLocalization; $3)
C_POINTER:C301(CODE_GetLocalization; $4)

//CODE_IgnoreMethods
C_POINTER:C301(CODE_IgnoreMethods; $1)

//CODE_GetFormObjects
C_TEXT:C284(CODE_GetFormObjects; $1)
C_LONGINT:C283(CODE_GetFormObjects; $2)
C_POINTER:C301(CODE_GetFormObjects; $3)

//DA_UpdateStatus
C_TEXT:C284(DA_UpdateStatus; $1)
C_LONGINT:C283(DA_UpdateStatus; $2)
C_BOOLEAN:C305(DA_UpdateStatus; $3)
C_TEXT:C284(DA_UpdateStatus; $4)
C_TEXT:C284(DA_UpdateStatus; $5)
C_DATE:C307(DA_UpdateStatus; $6)
C_TIME:C306(DA_UpdateStatus; $7)

//Data_GenericTriggerOnSaveRecord
C_LONGINT:C283(Data_GenericTriggerOnSaveRecord; $1)
C_LONGINT:C283(Data_GenericTriggerOnSaveRecord; $2)
C_LONGINT:C283(Data_GenericTriggerOnSaveRecord; $3)
C_POINTER:C301(Data_GenericTriggerOnSaveRecord; $4)

//DB_HasTableHistory
C_BOOLEAN:C305(DB_HasTableHistory; $0)
C_LONGINT:C283(DB_HasTableHistory; $1)

//UTIL_isUUIDNil
C_BOOLEAN:C305(UTIL_isUUIDNil; $0)
C_TEXT:C284(UTIL_isUUIDNil; $1)

//LB_GetRGB
C_LONGINT:C283(LB_GetRGB; $1)
C_POINTER:C301(LB_GetRGB; $2)
C_POINTER:C301(LB_GetRGB; $3)
C_POINTER:C301(LB_GetRGB; $4)

//QR_GetTimeData
C_TIME:C306(QR_GetTimeData; $0)
C_TEXT:C284(QR_GetTimeData; $1)
C_LONGINT:C283(QR_GetTimeData; $2)

//LBi_GetPtrtime
C_POINTER:C301(LBi_GetPtrtime; $0)
C_TEXT:C284(LBi_GetPtrtime; $1)
C_LONGINT:C283(LBi_GetPtrtime; $2)

//LBI_arrayDefTime
C_LONGINT:C283(LBI_arrayDefTime; $1)

//HEAD_getLevelDown
C_LONGINT:C283(HEAD_getLevelDown; $1)
C_TEXT:C284(HEAD_getLevelDown; $2)

//BankStatementIN_LP
C_LONGINT:C283(BankStatementIN_LP; $1)

//DB_UpdateScreenInfo
C_LONGINT:C283(DB_UpdateScreenInfo; $1)
C_TEXT:C284(DB_UpdateScreenInfo; $2)

//DB_GetBaseCurrency
C_TEXT:C284(DB_GetBaseCurrency; $0)

//ACC_ConvertValues
C_TEXT:C284(ACC_ConvertValues; $1)
C_POINTER:C301(ACC_ConvertValues; $2)
C_POINTER:C301(ACC_ConvertValues; $3)
C_POINTER:C301(ACC_ConvertValues; $4)
C_POINTER:C301(ACC_ConvertValues; $5)

//ACC_GetReconciledBalances
C_POINTER:C301(ACC_GetReconciledBalances; $1)
C_POINTER:C301(ACC_GetReconciledBalances; $2)
C_POINTER:C301(ACC_GetReconciledBalances; $3)
C_POINTER:C301(ACC_GetReconciledBalances; $4)
C_POINTER:C301(ACC_GetReconciledBalances; $5)

//ACC_getCurrencyRate
C_TEXT:C284(ACC_getCurrencyRate; $1)
C_TEXT:C284(ACC_getCurrencyRate; $2)
C_LONGINT:C283(ACC_getCurrencyRate; $3)

//DB_SetOutputFiltersTrial
C_BOOLEAN:C305(DB_SetOutputFiltersTrial; $1)
C_LONGINT:C283(DB_SetOutputFiltersTrial; $2)
C_LONGINT:C283(DB_SetOutputFiltersTrial; $3)
C_LONGINT:C283(DB_SetOutputFiltersTrial; $4)
C_LONGINT:C283(DB_SetOutputFiltersTrial; $5)
C_LONGINT:C283(DB_SetOutputFiltersTrial; $6)
C_LONGINT:C283(DB_SetOutputFiltersTrial; $7)
C_LONGINT:C283(DB_SetOutputFiltersTrial; $8)

//LB_SetupListboxByObjectName
C_TEXT:C284(LB_SetupListboxByObjectName; $1)
C_TEXT:C284(LB_SetupListboxByObjectName; $2)
C_TEXT:C284(LB_SetupListboxByObjectName; $3)
C_LONGINT:C283(LB_SetupListboxByObjectName; $4)
C_POINTER:C301(LB_SetupListboxByObjectName; $5)
C_POINTER:C301(LB_SetupListboxByObjectName; $6)
C_POINTER:C301(LB_SetupListboxByObjectName; $7)
C_POINTER:C301(LB_SetupListboxByObjectName; $8)

//LB_SetColumnHeadersByObjectName
C_LONGINT:C283(LB_SetColumnHeadersByObjectName; $0)
C_TEXT:C284(LB_SetColumnHeadersByObjectName; $1)
C_TEXT:C284(LB_SetColumnHeadersByObjectName; $2)
C_LONGINT:C283(LB_SetColumnHeadersByObjectName; $3)
C_TEXT:C284(LB_SetColumnHeadersByObjectName; $4)
C_TEXT:C284(LB_SetColumnHeadersByObjectName; $5)
C_TEXT:C284(LB_SetColumnHeadersByObjectName; $6)
C_TEXT:C284(LB_SetColumnHeadersByObjectName; $7)

//LB_SetEnterablebyObjectName
C_TEXT:C284(LB_SetEnterablebyObjectName; $1)
C_BOOLEAN:C305(LB_SetEnterablebyObjectName; $2)
C_LONGINT:C283(LB_SetEnterablebyObjectName; $3)
C_TEXT:C284(LB_SetEnterablebyObjectName; $4)

//LB_SetColumnWIdthsByObjectName
C_LONGINT:C283(LB_SetColumnWIdthsByObjectName; $0)
C_TEXT:C284(LB_SetColumnWIdthsByObjectName; $1)
C_TEXT:C284(LB_SetColumnWIdthsByObjectName; $2)
C_LONGINT:C283(LB_SetColumnWIdthsByObjectName; $3)
C_REAL:C285(LB_SetColumnWIdthsByObjectName; $4)
C_REAL:C285(LB_SetColumnWIdthsByObjectName; $5)
C_REAL:C285(LB_SetColumnWIdthsByObjectName; $6)
C_REAL:C285(LB_SetColumnWIdthsByObjectName; $7)

//LB_SetScrollByObjectName
C_TEXT:C284(LB_SetScrollByObjectName; $1)
C_LONGINT:C283(LB_SetScrollByObjectName; $2)
C_LONGINT:C283(LB_SetScrollByObjectName; $3)

//LB_StyleSettingsByObjectName
C_TEXT:C284(LB_StyleSettingsByObjectName; $1)
C_TEXT:C284(LB_StyleSettingsByObjectName; $2)
C_LONGINT:C283(LB_StyleSettingsByObjectName; $3)
C_TEXT:C284(LB_StyleSettingsByObjectName; $4)
C_POINTER:C301(LB_StyleSettingsByObjectName; $5)
C_LONGINT:C283(LB_StyleSettingsByObjectName; $6)
C_TEXT:C284(LB_StyleSettingsByObjectName; $7)
C_LONGINT:C283(LB_StyleSettingsByObjectName; $8)

//LB_SetDividersByObjectName
C_TEXT:C284(LB_SetDividersByObjectName; $1)
C_LONGINT:C283(LB_SetDividersByObjectName; $2)
C_LONGINT:C283(LB_SetDividersByObjectName; $3)

//LB_SetColorsByObjectName
C_TEXT:C284(LB_SetColorsByObjectName; $1)
C_LONGINT:C283(LB_SetColorsByObjectName; $2)
C_LONGINT:C283(LB_SetColorsByObjectName; $3)
C_LONGINT:C283(LB_SetColorsByObjectName; $4)

//LB_SetFontByObjectName
C_TEXT:C284(LB_SetFontByObjectName; $1)
C_TEXT:C284(LB_SetFontByObjectName; $2)
C_LONGINT:C283(LB_SetFontByObjectName; $3)
C_TEXT:C284(LB_SetFontByObjectName; $4)
C_LONGINT:C283(LB_SetFontByObjectName; $5)
C_LONGINT:C283(LB_SetFontByObjectName; $6)
C_LONGINT:C283(LB_SetFontByObjectName; $7)
C_LONGINT:C283(LB_SetFontByObjectName; $8)
C_TEXT:C284(LB_SetFontByObjectName; $9)

//LB_SetFontSizebyObjectName
C_TEXT:C284(LB_SetFontSizebyObjectName; $1)
C_TEXT:C284(LB_SetFontSizebyObjectName; $2)
C_LONGINT:C283(LB_SetFontSizebyObjectName; $3)
C_LONGINT:C283(LB_SetFontSizebyObjectName; $4)
C_LONGINT:C283(LB_SetFontSizebyObjectName; $5)
C_LONGINT:C283(LB_SetFontSizebyObjectName; $6)

//LB_SetFontStyleByObjectName
C_TEXT:C284(LB_SetFontStyleByObjectName; $1)
C_TEXT:C284(LB_SetFontStyleByObjectName; $2)
C_LONGINT:C283(LB_SetFontStyleByObjectName; $3)
C_LONGINT:C283(LB_SetFontStyleByObjectName; $4)
C_LONGINT:C283(LB_SetFontStyleByObjectName; $5)
C_LONGINT:C283(LB_SetFontStyleByObjectName; $6)

//LAY_FilterRadioButtons
C_POINTER:C301(LAY_FilterRadioButtons; $1)
C_POINTER:C301(LAY_FilterRadioButtons; $2)

//LAY_ComboBoxCode
C_LONGINT:C283(LAY_ComboBoxCode; $1)
C_POINTER:C301(LAY_ComboBoxCode; $2)

//LB_GetTotalColumnWIdths
C_LONGINT:C283(LB_GetTotalColumnWIdths; $0)
C_TEXT:C284(LB_GetTotalColumnWIdths; $1)
C_POINTER:C301(LB_GetTotalColumnWIdths; $2)

//DB_SetFormHeaderButtons
C_BOOLEAN:C305(DB_SetFormHeaderButtons; $1)

//DB_FieldHasSearch
C_BOOLEAN:C305(DB_FieldHasSearch; $0)
C_LONGINT:C283(DB_FieldHasSearch; $1)
C_REAL:C285(DB_FieldHasSearch; $2)

//DB_FieldHasFilter
C_BOOLEAN:C305(DB_FieldHasFilter; $0)
C_LONGINT:C283(DB_FieldHasFilter; $1)
C_LONGINT:C283(DB_FieldHasFilter; $2)

//TREND_Sql_Builder
C_TEXT:C284(TREND_Sql_Builder; $0)
C_TEXT:C284(TREND_Sql_Builder; $1)
C_POINTER:C301(TREND_Sql_Builder; $2)
C_POINTER:C301(TREND_Sql_Builder; $3)
C_POINTER:C301(TREND_Sql_Builder; $4)
C_POINTER:C301(TREND_Sql_Builder; $5)
C_POINTER:C301(TREND_Sql_Builder; $6)
C_POINTER:C301(TREND_Sql_Builder; $7)

//Trend_GetSQLlogin
C_TEXT:C284(Trend_GetSQLlogin; $1)
C_POINTER:C301(Trend_GetSQLlogin; $2)
C_POINTER:C301(Trend_GetSQLlogin; $3)
C_POINTER:C301(Trend_GetSQLlogin; $4)

//TREND_SQLgetData
C_TEXT:C284(TREND_SQLgetData; $1)
C_POINTER:C301(TREND_SQLgetData; $2)
C_POINTER:C301(TREND_SQLgetData; $3)
C_POINTER:C301(TREND_SQLgetData; $4)
C_TEXT:C284(TREND_SQLgetData; $5)

//SD2_GetRecordData
C_OBJECT:C1216(SD2_GetRecordData; $0)
C_LONGINT:C283(SD2_GetRecordData; $1)

//TREND_GetStockists
C_TEXT:C284(TREND_GetStockists; $0)
C_LONGINT:C283(TREND_GetStockists; $1)
C_TEXT:C284(TREND_GetStockists; $2)
C_POINTER:C301(TREND_GetStockists; $3)
C_POINTER:C301(TREND_GetStockists; $4)
C_POINTER:C301(TREND_GetStockists; $5)
C_POINTER:C301(TREND_GetStockists; $6)

//SD2_SetResultDialog
C_TEXT:C284(SD2_SetResultDialog; $0)
C_TEXT:C284(SD2_SetResultDialog; $1)

//SD2_ActionFields
C_LONGINT:C283(SD2_ActionFields; $0)
C_POINTER:C301(SD2_ActionFields; $1)
C_POINTER:C301(SD2_ActionFields; $2)
C_POINTER:C301(SD2_ActionFields; $3)
C_POINTER:C301(SD2_ActionFields; $4)

//UTIL_SmartConstructAddress
C_TEXT:C284(UTIL_SmartConstructAddress; $1)
C_TEXT:C284(UTIL_SmartConstructAddress; $2)
C_TEXT:C284(UTIL_SmartConstructAddress; $3)
C_TEXT:C284(UTIL_SmartConstructAddress; $4)
C_TEXT:C284(UTIL_SmartConstructAddress; $5)
C_TEXT:C284(UTIL_SmartConstructAddress; $6)
C_TEXT:C284(UTIL_SmartConstructAddress; $7)
C_TEXT:C284(UTIL_SmartConstructAddress; $8)
C_POINTER:C301(UTIL_SmartConstructAddress; $9)
C_POINTER:C301(UTIL_SmartConstructAddress; $10)
C_POINTER:C301(UTIL_SmartConstructAddress; $11)
C_POINTER:C301(UTIL_SmartConstructAddress; $12)
C_POINTER:C301(UTIL_SmartConstructAddress; $13)
C_POINTER:C301(UTIL_SmartConstructAddress; $14)
C_POINTER:C301(UTIL_SmartConstructAddress; $15)
C_POINTER:C301(UTIL_SmartConstructAddress; $16)

//WF_CreateMacroSearch
C_TEXT:C284(WF_CreateMacroSearch; $0)
C_TEXT:C284(WF_CreateMacroSearch; $1)

//WF_LaunchWorkflowAction
C_TEXT:C284(WF_LaunchWorkflowAction; $1)
C_REAL:C285(WF_LaunchWorkflowAction; $2)

//WF_LaunchCompanionWindow
C_LONGINT:C283(WF_LaunchCompanionWindow; $1)
C_TEXT:C284(WF_LaunchCompanionWindow; $2)

//TREND_SQL_GetDataToArrays
C_TEXT:C284(TREND_SQL_GetDataToArrays; $1)
C_OBJECT:C1216(TREND_SQL_GetDataToArrays; $2)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $3)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $4)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $5)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $6)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $7)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $8)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $9)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $10)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $11)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $12)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $13)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $14)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $15)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $16)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $17)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $18)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $19)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $20)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $21)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $22)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $23)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $24)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $25)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $26)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $27)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $28)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $29)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $30)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $31)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $32)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $33)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $34)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $35)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $36)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $37)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $38)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $39)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $40)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $41)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $42)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $43)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $44)
C_POINTER:C301(TREND_SQL_GetDataToArrays; $45)

//TREND_SQLBuildReplacements
C_OBJECT:C1216(TREND_SQLBuildReplacements; $0)
C_TEXT:C284(TREND_SQLBuildReplacements; $1)
C_TEXT:C284(TREND_SQLBuildReplacements; $2)
C_TEXT:C284(TREND_SQLBuildReplacements; $3)
C_TEXT:C284(TREND_SQLBuildReplacements; $4)

//DB_LoadProductCodePreferences
C_BOOLEAN:C305(DB_LoadProductCodePreferences; $1)
C_LONGINT:C283(DB_LoadProductCodePreferences; $2)

//DB_GetProductGroupBrand
C_BOOLEAN:C305(DB_GetProductGroupBrand; $0)

//DB_Get_ProductBrandPref
C_BOOLEAN:C305(DB_Get_ProductBrandPref; $0)

//DB_SaveProductCodePreferences
C_BOOLEAN:C305(DB_SaveProductCodePreferences; $1)

//SD2_GetAttributeAction
C_TEXT:C284(SD2_GetAttributeAction; $1)
C_TEXT:C284(SD2_GetAttributeAction; $2)
C_POINTER:C301(SD2_GetAttributeAction; $3)

//GEN_setBit
C_POINTER:C301(GEN_setBit; $1)
C_LONGINT:C283(GEN_setBit; $2)

//Get_Bit
C_BOOLEAN:C305(Get_Bit; $0)
C_LONGINT:C283(Get_Bit; $1)
C_LONGINT:C283(Get_Bit; $2)

//SD3_GetThreadtoObject
C_LONGINT:C283(SD3_GetThreadtoObject; $1)
C_LONGINT:C283(SD3_GetThreadtoObject; $2)

//SD3_SetDiaryRelationsArray
C_BOOLEAN:C305(SD3_SetDiaryRelationsArray; $1)
C_POINTER:C301(SD3_SetDiaryRelationsArray; $2)
C_POINTER:C301(SD3_SetDiaryRelationsArray; $3)
C_POINTER:C301(SD3_SetDiaryRelationsArray; $4)
C_POINTER:C301(SD3_SetDiaryRelationsArray; $5)
C_POINTER:C301(SD3_SetDiaryRelationsArray; $6)
C_POINTER:C301(SD3_SetDiaryRelationsArray; $7)
C_POINTER:C301(SD3_SetDiaryRelationsArray; $8)
C_POINTER:C301(SD3_SetDiaryRelationsArray; $9)
C_POINTER:C301(SD3_SetDiaryRelationsArray; $10)
C_POINTER:C301(SD3_SetDiaryRelationsArray; $11)

//SD3_GetRelationRestrictions
C_BOOLEAN:C305(SD3_GetRelationRestrictions; $0)
C_POINTER:C301(SD3_GetRelationRestrictions; $1)
C_POINTER:C301(SD3_GetRelationRestrictions; $2)
C_POINTER:C301(SD3_GetRelationRestrictions; $3)
C_POINTER:C301(SD3_GetRelationRestrictions; $4)
C_POINTER:C301(SD3_GetRelationRestrictions; $5)
C_POINTER:C301(SD3_GetRelationRestrictions; $6)
C_POINTER:C301(SD3_GetRelationRestrictions; $7)

//SD2_GetAttributeValue
C_POINTER:C301(SD2_GetAttributeValue; $1)
C_TEXT:C284(SD2_GetAttributeValue; $2)
C_POINTER:C301(SD2_GetAttributeValue; $3)

//SD_SetDiaryDateTime
C_POINTER:C301(SD_SetDiaryDateTime; $1)

//DB_LoadJobBillingPreferences
C_BOOLEAN:C305(DB_LoadJobBillingPreferences; $1)
C_BOOLEAN:C305(DB_LoadJobBillingPreferences; $2)
C_LONGINT:C283(DB_LoadJobBillingPreferences; $3)

//SD3_GetContexts
C_POINTER:C301(SD3_GetContexts; $1)
C_POINTER:C301(SD3_GetContexts; $2)
C_POINTER:C301(SD3_GetContexts; $3)
C_POINTER:C301(SD3_GetContexts; $4)
C_POINTER:C301(SD3_GetContexts; $5)

//DB_FixMethods2019GetHeader
C_TEXT:C284(DB_FixMethods2019GetHeader; $1)
C_POINTER:C301(DB_FixMethods2019GetHeader; $2)
C_POINTER:C301(DB_FixMethods2019GetHeader; $3)
C_POINTER:C301(DB_FixMethods2019GetHeader; $4)

//LOC_SUbLevelInformation
C_LONGINT:C283(LOC_SUbLevelInformation; $1)
C_LONGINT:C283(LOC_SUbLevelInformation; $2)

//LOC_LocationsLBCode
C_LONGINT:C283(LOC_LocationsLBCode; $1)
C_LONGINT:C283(LOC_LocationsLBCode; $2)

//SD3_ServerSideDiaryManager
C_OBJECT:C1216(SD3_ServerSideDiaryManager; $1)

//SD_SendtoWorflow
C_OBJECT:C1216(SD_SendtoWorflow; $0)
C_TEXT:C284(SD_SendtoWorflow; $1)
C_TEXT:C284(SD_SendtoWorflow; $2)
C_BOOLEAN:C305(SD_SendtoWorflow; $3)

//SD3_MatchDiaryProperties
C_BOOLEAN:C305(SD3_MatchDiaryProperties; $0)
C_POINTER:C301(SD3_MatchDiaryProperties; $1)
C_TEXT:C284(SD3_MatchDiaryProperties; $2)
C_POINTER:C301(SD3_MatchDiaryProperties; $3)

//SD3_DiaryRecordToObject
C_TEXT:C284(SD3_DiaryRecordToObject; $1)

//SD3_FindDiaryRecordsByAttribute
C_POINTER:C301(SD3_FindDiaryRecordsByAttribute; $1)

//SD3_ClientSubscribe
C_LONGINT:C283(SD3_ClientSubscribe; $1)
C_TEXT:C284(SD3_ClientSubscribe; $2)
C_LONGINT:C283(SD3_ClientSubscribe; $3)
C_OBJECT:C1216(SD3_ClientSubscribe; $4)

//SD3_CompareObjects
C_BOOLEAN:C305(SD3_CompareObjects; $0)
C_OBJECT:C1216(SD3_CompareObjects; $1)
C_OBJECT:C1216(SD3_CompareObjects; $2)

//WF_UpdateWorkflowWindow
C_OBJECT:C1216(WF_UpdateWorkflowWindow; $1)

//SD3_ObjectStringtoDate
C_DATE:C307(SD3_ObjectStringtoDate; $0)
C_TEXT:C284(SD3_ObjectStringtoDate; $1)

//SD3_ObjectRealtoTime
C_TIME:C306(SD3_ObjectRealtoTime; $0)
C_LONGINT:C283(SD3_ObjectRealtoTime; $1)

//DB_UserHas4DWriteAccess
C_BOOLEAN:C305(DB_UserHas4DWriteAccess; $0)

//DIARY_in_SetObjectPositions
C_LONGINT:C283(DIARY_in_SetObjectPositions; $1)
C_TEXT:C284(DIARY_in_SetObjectPositions; $2)

//DB_SetOutFIlterDiaryActions
C_LONGINT:C283(DB_SetOutFIlterDiaryActions; $0)
C_POINTER:C301(DB_SetOutFIlterDiaryActions; $1)
C_POINTER:C301(DB_SetOutFIlterDiaryActions; $2)
C_POINTER:C301(DB_SetOutFIlterDiaryActions; $3)
C_POINTER:C301(DB_SetOutFIlterDiaryActions; $4)
C_POINTER:C301(DB_SetOutFIlterDiaryActions; $5)
C_POINTER:C301(DB_SetOutFIlterDiaryActions; $6)
C_POINTER:C301(DB_SetOutFIlterDiaryActions; $7)
C_POINTER:C301(DB_SetOutFIlterDiaryActions; $8)
C_POINTER:C301(DB_SetOutFIlterDiaryActions; $9)
C_POINTER:C301(DB_SetOutFIlterDiaryActions; $10)
C_POINTER:C301(DB_SetOutFIlterDiaryActions; $11)

//DB_GetActionsUsed
C_LONGINT:C283(DB_GetActionsUsed; $1)

//DB_SetOutFIlterDiaryResults
C_LONGINT:C283(DB_SetOutFIlterDiaryResults; $0)
C_POINTER:C301(DB_SetOutFIlterDiaryResults; $1)
C_POINTER:C301(DB_SetOutFIlterDiaryResults; $2)
C_POINTER:C301(DB_SetOutFIlterDiaryResults; $3)
C_POINTER:C301(DB_SetOutFIlterDiaryResults; $4)
C_POINTER:C301(DB_SetOutFIlterDiaryResults; $5)
C_POINTER:C301(DB_SetOutFIlterDiaryResults; $6)
C_POINTER:C301(DB_SetOutFIlterDiaryResults; $7)
C_POINTER:C301(DB_SetOutFIlterDiaryResults; $8)
C_POINTER:C301(DB_SetOutFIlterDiaryResults; $9)
C_POINTER:C301(DB_SetOutFIlterDiaryResults; $10)
C_POINTER:C301(DB_SetOutFIlterDiaryResults; $11)

//DB_GetResultsUsed
C_LONGINT:C283(DB_GetResultsUsed; $1)

//SD3_GetAvailableResults
C_TEXT:C284(SD3_GetAvailableResults; $1)
C_POINTER:C301(SD3_GetAvailableResults; $2)
C_POINTER:C301(SD3_GetAvailableResults; $3)
C_POINTER:C301(SD3_GetAvailableResults; $4)

//Get_PlatformProperty
C_TEXT:C284(Get_PlatformProperty; $1)
C_POINTER:C301(Get_PlatformProperty; $2)

//CAMP_DOTMAILERCONNECT
C_TEXT:C284(CAMP_DOTMAILERCONNECT; $0)

//CAMP_LoadDotMailerPrefs
C_POINTER:C301(CAMP_LoadDotMailerPrefs; $1)
C_POINTER:C301(CAMP_LoadDotMailerPrefs; $2)
C_BOOLEAN:C305(CAMP_LoadDotMailerPrefs; $3)

//CAMP_SaveDotMailerPrefs
C_POINTER:C301(CAMP_SaveDotMailerPrefs; $1)
C_POINTER:C301(CAMP_SaveDotMailerPrefs; $2)

//Camp_LoadDotMailerAccount
C_LONGINT:C283(Camp_LoadDotMailerAccount; $0)
C_REAL:C285(Camp_LoadDotMailerAccount; $1)
C_BOOLEAN:C305(Camp_LoadDotMailerAccount; $2)
C_BOOLEAN:C305(Camp_LoadDotMailerAccount; $3)

//ASTERISX_TESTREPORTS
C_POINTER:C301(ASTERISX_TESTREPORTS; $1)
C_POINTER:C301(ASTERISX_TESTREPORTS; $2)
C_BOOLEAN:C305(ASTERISX_TESTREPORTS; $3)

//CRM_ASTERISKPREFERENCES
C_POINTER:C301(CRM_ASTERISKPREFERENCES; $1)
C_POINTER:C301(CRM_ASTERISKPREFERENCES; $2)
C_BOOLEAN:C305(CRM_ASTERISKPREFERENCES; $3)

//Util_DateTimeSplit
C_TEXT:C284(Util_DateTimeSplit; $1)
C_POINTER:C301(Util_DateTimeSplit; $2)
C_POINTER:C301(Util_DateTimeSplit; $3)

//SCRIPT_Parse
C_TEXT:C284(SCRIPT_Parse; $0)
C_TEXT:C284(SCRIPT_Parse; $1)

//DB_DataCheckSubtableUnique
C_REAL:C285(DB_DataCheckSubtableUnique; $2)

//Period_FindI
C_VARIANT:C1683(Period_FindI; $0)
C_DATE:C307(Period_FindI; $1)

//Remote_ImShow2
C_POINTER:C301(Remote_ImShow2; $9)

//STK_b_ShowCSBySI
C_LONGINT:C283(STK_b_ShowCSBySI; $1)
C_LONGINT:C283(STK_b_ShowCSBySI; $2)
C_LONGINT:C283(STK_b_ShowCSBySI; $3)

//SCPT_XL_setup_get_b_and_w
C_BOOLEAN:C305(SCPT_XL_setup_get_b_and_w; $0)
C_TEXT:C284(SCPT_XL_setup_get_b_and_w; $1)
C_TEXT:C284(SCPT_XL_setup_get_b_and_w; $2)

//SCPT_XL_setup_set_b_and_w
C_TEXT:C284(SCPT_XL_setup_set_b_and_w; $1)
C_TEXT:C284(SCPT_XL_setup_set_b_and_w; $2)
C_BOOLEAN:C305(SCPT_XL_setup_set_b_and_w; $3)

//AA_Junk
C_PICTURE:C286(AA_Junk; $0)
C_POINTER:C301(AA_Junk; $1)
C_POINTER:C301(AA_Junk; $2)
C_POINTER:C301(AA_Junk; $3)

//CODE_SIMREPORT
C_TEXT:C284(CODE_SIMREPORT; $1)
C_TEXT:C284(CODE_SIMREPORT; $2)
C_POINTER:C301(CODE_SIMREPORT; $3)
C_POINTER:C301(CODE_SIMREPORT; $4)

//LOG_SimpleLog
C_TEXT:C284(LOG_SimpleLog; $1)
C_TEXT:C284(LOG_SimpleLog; $2)
C_LONGINT:C283(LOG_SimpleLog; $3)
C_OBJECT:C1216(LOG_SimpleLog; $4)
C_TEXT:C284(LOG_SimpleLog; $5)
C_TEXT:C284(LOG_SimpleLog; $6)
C_REAL:C285(LOG_SimpleLog; $7)
C_TEXT:C284(LOG_SimpleLog; $8)
C_LONGINT:C283(LOG_SimpleLog; $9)
C_LONGINT:C283(LOG_SimpleLog; $10)
C_LONGINT:C283(LOG_SimpleLog; $11)
C_LONGINT:C283(LOG_SimpleLog; $12)
C_LONGINT:C283(LOG_SimpleLog; $13)

//UTIL_4DColorToRGB
C_TEXT:C284(UTIL_4DColorToRGB; $0)
C_LONGINT:C283(UTIL_4DColorToRGB; $1)

//AA_Junk_CalcNumber
C_LONGINT:C283(AA_Junk_CalcNumber; $1)
C_POINTER:C301(AA_Junk_CalcNumber; $2)
C_POINTER:C301(AA_Junk_CalcNumber; $3)

//UTIL_setObjectByColour
C_LONGINT:C283(UTIL_setObjectByColour; $1)
C_TEXT:C284(UTIL_setObjectByColour; $2)
C_LONGINT:C283(UTIL_setObjectByColour; $3)

//ACC_DisplayBalances
C_TEXT:C284(ACC_DisplayBalances; $1)
C_TEXT:C284(ACC_DisplayBalances; $2)

//CON_BuildContactName
C_TEXT:C284(CON_BuildContactName; $0)
C_TEXT:C284(CON_BuildContactName; $1)
C_TEXT:C284(CON_BuildContactName; $2)
C_TEXT:C284(CON_BuildContactName; $3)

//CON_BuildContactNameandJobTitle
C_TEXT:C284(CON_BuildContactNameandJobTitle; $0)

//ContComp SubLP
C_POINTER:C301(ContComp_SubLP; $1)

//DB_Macintosh
C_BOOLEAN:C305(DB_Macintosh; $0)

//DB_Process Number
C_REAL:C285(DB_Process_Number; $0)
C_TEXT:C284(DB_Process_Number; $1)

//DB_Process Started
C_BOOLEAN:C305(DB_Process_Started; $0)
C_TEXT:C284(DB_Process_Started; $1)
C_LONGINT:C283(DB_Process_Started; $2)
C_TEXT:C284(DB_Process_Started; $3)

//DB_Windows
C_BOOLEAN:C305(DB_Windows; $0)

//DOC_SetWriteModifiable
C_OBJECT:C1216(DOC_SetWriteModifiable; $4)
C_OBJECT:C1216(DOC_SetWriteModifiable; $5)

//Email Attachment From Server
C_TEXT:C284(Email_Attachment_From_Server; $0)
C_TEXT:C284(Email_Attachment_From_Server; $1)
C_TEXT:C284(Email_Attachment_From_Server; $2)

//EMAIL ON OUTSIDE CALL
C_BOOLEAN:C305(EMAIL_ON_OUTSIDE_CALL; $1)

//Get Email Owner
C_TEXT:C284(Get_Email_Owner; $0)

//Groups Mod
C_TEXT:C284(Groups_Mod; $1)
C_TEXT:C284(Groups_Mod; $2)

//JobsTC JobCheck
C_POINTER:C301(JobsTC_JobCheck; $1)
C_BOOLEAN:C305(JobsTC_JobCheck; $2)

//Movements File
C_BOOLEAN:C305(Movements_File; $0)

//MoveType No_OLDSTYLE
C_TEXT:C284(MoveType No_OLDSTYLE; $0)

//MovementTypes_No
C_TEXT:C284(MovementTypes_No; $3)
C_TEXT:C284(MovementTypes_No; $4)

//Periods ConvCal
C_TEXT:C284(Periods_ConvCal; $0)
C_TEXT:C284(Periods_ConvCal; $1)

//Picture Dialog
C_TEXT:C284(Picture_Dialog; $1)
C_TEXT:C284(Picture_Dialog; $2)
C_TEXT:C284(Picture_Dialog; $3)
C_TEXT:C284(Picture_Dialog; $4)

//PuOItems InLPX
C_POINTER:C301(PuOItems_InLPX; $1)

//SD_Diary CalM
C_TEXT:C284(SD_Diary_CalM; $1)
C_TEXT:C284(SD_Diary_CalM; $2)
C_TEXT:C284(SD_Diary_CalM; $3)

//SelOr 1
C_POINTER:C301(SelOr_1; $1)

//SelOr 2
C_POINTER:C301(SelOr_2; $1)

//SelOr 3
C_POINTER:C301(SelOr_3; $1)

//Set Fonts
C_TEXT:C284(Set_Fonts; $1)
C_LONGINT:C283(Set_Fonts; $2)

//Set FontsFS
C_TEXT:C284(Set_FontsFS; $1)
C_TEXT:C284(Set_FontsFS; $2)
C_LONGINT:C283(Set_FontsFS; $3)

//Start ProcCount
C_TEXT:C284(Start_ProcCount; $1)

//Text Expand
C_POINTER:C301(Text_Expand; $1)
C_TEXT:C284(Text_Expand; $2)
C_BOOLEAN:C305(Text_Expand; $3)

//Time vButton
C_POINTER:C301(Time_vButton; $1)
C_LONGINT:C283(Time_vButton; $2)

//Userset Empty
C_POINTER:C301(Userset_Empty; $1)

//Year Close2
C_DATE:C307(Year_Close2; $1)

//SD2_Actions Mod
C_TEXT:C284(SD2_Actions_Mod; $1)
C_TEXT:C284(SD2_Actions_Mod; $2)

//Reports_prefsLoad
C_POINTER:C301(Reports_prefsLoad; $2)
C_POINTER:C301(Reports_prefsLoad; $3)
C_POINTER:C301(Reports_prefsLoad; $4)
C_POINTER:C301(Reports_prefsLoad; $5)
C_POINTER:C301(Reports_prefsLoad; $6)
C_POINTER:C301(Reports_prefsLoad; $7)
C_POINTER:C301(Reports_prefsLoad; $8)
C_POINTER:C301(Reports_prefsLoad; $9)
C_POINTER:C301(Reports_prefsLoad; $10)
C_POINTER:C301(Reports_prefsLoad; $11)
C_POINTER:C301(Reports_prefsLoad; $12)

//Reports_SetPrefInterface
C_BOOLEAN:C305(Reports_SetPrefInterface; $2)

//Set Fonts_ByPointer
C_LONGINT:C283(Set_Fonts_ByPointer; $1)

//Set FontFS_ByPointer
C_TEXT:C284(Set_FontFS_ByPointer; $1)
C_LONGINT:C283(Set_FontFS_ByPointer; $2)

//DocReportEmailResetValues
C_TEXT:C284(DocReportEmailResetValues; $1)
C_POINTER:C301(DocReportEmailResetValues; $2)
C_POINTER:C301(DocReportEmailResetValues; $3)
C_POINTER:C301(DocReportEmailResetValues; $4)
C_POINTER:C301(DocReportEmailResetValues; $5)
C_POINTER:C301(DocReportEmailResetValues; $6)
C_POINTER:C301(DocReportEmailResetValues; $7)
C_POINTER:C301(DocReportEmailResetValues; $8)
C_POINTER:C301(DocReportEmailResetValues; $9)
C_POINTER:C301(DocReportEmailResetValues; $10)
C_POINTER:C301(DocReportEmailResetValues; $11)
C_POINTER:C301(DocReportEmailResetValues; $12)

//SVS_ContractTypeLoadRules
C_OBJECT:C1216(SVS_ContractTypeLoadRules; $0)

//Per_LOADSMTPAUTH
C_POINTER:C301(Per_LOADSMTPAUTH; $2)
C_POINTER:C301(Per_LOADSMTPAUTH; $3)
C_POINTER:C301(Per_LOADSMTPAUTH; $4)
C_POINTER:C301(Per_LOADSMTPAUTH; $5)
C_POINTER:C301(Per_LOADSMTPAUTH; $6)
C_POINTER:C301(Per_LOADSMTPAUTH; $7)
C_POINTER:C301(Per_LOADSMTPAUTH; $8)
C_POINTER:C301(Per_LOADSMTPAUTH; $9)
C_POINTER:C301(Per_LOADSMTPAUTH; $10)
C_POINTER:C301(Per_LOADSMTPAUTH; $11)
C_POINTER:C301(Per_LOADSMTPAUTH; $12)

//SYS_LOADSMTPAUTH
C_POINTER:C301(SYS_LOADSMTPAUTH; $3)
C_POINTER:C301(SYS_LOADSMTPAUTH; $4)
C_POINTER:C301(SYS_LOADSMTPAUTH; $5)
C_POINTER:C301(SYS_LOADSMTPAUTH; $6)
C_POINTER:C301(SYS_LOADSMTPAUTH; $7)
C_POINTER:C301(SYS_LOADSMTPAUTH; $8)
C_POINTER:C301(SYS_LOADSMTPAUTH; $9)
C_POINTER:C301(SYS_LOADSMTPAUTH; $10)
C_POINTER:C301(SYS_LOADSMTPAUTH; $11)
C_POINTER:C301(SYS_LOADSMTPAUTH; $12)

//Reports_PrefsOpt1ObjHandler
C_TEXT:C284(Reports_PrefsOpt1ObjHandler; $1)
C_POINTER:C301(Reports_PrefsOpt1ObjHandler; $2)
C_POINTER:C301(Reports_PrefsOpt1ObjHandler; $3)
C_POINTER:C301(Reports_PrefsOpt1ObjHandler; $4)
C_POINTER:C301(Reports_PrefsOpt1ObjHandler; $5)
C_POINTER:C301(Reports_PrefsOpt1ObjHandler; $6)
C_POINTER:C301(Reports_PrefsOpt1ObjHandler; $7)
C_POINTER:C301(Reports_PrefsOpt1ObjHandler; $8)
C_POINTER:C301(Reports_PrefsOpt1ObjHandler; $9)
C_POINTER:C301(Reports_PrefsOpt1ObjHandler; $10)
C_POINTER:C301(Reports_PrefsOpt1ObjHandler; $11)
C_POINTER:C301(Reports_PrefsOpt1ObjHandler; $12)
C_POINTER:C301(Reports_PrefsOpt1ObjHandler; $13)

//Reports_PrefsSetVisibility
C_LONGINT:C283(Reports_PrefsSetVisibility; $1)
C_LONGINT:C283(Reports_PrefsSetVisibility; $2)
C_LONGINT:C283(Reports_PrefsSetVisibility; $3)

//Reports_PrefArraysToFormVars
C_LONGINT:C283(Reports_PrefArraysToFormVars; $1)

//PriceTable inLPX
C_POINTER:C301(PriceTable_inLPX; $1)

//ProdPriceTable inLPX
C_POINTER:C301(ProdPriceTable_inLPX; $1)

//Get Picture
C_PICTURE:C286(Get_Picture; $0)
C_VARIANT:C1683(Get_Picture; $1)

//DB_FixMethodDeclarations2020
C_TEXT:C284(DB_FixMethodDeclarations2020; $1)
C_TEXT:C284(DB_FixMethodDeclarations2020; $2)
C_POINTER:C301(DB_FixMethodDeclarations2020; $3)
C_POINTER:C301(DB_FixMethodDeclarations2020; $4)
C_POINTER:C301(DB_FixMethodDeclarations2020; $5)
C_POINTER:C301(DB_FixMethodDeclarations2020; $6)
C_POINTER:C301(DB_FixMethodDeclarations2020; $7)
C_POINTER:C301(DB_FixMethodDeclarations2020; $8)
C_POINTER:C301(DB_FixMethodDeclarations2020; $9)

//DB_DecodeLicence
C_TEXT:C284(DB_DecodeLicence; $1)
C_POINTER:C301(DB_DecodeLicence; $2)
C_POINTER:C301(DB_DecodeLicence; $3)
C_POINTER:C301(DB_DecodeLicence; $4)
C_POINTER:C301(DB_DecodeLicence; $5)
C_POINTER:C301(DB_DecodeLicence; $6)
C_POINTER:C301(DB_DecodeLicence; $7)
C_POINTER:C301(DB_DecodeLicence; $8)
C_POINTER:C301(DB_DecodeLicence; $9)

//UTIL_AddToAddress
C_REAL:C285(UTIL_AddToAddress; $0)
C_POINTER:C301(UTIL_AddToAddress; $1)
C_TEXT:C284(UTIL_AddToAddress; $2)
C_TEXT:C284(UTIL_AddToAddress; $3)
C_LONGINT:C283(UTIL_AddToAddress; $4)

//UTIL_GetUSState
C_TEXT:C284(UTIL_GetUSState; $0)
C_TEXT:C284(UTIL_GetUSState; $1)

//EmailValidateAddress
C_BOOLEAN:C305(EmailValidateAddress; $0)
C_TEXT:C284(EmailValidateAddress; $1)
C_POINTER:C301(EmailValidateAddress; $2)
C_POINTER:C301(EmailValidateAddress; $3)

//SYS_isUpdateDone
C_BOOLEAN:C305(SYS_isUpdateDone; $0)
C_LONGINT:C283(SYS_isUpdateDone; $1)
C_LONGINT:C283(SYS_isUpdateDone; $2)

//TYP_UpdateFlags
C_BOOLEAN:C305(TYP_UpdateFlags; $1)
C_LONGINT:C283(TYP_UpdateFlags; $2)
C_LONGINT:C283(TYP_UpdateFlags; $3)

//CON_GetAdressTypes
C_POINTER:C301(CON_GetAdressTypes; $1)

//ContactReviewAddresses
C_BOOLEAN:C305(ContactReviewAddresses; $0)
C_TEXT:C284(ContactReviewAddresses; $1)
C_TEXT:C284(ContactReviewAddresses; $2)
C_TEXT:C284(ContactReviewAddresses; $3)
C_LONGINT:C283(ContactReviewAddresses; $4)
C_LONGINT:C283(ContactReviewAddresses; $5)

//Reports_BuildArrayofElements
C_POINTER:C301(Reports_BuildArrayofElements; $1)
C_POINTER:C301(Reports_BuildArrayofElements; $2)
C_POINTER:C301(Reports_BuildArrayofElements; $3)
C_POINTER:C301(Reports_BuildArrayofElements; $4)
C_POINTER:C301(Reports_BuildArrayofElements; $5)
C_POINTER:C301(Reports_BuildArrayofElements; $6)
C_POINTER:C301(Reports_BuildArrayofElements; $7)
C_POINTER:C301(Reports_BuildArrayofElements; $8)
C_POINTER:C301(Reports_BuildArrayofElements; $9)
C_POINTER:C301(Reports_BuildArrayofElements; $10)
C_POINTER:C301(Reports_BuildArrayofElements; $11)
C_POINTER:C301(Reports_BuildArrayofElements; $12)
C_POINTER:C301(Reports_BuildArrayofElements; $13)
C_POINTER:C301(Reports_BuildArrayofElements; $14)
C_POINTER:C301(Reports_BuildArrayofElements; $15)

//Email_SendTransporter
C_TEXT:C284(Email_SendTransporter; $0)
C_OBJECT:C1216(Email_SendTransporter; $1)
C_POINTER:C301(Email_SendTransporter; $2)
C_POINTER:C301(Email_SendTransporter; $3)
C_POINTER:C301(Email_SendTransporter; $4)
C_TEXT:C284(Email_SendTransporter; $5)
C_TEXT:C284(Email_SendTransporter; $6)
C_TEXT:C284(Email_SendTransporter; $7)
C_TEXT:C284(Email_SendTransporter; $8)
C_POINTER:C301(Email_SendTransporter; $9)
C_POINTER:C301(Email_SendTransporter; $10)
C_BOOLEAN:C305(Email_SendTransporter; $11)
C_TEXT:C284(Email_SendTransporter; $12)
C_TEXT:C284(Email_SendTransporter; $13)
C_TEXT:C284(Email_SendTransporter; $14)
C_TEXT:C284(Email_SendTransporter; $15)

//EMail_Send2
C_TEXT:C284(EMail_Send2; $0)
C_POINTER:C301(EMail_Send2; $1)
C_POINTER:C301(EMail_Send2; $2)
C_POINTER:C301(EMail_Send2; $3)
C_TEXT:C284(EMail_Send2; $4)
C_TEXT:C284(EMail_Send2; $5)
C_TEXT:C284(EMail_Send2; $6)
C_TEXT:C284(EMail_Send2; $7)
C_POINTER:C301(EMail_Send2; $8)
C_POINTER:C301(EMail_Send2; $9)
C_BOOLEAN:C305(EMail_Send2; $10)
C_TEXT:C284(EMail_Send2; $11)
C_TEXT:C284(EMail_Send2; $12)
C_TEXT:C284(EMail_Send2; $13)
C_TEXT:C284(EMail_Send2; $14)

//Email_SetParameters
C_OBJECT:C1216(Email_SetParameters; $0)
C_POINTER:C301(Email_SetParameters; $1)
C_POINTER:C301(Email_SetParameters; $2)
C_POINTER:C301(Email_SetParameters; $3)
C_TEXT:C284(Email_SetParameters; $4)
C_LONGINT:C283(Email_SetParameters; $5)
C_POINTER:C301(Email_SetParameters; $6)
C_POINTER:C301(Email_SetParameters; $7)
C_BOOLEAN:C305(Email_SetParameters; $8)
C_BOOLEAN:C305(Email_SetParameters; $9)
C_TEXT:C284(Email_SetParameters; $10)
C_TEXT:C284(Email_SetParameters; $11)
C_POINTER:C301(Email_SetParameters; $12)
C_POINTER:C301(Email_SetParameters; $13)
C_POINTER:C301(Email_SetParameters; $14)
C_POINTER:C301(Email_SetParameters; $15)

//CheckMinorByObject
C_OBJECT:C1216(CheckMinorByObject; $1)

//Project_CodeUseSelection
C_OBJECT:C1216(Project_CodeUseSelection; $0)
C_OBJECT:C1216(Project_CodeUseSelection; $1)

//SQL_GetDataToObject
C_OBJECT:C1216(SQL_GetDataToObject; $1)

//SQL_LoadDataToObject
C_OBJECT:C1216(SQL_LoadDataToObject; $1)

//SQL_GetColumnNames
C_TEXT:C284(SQL_GetColumnNames; $1)
C_POINTER:C301(SQL_GetColumnNames; $2)

//UTIL_trimCollection
C_TEXT:C284(UTIL_trimCollection; $0)
C_OBJECT:C1216(UTIL_trimCollection; $1)
C_TEXT:C284(UTIL_trimCollection; $2)
C_TEXT:C284(UTIL_trimCollection; $3)

//UTIL_TrimSpaces
C_TEXT:C284(UTIL_TrimSpaces; $0)
C_OBJECT:C1216(UTIL_TrimSpaces; $1)

//EventTracker
C_LONGINT:C283(EventTracker; $1)

//Join_CodeUseSelection
C_OBJECT:C1216(Join_CodeUseSelection; $1)

//Gen_ChoicePopUpByCollection
C_OBJECT:C1216(Gen_ChoicePopUpByCollection; $1)

//Gen_FindInCollection
C_OBJECT:C1216(Gen_FindInCollection; $1)
C_OBJECT:C1216(Gen_FindInCollection; $2)

//UTIL_4DwriteEnabled
C_BOOLEAN:C305(UTIL_4DwriteEnabled; $0)

//DOc_SetWPProModiable
C_OBJECT:C1216(DOc_SetWPProModiable; $1)
C_REAL:C285(DOc_SetWPProModiable; $2)
C_BOOLEAN:C305(DOc_SetWPProModiable; $3)