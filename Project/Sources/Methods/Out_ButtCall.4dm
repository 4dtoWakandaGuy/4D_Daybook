//%attributes = {}
If (False:C215)
	//Project Method Name:      Out_ButtCall
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>NoStart)
	//C_UNKNOWN(<>UserAdd)
	//C_UNKNOWN($10)
	//C_UNKNOWN($11)
	//C_UNKNOWN($12)
	//C_UNKNOWN($2)
	//C_UNKNOWN($3)
	//C_UNKNOWN($4)
	//C_UNKNOWN($5)
	//C_UNKNOWN($7)
	//C_UNKNOWN($8)
	//C_UNKNOWN($9)
	//C_UNKNOWN($p1)
	//C_UNKNOWN($p2)
	//C_UNKNOWN($Set)
	//C_UNKNOWN(oOK)
	//C_UNKNOWN(StatsSwitch)
	//C_UNKNOWN(Vadd)
	//C_UNKNOWN(vButtDisO)
	//C_UNKNOWN(vMod2)
	//C_UNKNOWN(vNo)
	//C_UNKNOWN(vSelPrev)
	//C_UNKNOWN(vSNo)
	//C_UNKNOWN(vT)
	//C_UNKNOWN(vText)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; $_bo_Highlight; $_bo_NoAction; $DB_bo_InRecordListing; DB_bo_InRecordListing; DB_bo_RecordModified; DM_bo_CustomSort; INT_bo_DetailOpen; StatsSwitch; vMod2; <>StatsSwitch)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; $_bo_Highlight; $_bo_NoAction; $DB_bo_InRecordListing; DB_bo_InRecordListing; DB_bo_RecordModified; DM_bo_CustomSort; INT_bo_DetailOpen)
	C_LONGINT:C283(<>NoStart; <>PER_l_CurrentUserID; <>SCPT_l_PaletteWIndow; <>WT_SortFieldName_2; $_l_AddMode; $_l_ButtonPressed; $_l_MonitorCall; $_l_NoStart; $_l_OutCallBack; $_l_PipelineProcess; $_l_ProcessState)
	C_LONGINT:C283($_l_TableNumber; $11; $12; CAC_l_Table; DB_l_ButtonClickedFunction; DB_l_OutCallBack; FS_l_FieldType; FS_l_SortDirection; FS_l_SortFieldNUM; oOK; SIZ_l_OLDBOTTOM)
	C_LONGINT:C283(SIZ_l_OLDLEFT; SIZ_l_OLDRIGHT; SIZ_l_OLDTOP; SM_l_MonitorCall; SM_l_TableNumber; SM_l_UpdateOnCallBackID; Vadd; vNo; vSNo; <>newSetsProcess; <>PER_l_CurrentUserID)
	C_LONGINT:C283(<>SCPT_l_PaletteWIndow; $_l_AddMode; $_l_ButtonPressed; $_l_MonitorCall; $_l_NoStart; $_l_OutCallBack; $_l_PipelineProcess; $_l_ProcessState; $_l_ProcessTime; $_l_TableNumber; CAC_l_Table)
	C_LONGINT:C283(DB_l_ButtonClickedFunction; DB_l_OutCallBack; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM; SIZ_l_OLDBOTTOM; SIZ_l_OLDLEFT; SIZ_l_OLDRIGHT; SIZ_l_OLDTOP; SM_l_MonitorCall; SM_l_TableNumber)
	C_LONGINT:C283(SM_l_UpdateOnCallBackID; vNo2)
	C_POINTER:C301($1; $2; $3; $p1; $p2; $_Ptr_Table; $1)
	C_TEXT:C284(<>UserAdd; $_t_ClickedFunction; $_t_CurrentFormUsage; $_t_ExecuteMethodName; $_t_oldMethodName; $_t_OldMethodName2; $_t_ProcessName; $10; $4; $5; $7)
	C_TEXT:C284($8; $9; $SET; DB_t_ButtonClickedFunction; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; FS_t_SortFieldTXT; SM_t_UseSetName; vButtDisO)
	C_TEXT:C284(vSelPrev; vT; vText; WIN_t_CurrentOutputform; WT_t_SortFieldVARNAME; <>ButtDis; $_t_ClickedFunction; $_t_CurrentFormUsage; $_t_ExecuteMethodName; $_t_oldMethodName; $_t_OldMethodName2)
	C_TEXT:C284($_t_ProcessName; $6; DB_t_ButtonClickedFunction; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; FS_t_SortFieldTXT; FS_t_SortVariableName; SM_t_UseSetName; WIN_t_CurrentOutputform; WT_t_SortFieldVARNAME)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Out_ButtCall")

//1= File ptr  2= Code ptr  3= Name ptr
//4= In layout prefix  5= Entry proc  6= Sel proc
//7= Del proc  8= Set Name  9= Window name & for Deletions OR ... xAny Diary proce
//10= Count proc  11= Co Code field no for Tel  12= Contact_Code field no for Tel
//NOTE IF YOU ARE MODIFYING THIS
//MAKE SURE ANY FIXES WILL ALSO WORK in
//Out_ButtCallSD
//Out_ButtCallSD is used for the superdiary

If (Current process:C322=Frontmost process:C327(*))
	$_l_ButtonPressed:=DB_l_ButtonClickedFunction
	DB_l_ButtonClickedFunction:=0
	Case of 
			
		: (SM_l_MonitorCall>0)
			//call is from the set manager
			$_l_MonitorCall:=SM_l_MonitorCall
			SM_l_MonitorCall:=0
			Case of 
				: ($_l_MonitorCall=1)
					//Save the current selection into a set
					//and pass this set to the set manager
					//then call the set manager to tell it can be saved
					$_bo_Highlight:=False:C215
					COPY NAMED SELECTION:C331($1->; "CurrentSortedSelection")
					If (Records in set:C195("Userset")>0)
						USE SET:C118("UserSet")
						CREATE SET:C116($1->; "Onerecord")
						$_bo_Highlight:=True:C214
						
					End if 
					While (Semaphore:C143("$SetInuse"))
						DelayTicks(2)
					End while 
					//TRACE
					CREATE SET:C116($1->; "<>SaveSet"+String:C10(Table:C252($1)))
					If (DB_l_OutCallBack>0)
						$_l_OutCallBack:=DB_l_OutCallBack
						DB_l_OutCallBack:=0
						
					Else 
						$_l_OutCallBack:=<>newSetsProcess
					End if 
					PROCESS PROPERTIES:C336($_l_OutCallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
					If ($_l_ProcessState>=0)  // 30/05/02 pb
						SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
						SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252($1)))
						POST OUTSIDE CALL:C329($_l_OutCallBack)
					End if 
					USE NAMED SELECTION:C332("CurrentSortedSelection")
					If ($_bo_Highlight)
						HIGHLIGHT RECORDS:C656("OneRecord")
						CLEAR SET:C117("OneRecord")
					End if 
					CLEAR SEMAPHORE:C144("$SetInuse")
					
				: ($_l_MonitorCall=2)  //here we are passed a set
					
					$_bo_Highlight:=False:C215
					If (Records in set:C195("Userset")>0)
						USE SET:C118("UserSet")
						CREATE SET:C116($1->; "Onerecord")
						$_bo_Highlight:=True:C214
					End if 
					While (Semaphore:C143("$SetInuse"))
						DelayTicks(2)
					End while 
					CREATE SET:C116($1->; "TempSet"+String:C10(Table:C252($1)))
					
					INTERSECTION:C121(SM_t_UseSetName; "TempSet"+String:C10(Table:C252($1)); "TempSet"+String:C10(Table:C252($1)))
					USE SET:C118("TempSet"+String:C10(Table:C252($1)))
					CLEAR SET:C117("TempSet"+String:C10(Table:C252($1)))
					Cache_Update
					Case of 
						: (Table:C252($1)=Table:C252(->[COMPANIES:2]))
							QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
						: (Table:C252($1)=Table:C252(->[DIARY:12]))
							QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Deleted:43=0)
						: (Table:C252($1)=Table:C252(->[CONTACTS:1]))
							QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32=0)
					End case 
					
					FS_SetFormSort(WIN_t_CurrentOutputform)
					vNo:=Records in selection:C76($1->)
					vNo2:=0
					If ($8#"")
						CREATE SET:C116($1->; $8)
					End if 
					If (SM_l_UpdateOnCallBackID#0)  //the list has to be updated
						CREATE SET:C116($1->; "<>SaveSet"+String:C10(Table:C252($1)))
						If (DB_l_OutCallBack>0)
							$_l_OutCallBack:=DB_l_OutCallBack
							DB_l_OutCallBack:=0
						Else 
							$_l_OutCallBack:=<>newSetsProcess
						End if 
						PROCESS PROPERTIES:C336($_l_OutCallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
						If ($_l_ProcessState>=0)  // 30/05/02 pb
							SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
							SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252($1)))
							POST OUTSIDE CALL:C329($_l_OutCallBack)
							
						End if 
					Else 
						If (DB_l_OutCallBack>0)
							$_l_OutCallBack:=DB_l_OutCallBack
							DB_l_OutCallBack:=0
						Else 
							$_l_OutCallBack:=<>newSetsProcess
						End if 
						PROCESS PROPERTIES:C336($_l_OutCallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
						If ($_l_ProcessState>=0)  // 30/05/02 pb
							$_l_MonitorCall:=0
							SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
							
							
						End if 
						
					End if 
					CLEAR SEMAPHORE:C144("$SetInuse")
					If ($_bo_Highlight)
						HIGHLIGHT RECORDS:C656("OneRecord")
						CLEAR SET:C117("OneRecord")
					End if 
				: ($_l_MonitorCall=3)  //here we are passed a set to unite
					$_bo_Highlight:=False:C215
					If (Records in set:C195("Userset")>0)
						USE SET:C118("UserSet")
						CREATE SET:C116($1->; "Onerecord")
						$_bo_Highlight:=True:C214
					End if 
					While (Semaphore:C143("$SetInuse"))
						DelayTicks(2)
					End while 
					CREATE SET:C116($1->; "TempSet"+String:C10(Table:C252($1)))
					UNION:C120(SM_t_UseSetName; "TempSet"+String:C10(Table:C252($1)); "TempSet"+String:C10(Table:C252($1)))
					
					USE SET:C118("TempSet"+String:C10(Table:C252($1)))
					CLEAR SET:C117("TempSet"+String:C10(Table:C252($1)))
					Case of 
						: (Table:C252($1)=Table:C252(->[COMPANIES:2]))
							QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
						: (Table:C252($1)=Table:C252(->[DIARY:12]))
							QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Deleted:43=0)
						: (Table:C252($1)=Table:C252(->[CONTACTS:1]))
							QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32=0)
					End case 
					CAC_l_Table:=Table:C252($1)
					Cache_Update
					FS_SetFormSort(WIN_t_CurrentOutputform)
					vNo:=Records in selection:C76($1->)
					vNo2:=0
					
					If ($8#"")
						CREATE SET:C116($1->; $8)
					End if 
					If (SM_l_UpdateOnCallBackID#0)  //the list has to be updated
						CREATE SET:C116($1->; "<>SaveSet"+String:C10(Table:C252($1)))
						If (DB_l_OutCallBack>0)
							$_l_OutCallBack:=DB_l_OutCallBack
							DB_l_OutCallBack:=0
						Else 
							$_l_OutCallBack:=<>newSetsProcess
						End if 
						PROCESS PROPERTIES:C336($_l_OutCallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
						If ($_l_ProcessState>=0)  // 30/05/02 pb
							
							SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
							SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252($1)))
							POST OUTSIDE CALL:C329($_l_OutCallBack)
							
						End if 
					Else 
						If (DB_l_OutCallBack>0)
							$_l_OutCallBack:=DB_l_OutCallBack
							DB_l_OutCallBack:=0
						Else 
							$_l_OutCallBack:=<>newSetsProcess
						End if 
						PROCESS PROPERTIES:C336($_l_OutCallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
						If ($_l_ProcessState>=0)  // 30/05/02 pb
							$_l_MonitorCall:=0
							SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
						End if 
						
					End if 
					If ($_bo_Highlight)
						HIGHLIGHT RECORDS:C656("OneRecord")
						CLEAR SET:C117("OneRecord")
					End if 
					CLEAR SEMAPHORE:C144("$SetInuse")
				: ($_l_MonitorCall=4)  //here we are passed a set to unite
					$_bo_Highlight:=False:C215
					If (Records in set:C195("Userset")>0)
						USE SET:C118("UserSet")
						CREATE SET:C116($1->; "Onerecord")
						$_bo_Highlight:=True:C214
					End if 
					While (Semaphore:C143("$SetInuse"))
						DelayTicks(2)
					End while 
					
					CREATE SET:C116($1->; "TempSet"+String:C10(Table:C252($1)))
					DIFFERENCE:C122(SM_t_UseSetName; "TempSet"+String:C10(Table:C252($1)); "TempSet"+String:C10(Table:C252($1)))
					USE SET:C118("TempSet"+String:C10(Table:C252($1)))
					CLEAR SET:C117("TempSet"+String:C10(Table:C252($1)))
					Case of 
						: (Table:C252($1)=Table:C252(->[COMPANIES:2]))
							QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
						: (Table:C252($1)=Table:C252(->[DIARY:12]))
							QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Deleted:43=0)
						: (Table:C252($1)=Table:C252(->[CONTACTS:1]))
							QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32=0)
					End case 
					CAC_l_Table:=Table:C252($1)
					Cache_Update
					FS_SetFormSort(WIN_t_CurrentOutputform)
					vNo:=Records in selection:C76($1->)
					vNo2:=0
					If ($8#"")
						CREATE SET:C116($1->; $8)
					End if 
					If (SM_l_UpdateOnCallBackID#0)  //the list has to be updated
						CREATE SET:C116($1->; "<>SaveSet"+String:C10(Table:C252($1)))
						If (DB_l_OutCallBack>0)
							$_l_OutCallBack:=DB_l_OutCallBack
							DB_l_OutCallBack:=0
						Else 
							$_l_OutCallBack:=<>newSetsProcess
						End if 
						PROCESS PROPERTIES:C336($_l_OutCallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
						If ($_l_ProcessState>=0)  // 30/05/02 pb
							SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
							SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252($1)))
							POST OUTSIDE CALL:C329($_l_OutCallBack)
							
						End if 
					End if 
					If ($_bo_Highlight)
						HIGHLIGHT RECORDS:C656("OneRecord")
						CLEAR SET:C117("OneRecord")
					End if 
					CLEAR SEMAPHORE:C144("$SetInuse")
				: ($_l_MonitorCall=5)  //here we are passed a set to unite
					$_bo_Highlight:=False:C215
					If (Records in set:C195("Userset")>0)
						
						USE SET:C118("UserSet")
						CREATE SET:C116($1->; "Onerecord")
						$_bo_Highlight:=True:C214
					End if 
					While (Semaphore:C143("$SetInuse"))
						DelayTicks(2)
					End while 
					
					CREATE SET:C116($1->; "TempSet"+String:C10(Table:C252($1)))
					DIFFERENCE:C122("TempSet"+String:C10(Table:C252($1)); SM_t_UseSetName; "TempSet"+String:C10(Table:C252($1)))
					USE SET:C118("TempSet"+String:C10(Table:C252($1)))
					CLEAR SET:C117("TempSet"+String:C10(Table:C252($1)))
					Case of 
						: (Table:C252($1)=Table:C252(->[COMPANIES:2]))
							QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
						: (Table:C252($1)=Table:C252(->[DIARY:12]))
							QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Deleted:43=0)
						: (Table:C252($1)=Table:C252(->[CONTACTS:1]))
							QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32=0)
					End case 
					CAC_l_Table:=Table:C252($1)
					Cache_Update
					FS_SetFormSort(WIN_t_CurrentOutputform)
					vNo:=Records in selection:C76($1->)
					vNo2:=0
					If ($8#"")
						CREATE SET:C116($1->; $8)
					End if 
					If (SM_l_UpdateOnCallBackID#0)  //the list has to be updated
						If (DB_l_OutCallBack>0)
							$_l_OutCallBack:=DB_l_OutCallBack
							DB_l_OutCallBack:=0
						Else 
							$_l_OutCallBack:=<>newSetsProcess
						End if 
						CREATE SET:C116($1->; "<>SaveSet"+String:C10(Table:C252($1)))
						PROCESS PROPERTIES:C336(<>newSetsProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
						If ($_l_ProcessState>=0)  // 30/05/02 pb
							SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_MonitorCall; $_l_MonitorCall)
							SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_t_UseSetName; "<>SaveSet"+String:C10(Table:C252($1)))
							POST OUTSIDE CALL:C329($_l_OutCallBack)
							
						End if 
					End if 
					If ($_bo_Highlight)
						HIGHLIGHT RECORDS:C656("OneRecord")
						CLEAR SET:C117("OneRecord")
					End if 
					CLEAR SEMAPHORE:C144("$SetInuse")
				: ($_l_MonitorCall=6)
					$_bo_Highlight:=False:C215
					//load a set from disk
					While (Semaphore:C143("$SetInuse"))
						DelayTicks(2)
					End while 
					LOAD SET:C185($1->; "TempSet"; "")
					If (OK=1)
						If (Records in set:C195("Userset")>0)
							USE SET:C118("UserSet")
							CREATE SET:C116($1->; "Onerecord")
							$_bo_Highlight:=True:C214
							vNo:=Records in selection:C76($1->)
							vNo2:=0
							If ($8#"")
								CREATE SET:C116($1->; $8)
							End if 
							Case of 
								: (Table:C252($1)=Table:C252(->[COMPANIES:2]))
									QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
								: (Table:C252($1)=Table:C252(->[DIARY:12]))
									QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Deleted:43=0)
								: (Table:C252($1)=Table:C252(->[CONTACTS:1]))
									QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32=0)
							End case 
							CAC_l_Table:=Table:C252($1)
							Cache_Update
							FS_SetFormSort(WIN_t_CurrentOutputform)
						End if 
						If ($_bo_Highlight)
							HIGHLIGHT RECORDS:C656("OneRecord")
							CLEAR SET:C117("OneRecord")
						End if 
						USE SET:C118("TempSet")
						CLEAR SET:C117("TempSet")
					End if 
					CLEAR SEMAPHORE:C144("$SetInuse")
					//no need to call the set manager back
				: ($_l_MonitorCall=8)
					//save the current selection as a set on disk
					While (Semaphore:C143("$SetInuse"))
						DelayTicks(2)
					End while 
					
					$_bo_Highlight:=False:C215
					vNo:=Records in selection:C76($1->)
					vNo2:=0
					If ($8#"")
						CREATE SET:C116($1->; $8)
					End if 
					CREATE SET:C116($1->; "TempSet")
					SAVE SET:C184("TempSet"; "")
					FS_SetFormSort(WIN_t_CurrentOutputform)
					CLEAR SET:C117("TempSet")
					CLEAR SEMAPHORE:C144("$SetInuse")
				: ($_l_MonitorCall=7)
					While (Semaphore:C143("$SetInuse"))
						DelayTicks(2)
					End while 
					$_bo_Highlight:=False:C215
					//list passed from list manager
					USE SET:C118("<>SaveSet"+String:C10(Table:C252($1)))
					CREATE SET:C116($1->; "Onerecord")
					$_bo_Highlight:=True:C214
					vNo:=Records in selection:C76($1->)
					vNo2:=0
					If ($8#"")
						CREATE SET:C116($1->; $8)
					End if 
					Case of 
						: (Table:C252($1)=Table:C252(->[COMPANIES:2]))
							QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
						: (Table:C252($1)=Table:C252(->[DIARY:12]))
							QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Deleted:43=0)
						: (Table:C252($1)=Table:C252(->[CONTACTS:1]))
							QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32=0)
					End case 
					CAC_l_Table:=Table:C252($1)
					Cache_Update
					FS_SetFormSort(WIN_t_CurrentOutputform)
					CLEAR SET:C117("<>SaveSet"+String:C10(Table:C252($1)))
					//no need to call the set manager back
					If ($_bo_Highlight)
						HIGHLIGHT RECORDS:C656("OneRecord")
						CLEAR SET:C117("OneRecord")
					End if 
					CLEAR SEMAPHORE:C144("$SetInuse")
				: ($_l_MonitorCall=9)
					While (Semaphore:C143("$SetInuse"))
						DelayTicks(2)
					End while 
					If (DB_l_OutCallBack>0)
						$_l_OutCallBack:=DB_l_OutCallBack
						DB_l_OutCallBack:=0
					Else 
						$_l_OutCallBack:=<>newSetsProcess
					End if 
					$_Ptr_Table:=$1
					$_l_TableNumber:=Table:C252($_Ptr_Table)
					//reply with the number of the table
					SET PROCESS VARIABLE:C370($_l_OutCallBack; SM_l_TableNumber; $_l_TableNumber)
					CLEAR SEMAPHORE:C144("$SetInuse")
			End case 
			
		: (($_l_ButtonPressed=DB_GetButtonFunction("OK")) | (oOK=1))
			FSetting_UpdateArray(WIN_t_CurrentOutputform; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM; FS_t_SortVariableName; FS_t_SortFieldTXT; WT_t_SortFieldVARNAME)
			
			oOK:=0
			ACCEPT:C269
			
		: ($_l_ButtonPressed=DB_GetButtonFunction("Cancel"))  // | (oCancel=1))
			FSetting_UpdateArray(WIN_t_CurrentOutputform; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM; FS_t_SortVariableName; FS_t_SortFieldTXT; WT_t_SortFieldVARNAME)
			//  oCancel:=0
			CANCEL:C270
			OK:=0
			
		: ($_l_ButtonPressed=DB_GetButtonFunction("Close"))
			DB_t_CallOnCloseorSave:=""
			Close_Process
			FSetting_UpdateArray(WIN_t_CurrentOutputform; FS_l_SortDirection; FS_l_SortFieldNUM; FS_l_SortTableNUM; FS_t_SortVariableName; FS_t_SortFieldTXT; WT_t_SortFieldVARNAME)
			
		: ($_l_ButtonPressed=DB_GetButtonFunction("Plus"))  //| (oPlus=1))
			//  oPlus:=0
			GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)  //NG added march 2004
			$_l_NoStart:=<>NoStart
			INT_bo_DetailOpen:=True:C214
			$_bo_NoAction:=True:C214
			
			If ((Substring:C12(vButtDisO; 4; 1)#"P") & (Substring:C12(<>ButtDis; 4; 1)#"P"))
				Case of 
					: ($5="Minor_In")
						//TRACE
						$DB_bo_InRecordListing:=DB_bo_InRecordListing
						DB_bo_InRecordListing:=True:C214
						$_l_TableNumber:=Table:C252($1)
						DB_MenuNewRecord(String:C10($_l_TableNumber))
						DB_bo_InRecordListing:=$DB_bo_InRecordListing
					: ($5="DB_MenuNewRecord")
						//TRACE
						$DB_bo_InRecordListing:=DB_bo_InRecordListing
						DB_bo_InRecordListing:=True:C214
						$_l_TableNumber:=Table:C252($1)
						DB_MenuNewRecord(String:C10($_l_TableNumber))
						DB_bo_InRecordListing:=$DB_bo_InRecordListing
					Else 
						If ($5#"")
							$_bo_NoAction:=False:C215
							$_l_AddMode:=Vadd
							<>NoStart:=1  //NG March 2004 this was causing a prob
							EXECUTE FORMULA:C63($5)
							If ($8#"")
								USE SET:C118($8)
							End if 
							CAC_l_Table:=Table:C252($1)
							Cache_Update
							vNo:=Records in selection:C76($1->)
							vAdd:=$_l_AddMode
						End if 
				End case 
			End if 
			<>NoStart:=$_l_NoStart
			If (Not:C34($_bo_NoAction))
				SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)  //NG added march2004
			End if 
		: (($_l_ButtonPressed=DB_GetButtonFunction("Delete")) | ($_l_ButtonPressed=DB_GetButtonFunction("Minus")))
			
			If (Substring:C12(<>ButtDis; 3; 1)#"D")
				Case of 
					: ($7="Minor_DelEx")
						Minor_DelEx($1; $2; $4)
						FS_SetFormSort(WIN_t_CurrentOutputform)
					: ($7="Minor_Del")
						//if we are viewing personnel
						//we will not delete it=just soft delete
						Minor_Del($1)
						FS_SetFormSort(WIN_t_CurrentOutputform)
					: ($7="Minor_DelCU")
						Minor_DelCU($1; $2)
						FS_SetFormSort(WIN_t_CurrentOutputform)
					: ($7="Minor_DelSet")
						Minor_DelSet($1; $8)
						FS_SetFormSort(WIN_t_CurrentOutputform)
					: ($7="Minor_DelSetEx")
						Minor_DelSetEx($1; $2; $4; $8)
						FS_SetFormSort(WIN_t_CurrentOutputform)
					: ($7="Minor_DelExCU")
						Minor_DelExCU($1; $2; $4)
						FS_SetFormSort(WIN_t_CurrentOutputform)
					: ($7="Minor_DelNoCan")
						Minor_DelNoCan($1)
						FS_SetFormSort(WIN_t_CurrentOutputform)
					Else 
						If ($7#"")
							$_t_OldMethodName2:=ERR_MethodTracker("Execute: "+$7)
							EXECUTE FORMULA:C63($7)
							FS_SetFormSort(WIN_t_CurrentOutputform)
						End if 
				End case 
			End if 
			
		: ($_l_ButtonPressed=DB_GetButtonFunction("Select@"))  // | (oSelect=1))
			//    oSelect:=0
			If (Substring:C12(<>ButtDis; 10; 1)#"S")
				If ((Gen_Option) | ($_l_ButtonPressed=DB_GetButtonFunction("SelectO")))
					If (Records in set:C195("Userset")>0)
						If ($8#"")
							
							CREATE SET:C116($1->; "Cset")
							USE SET:C118("Userset")
							CREATE SET:C116($1->; "Cset2")
							DIFFERENCE:C122("Cset"; "Cset2"; "Cset")
							USE SET:C118("Cset")
							CLEAR SET:C117("Cset")
							CREATE SET:C116($1->; $8)
						Else 
							CREATE SET:C116($1->; "Master")
							DIFFERENCE:C122("Master"; "Userset"; "Master")
							USE SET:C118("Master")
						End if 
						vNo:=Records in selection:C76($1->)
						vNo2:=0
						CAC_l_Table:=Table:C252($1)
						Cache_Update
						FS_SetFormSort(WIN_t_CurrentOutputform)
					Else 
						Gen_Alert("Please first highlight records to Remove from the Selection"; "Try again")
					End if 
				Else 
					If (Records in set:C195("Userset")>0)
						USE SET:C118("Userset")
						vNo:=Records in selection:C76($1->)
						vNo2:=0
						If ($8#"")
							CREATE SET:C116($1->; $8)
						End if 
						CAC_l_Table:=Table:C252($1)
						Cache_Update
						FS_SetFormSort(WIN_t_CurrentOutputform)
					Else 
						Gen_Alert("Please first highlight records to Select"; "Try again")
					End if 
				End if 
			End if 
		: ($_l_ButtonPressed=DB_GetButtonFunction("QVSearch"))
			CREATE EMPTY SET:C140($1->; "QVTEMP")
			QV_AdvancedSearch(Table:C252($1))
			//this returns a set
			USE SET:C118("QVTEMP")
			CLEAR SET:C117("QVTEMP")
			vNo:=Records in selection:C76($1->)
			CAC_l_Table:=Table:C252($1)
			
			Cache_Update
			FS_SetFormSort(WIN_t_CurrentOutputform)
		: ($_l_ButtonPressed=DB_GetButtonFunction("Find")) | ($_l_ButtonPressed=DB_GetButtonFunction("FindO"))  //| (oSearch=1))"
			//   oSearch:=0
			If (Substring:C12(<>ButtDis; 9; 1)#"F")
				If (Not:C34(In_ButtSilver))
					DB_bo_RecordModified:=False:C215
					vMod2:=False:C215
					COPY NAMED SELECTION:C331($1->; "Selection")
					If ($6="Minor_Sel")
						vSelPrev:=""
						Minor_Sel($1; $2; $3)
					Else 
						If ((Gen_Option) | ($_l_ButtonPressed=DB_GetButtonFunction("FindO")))
							
							vSelPrev:=" FSC"
						Else 
							vSelPrev:=""
						End if 
						$_t_OldMethodName2:=ERR_MethodTracker("Execute: "+$6)
						EXECUTE FORMULA:C63($6)
					End if 
					If (Records in selection:C76($1->)>0)
						vNo:=Records in selection:C76($1->)
						vNo2:=0
						If ($8#"")
							CREATE SET:C116($1->; $8)
						End if 
					Else 
						USE NAMED SELECTION:C332("Selection")
						If (($9#"") & ($9#"@any@"))
							Gen_Alert("No "+$9+" found - the selection is unchanged"; "OK")
						Else 
							Gen_Alert("No "+$4+" found - the selection is unchanged"; "OK")
						End if 
					End if 
					CLEAR NAMED SELECTION:C333("Selection")
					vNo:=Records in selection:C76($1->)
				End if 
			End if 
			CAC_l_Table:=Table:C252($1)
			Cache_Update
			FS_SetFormSort(WIN_t_CurrentOutputform)
		: ($_l_ButtonPressed=DB_GetButtonFunction("Sort"))  //| (oSort=1))
			//  oSort:=0
			If (Records in selection:C76($1->)<100)
				MESSAGES OFF:C175
			End if 
			If (Substring:C12(<>ButtDis; 12; 1)#"S")
				<>SYS_bo_CurrentWindowModal:=True:C214
				MESSAGES OFF:C175
				SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
				ORDER BY:C49($1->)
				SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
				MESSAGES ON:C181
				<>SYS_bo_CurrentWindowModal:=False:C215
				If (OK=1)
					DM_bo_CustomSort:=True:C214
					
					vNo2:=Records in selection:C76($1->)
				End if 
			End if 
			MESSAGES ON:C181
			
		: ($_l_ButtonPressed=DB_GetButtonFunction("Set"))
			If (Substring:C12(<>ButtDis; 11; 1)#"S")
				If (Not:C34(In_ButtSilver))
					If ($8="")
						Gen_ListSet("Master"; $1)
					Else 
						Gen_ListSet($8; $1)
					End if 
				End if 
			End if 
			FS_SetFormSort(WIN_t_CurrentOutputform)
		: ($_l_ButtonPressed=DB_GetButtonFunction("Report"))  // | (oReport=1))
			// oReport:=0
			//  If (Not(In_ButtSilver ))
			If ((Substring:C12(vButtDisO; 13; 1)#"R") & (Substring:C12(<>ButtDis; 13; 1)#"R"))
				Gen_ListReport($1; $6)
			End if 
			// End if
			FS_SetFormSort(WIN_t_CurrentOutputform)
		: ($_l_ButtonPressed=DB_GetButtonFunction("Graph"))  //| (oGraph=1))
			// oGraph:=0
			//  If (Not(In_ButtSilver ))
			If ((Substring:C12(vButtDisO; 13; 1)#"R") & (Substring:C12(<>ButtDis; 13; 1)#"R"))
				Gen_ListGraph($1)
				
			End if 
			//  End if
			FS_SetFormSort(WIN_t_CurrentOutputform)
		: ($_l_ButtonPressed=DB_GetButtonFunction("Apply"))
			If (Substring:C12(vButtDisO; 15; 1)#"A")
				If ((Gen_Option) & (Table:C252($1)=24) & (<>UserAdd="@BWB@"))
					Orders_BWBEx
				Else 
					Gen_ListApply(Table:C252($1); $2)
				End if 
			End if 
			// FS_SetFormSort (WIN_t_CurrentOutputform)
		: ($_l_ButtonPressed=DB_GetButtonFunction("Count"))
			If (Substring:C12(<>ButtDis; 14; 1)#"C")
				If ($8#"")
					$Set:=$8
				Else 
					$Set:="Master"
				End if 
				Gen_Count($1; $Set)
				If (Substring:C12($10; 1; 1)="&")  //Execute without displaying in Alert windows
					$_t_OldMethodName2:=ERR_MethodTracker("Execute: "+Substring:C12($10; 2; 32000))
					EXECUTE FORMULA:C63(Substring:C12($10; 2; 32000))
				Else 
					If ($10#"")
						If (Substring:C12($10; 1; 1)="*")
							$_t_OldMethodName2:=ERR_MethodTracker("Execute: "+Substring:C12($10; 2; 32000))
							EXECUTE FORMULA:C63(Substring:C12($10; 2; 32000))
						Else 
							//$_t_OldMethodName2:=ERR_MethodTracker ("Execute: "+$10)
							//EXECUTE FORMULA($10)
							$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($10)
							EXECUTE METHOD:C1007($_t_ExecuteMethodName)
						End if 
					End if 
					If (Substring:C12($10; 1; 1)="*")
						Gen_Alert2Col(vText; ""; vT)
					Else 
						Gen_Alert(vText; "")
					End if 
				End if 
				If (vSNo>0)
					USE NAMED SELECTION:C332($Set)
					CLEAR NAMED SELECTION:C333($Set)
				End if 
			End if 
			
		: ($_l_ButtonPressed=DB_GetButtonFunction("Tel"))
			If (Substring:C12(<>ButtDis; 17; 1)#"T")
				If (($11>0) | ($12>0))
					If ($11=0)
						$p1:=->[CONTACTS:1]Company_Code:1
					Else 
						$p1:=Field:C253(Table:C252($1); $11)
					End if 
					If ($12=0)
						$p2:=->[CONTACTS:1]Contact_Code:2
					Else 
						$p2:=Field:C253(Table:C252($1); $12)
					End if 
					Gen_ShowTelOut($p1; $p2)
				End if 
			End if 
			
		: ($_l_ButtonPressed=DB_GetButtonFunction("Diary"))
			If (Substring:C12(<>ButtDis; 16; 1)#"D")
				If (Records in set:C195("Userset")>0)
					CUT NAMED SELECTION:C334($1->; "$FF")
					USE SET:C118("Userset")
					FurthFld_Func2($1)
					USE NAMED SELECTION:C332("$FF")
				Else 
					Gen_Alert("Please first select a record for which you want to View Further Fields"; "Try again")
				End if 
			End if 
			
		: ($_l_ButtonPressed=DB_GetButtonFunction("M:"))
			$_t_ClickedFunction:=DB_t_ButtonClickedFunction
			DB_t_ButtonClickedFunction:=""
			If ($_t_ClickedFunction#"")
				If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
					If ($_t_ClickedFunction="F:@")  //So F key functions dont think they are called from the palette
						Macro(Substring:C12($_t_ClickedFunction; 3; 15))
					Else 
						Macro(Substring:C12($_t_ClickedFunction; 3; 15); ""; ""; <>SCPT_l_PaletteWIndow)  //Play a Macro -
					End if 
				End if 
			End if 
			
		: ($_l_ButtonPressed=DB_GetButtonFunction("-1"))
			
			$_t_ClickedFunction:=DB_t_ButtonClickedFunction
			DB_t_ButtonClickedFunction:=""
			
			If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
				If (Num:C11(Substring:C12($_t_ClickedFunction; 3; 2))>0)  //If its a Menu item method
					$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
					DB_t_CurrentFormUsage:="-1"+Substring:C12($_t_ClickedFunction; 3; 2)
					$_t_OldMethodName2:=ERR_MethodTracker("Execute: "+Substring:C12($_t_ClickedFunction; 5; 15))
					EXECUTE FORMULA:C63(Substring:C12($_t_ClickedFunction; 5; 15))
					DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
				Else 
					$_t_OldMethodName2:=ERR_MethodTracker("Execute: "+Substring:C12($_t_ClickedFunction; 3; 15))
					EXECUTE FORMULA:C63(Substring:C12($_t_ClickedFunction; 3; 15))  //Execute a Layout menu item - called by Record_Play
				End if 
			End if 
		: ($_l_ButtonPressed=DB_GetButtonFunction("SPshow"))  //show sales pipeline
			ZSalesPipeline
		: ($_l_ButtonPressed=DB_GetButtonFunction("SPenter"))  //enter sales pipeline
			If (Records in set:C195("Userset")=1)
				COPY NAMED SELECTION:C331($1->; "Current")
				USE SET:C118("UserSet")
				SP_EnterRelatedPipeline($1)
				USE NAMED SELECTION:C332("Current")
			Else 
				// COPY NAMED SELECTION($1->;"Current")
				$_l_PipelineProcess:=New process:C317("SP_NewPipeline"; 256000; "Enter Sales Pipeline"; True:C214; <>PER_l_CurrentUserID)
				// USE NAMED SELECTION("Current")
			End if 
			
	End case 
	
	//◊Option:=False
End if 
//dont call the following if it was cancel or OK bubtton
If ($_l_ButtonPressed#DB_GetButtonFunction("OK")) & ($_l_ButtonPressed#DB_GetButtonFunction("Cancel"))
	If (WIN_t_CurrentOutputform#"Superdiary")
		Out_SetManger($1)
		
		QV_HideQualities
	Else 
		In_SetManager
	End if 
End if 
If (<>StatsSwitch)
	<>StatsSwitch:=False:C215
	StatsSwitch:=True:C214
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("Out_ButtCall"; $_t_oldMethodName)
