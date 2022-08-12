//%attributes = {}

If (False:C215)
	//Project Method Name:      Get_Picture
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/12/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PicRef; 0)
	ARRAY TEXT:C222($_at_PicName; 0)
	C_COLLECTION:C1488($_col_IMageNames; $_Col_ImageNumbers)
	C_LONGINT:C283($_l_Index; $_l_Ref)
	C_PICTURE:C286($_pic_Picture; $0)
	C_TEXT:C284($_t_ImagePath; $_t_oldMethodName; $_t_PictureName; $_t_ResourcesFolder)
	C_VARIANT:C1683($1)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Get_Picture")
$_t_ResourcesFolder:=Get 4D folder:C485(Current resources folder:K5:16)
$_t_ImagePath:=$_t_ResourcesFolder+"Images"
$_Col_ImageNumbers:=New collection:C1472(401; 402; 403; 404; 405; 406; 407; 408; 409; 410; 411; 412; 413; 414; 415; 416; 417; 418; 805; 868; 869; 870; 871; 872; 873; 877; 879; 896; 1005; 1010; 1012; 1013; 1014; 1015; 1016; 1017; 1018; 1019; 1020; 1021; 1022; 1023; 1024; 1025; 1026; 1027; 1028; 1029; 1030; 1031; 1032; 1033; 1034; 1035; 1036; 1037; 1038; 1039; 1040; 1041; 2049; 2052; 2053; 2055; 2056; 2061; 2062; 2063; 2066; 2071; 5006; 5007; 12050)
$_Col_ImageNumbers.push(14616; 15513; 15518; 15519; 18018; 18019; 18020; 18950; 19501; 19502; 19503; 19504; 19505; 19506; 19507; 19508; 19509; 19510; 19511; 19512; 19513; 19514; 19515; 19516; 19517; 19518; 19519; 19520; 19521; 19522; 19523; 19524; 19525; 19526; 19527; 19528; 19529; 19530; 19531; 19532; 19798; 19802; 19803; 19804; 19805; 19806; 19807; 19808; 19809; 19810; 19817; 19818; 19821; 19837; 20003; 20230; 20240; 20250; 20260; 20261)
$_Col_ImageNumbers.push(22222; 22223; 22519; 22521; 22523; 22524; 22526; 22527; 22537; 22538; 22539; 22540; 22541; 22542; 22543; 22544; 22545; 22546; 22547; 22548; 22549; 22550; 22551; 22552; 22553; 22554; 22556; 22559; 22562; 22563; 22564; 22565; 22566; 22567; 22568; 22569; 22570; 22571)

$_col_IMageNames:=New collection:C1472("PICT79"; "Pict78"; "Thread_Level0"; "Thread_Level1"; "Thread_Level2"; "Thread_Level3"; "Thread_Level4"; "Thread_Level5"; "Thread_Level6"; "Thread_Level0open"; "Thread_Level1Open"; "Thread_level2Open"; "Thread_Level3Open"; "Thread_level4Open")
$_col_IMageNames.push("Thread_LEvel5Open"; "Thread_Level6Open"; "Thread_NOLEVEL"; "Info"; "PICT120"; "Untitled"; "SD2_GroupCalenders"; "SD_FilterData"; "Create Record"; "Modify Record"; "SD2_Invite"; "SD_DiaryLinks"; "CalenderButtonBigArrow"; "Pal_GoldPipeline"; "OutButtonsBlue")
$_col_IMageNames.push("OutStripBlue"; "OutStripGreen"; "OutButtonsGreen"; "OutStripWine"; "OutButtonsWine"; "OutStripTurquoise"; "OutButtonsTurquoise"; "OutButtonsSteel"; "OutStripSteel"; "OutButtonsBrown"; "OutStripBrown"; "OutStripOrange"; "OutButtonsOrange"; "OutButtonsPurple")
$_col_IMageNames.push("OutStripPurple"; "OutSortDownBlue"; "OutSortUpBlue"; "OutSortDownPurple"; "OutSortUpPurple"; "OutSortUpOrange"; "OutSortDownOrange"; "OutSortDownBrown"; "OutSortUpBrown"; "OutSortDownSteel"; "OutSortUpSteel"; "OutSortDownTurquoise"; "OutSortUpTurquoise")
$_col_IMageNames.push("OutSortDownWine"; "OutSortUpWine"; "OutSortDownGreen"; "OutSortUpGreen"; "OSX DiaryLink"; "OSX - Cancel"; "OSX - Last Record"; "OSX - Previous Record"; "OSX - Next Record"; "OSXPrint"; "OSXdiaryowners"; "OSX - First Record"; "OSX - Delete Record"; "OSX - OK")
$_col_IMageNames.push("FocusRing"; "RoundArea"; "Choose Tabs"; "Polar"; "Bar_graphic_logo"; "DB_Closed"; "DB_Open"; "New Calendar"; "Data_Listing"; "CalenderButton"; "CloseSearch"; "PaL_GOLD_Cancel"; "PAL_GOLD_OK"; "PAL_GOLD_Delete"; "PAL_GOLD_ADD"; "PAL_GOLD_REMOVE"; "PAL_GOLD_OPEN")
$_col_IMageNames.push("PAL_GOLD_PREV"; "PAL_GOLD_NEXT"; "PAL_GOLD_FIRST"; "PAL_GOLD_LAST"; "PAL_GOLD_SELECT"; "PAL_GOLD_FIND"; "PAL_GOLD_SORT"; "PAL_GOLD_SETS"; "PAL_GOLD_REPORTS"; "PAL_GOLD_GRAPH"; "PAL_GOLD_GLOBAL"; "PAL_GOLD_INFO"; "PAL_GOLD_TEL"; "PAL_GOLD_FURTHERS"; "PAL_GOLD_COMPANIESENTER")
$_col_IMageNames.push("PAL_GOLD_COMPANIESVIEW"; "PAL_GOLD_PEOPLEENTER"; "PAL_GOLD_PEOPLEVIEW"; "PAL_GOLD_PRODUCTSENTER"; "PAL_GOLD_PRODUCTSVIEW"; "PAL_GOLD_DIARYENTER"; "PAL_GOLD_DIARYVIEW"; "PAL_GOLD_QUALITIES"; "PAL_GOLD_QualFind"; "Pal_GOLD_PipeNew"; "PAL_GOLD_PipeView"; "PICT45"; "Module_Diarymanager")
$_col_IMageNames.push("Modul_WordProcessor"; "Module_SalesLedger"; "Module_PurchaseLedger"; "Module_nominalLedger"; "Module_stockControl"; "Module_ServiceControl"; "Module_JobCosting"; "Module_AgencyManger"; "Module_salesOrders"; "Module_Purchases"; "Modul_InternetAccess"; "Module_DataManager"; "Cancel3D")
$_col_IMageNames.push("Modulus Text"; "Modulus Logo Medium"; "Modulus Logo Small"; "Editable"; "Selectable"; "ArrowUp"; "ArrowDown"; "MagnifyingGlass"; ""; "SD2_DiaryHistory"; "SD2_Viewworkflow"; "SD2_Synch"; "SD2_Gotodate"; "SD2_Configure"; "QuestionMark"; "CalendatMDButton"; "upanddown"; "down"; "PAL_Small_Add")
$_col_IMageNames.push("PAL_Small_Del"; "PAL_Small_Config"; "PAL_Small_tools"; "Pal_LargeTools"; "Smartlist"; "QueryList"; "StaticList"; "SetFunctions"; "GroupedList"; "Space"; "BigClosed"; "bigopen"; "Config_Tools"; "CRM_Setup"; "SALPUR_Setup"; "SmallPlussingle"; "From ClipBoard"; "From ClipBoard"; "Clipboard"; "Calendars")
$_col_IMageNames.push("SD2_ShowCalendars"; "SD2_HideCalendats"; "Untitled_22570"; "AllRecords")
$_l_Index:=$_Col_ImageNumbers.indexOf($1)
If ($_l_Index<0)
	$_l_Index:=$_col_IMageNames.indexOf($1)
End if 
//PICTURE LIBRARY LIST($_al_PicRef; $_at_PicName)
//$_l_Ref:=Find in array($_al_PicRef; $1)
//If ($_l_Ref>0)

If ($_l_Index>=0)
	$_t_PictureName:=$_col_IMageNames[$_l_Index]
	If (Test path name:C476($_t_ImagePath+Directory_Symbol+$_t_PictureName+".png")=Is a document:K24:1)
		READ PICTURE FILE:C678($_t_ImagePath+Directory_Symbol+$_t_PictureName+".png"; $_pic_Picture)
	End if 
End if 
$0:=$_pic_Picture
ERR_MethodTrackerReturn("Get_Picture"; $_t_oldMethodName)
