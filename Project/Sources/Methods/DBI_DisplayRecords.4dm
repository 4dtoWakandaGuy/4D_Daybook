//%attributes = {}
If (False:C215)
	//Project Method Name:      DBI_DisplayRecords
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   16/07/2010 16:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_ActionAddPersonelID;0)
	//ARRAY TEXT(SD_at_actionAdd;0)
	C_BOOLEAN:C305(<>ViewLists; $_bo_Continue; $_bo_CustomView; $_bo_EditinTransaction; $_bo_FiltersAvailable; $_bo_GraphsAvailabe; $_bo_HideModuleBar; $_bo_HideSearchBox; $_bo_OpenRecord; $_bo_ReturnSelection; $_bo_SelectionsAvailable)
	C_BOOLEAN:C305($_bo_ShowCurrentSelection; $_bo_ShowTabBar; $_bo_StatsAvailabe; $10; $11; $12; $14; $15; $16; $5; $6)
	C_BOOLEAN:C305($7; $9; DB_bo_EditinTransaction; DB_bo_FiltersAvailable; DB_Bo_GraphsAvailabe; DB_bo_GraphsAvailable; DB_bo_HideModuleBar; DB_bo_HideSearchBox; DB_bo_ReturnSelection; DB_bo_SelectionManagerAvailable; DB_bo_SelectionsAvailable)
	C_BOOLEAN:C305(DB_bo_ShowCurrentSelection; DB_bo_ShowTabBar; DB_bo_StatsAvailabe; DB_bo_StatsAvailable; ORD_bo_IsRevision; PUR_bo_CANCEL)
	C_LONGINT:C283($_l_CalledFrom; $_l_CurrentDisplayedForm; $_l_FormName; $_l_FormTable; $_l_ScreenNumber; $_l_TableNumber; $_l_ViewType; $_l_Windowbottom; $_l_WindowCurrentModule; $_l_WindowID; $_l_Windowleft)
	C_LONGINT:C283($_l_Windowright; $_l_WindowTop; $1; $13; $4; $8; DB_l_CompanionWindow; DB_l_CurrentDisplayedForm; DB_l_ViewType; DB_l_WindowCurrentModule; SD_l_ParentProcess)
	C_POINTER:C301($_Ptr_Table)
	C_TEXT:C284($_t_Context; $_t_CurrentContext; $_t_FormName; $_t_oldMethodName; $2; $3; DB_t_CurrentContext)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBI_DisplayRecords")
If (True:C214)
	$_t_Context:=""
	
	
	
	If (Count parameters:C259>=8)
		$_l_CalledFrom:=$8
	Else 
		$_l_CalledFrom:=Current process:C322
	End if 
	If ($_l_CalledFrom=Current process:C322)
		$_l_CurrentDisplayedForm:=DB_l_CurrentDisplayedForm
		$_t_CurrentContext:=DB_t_CurrentContext
		$_l_ViewType:=DB_l_ViewType
		$_bo_ShowTabBar:=DB_bo_ShowTabBar
		$_bo_HideModuleBar:=DB_bo_HideModuleBar
		$_bo_HideSearchBox:=DB_bo_HideSearchBox
		$_bo_StatsAvailabe:=DB_bo_StatsAvailabe
		$_bo_GraphsAvailabe:=DB_Bo_GraphsAvailabe
		$_bo_GraphsAvailabe:=DB_Bo_GraphsAvailabe
		$_bo_FiltersAvailable:=DB_bo_FiltersAvailable
		$_bo_SelectionsAvailable:=DB_bo_SelectionsAvailable
		$_l_WindowCurrentModule:=DB_l_WindowCurrentModule
		$_bo_ReturnSelection:=DB_bo_ReturnSelection
		$_bo_ShowCurrentSelection:=DB_bo_ShowCurrentSelection
		$_bo_EditinTransaction:=DB_bo_EditinTransaction
	End if 
	DB_l_CurrentDisplayedForm:=$1
	$_Ptr_Table:=Table:C252($1)
	If (Count parameters:C259>=3)
		DB_t_CurrentContext:=$3
		$_t_Context:=$3
	Else 
		$_t_Context:=""
	End if 
	If (Count parameters:C259>=4)
		DB_l_ViewType:=$4
	Else 
		DB_l_ViewType:=1
	End if 
	
	If ($_l_CalledFrom#Current process:C322)
		Start_Process
	End if 
	$_bo_OpenRecord:=False:C215
	If (Count parameters:C259>=2)
		If ($2#"")
			USE NAMED SELECTION:C332($2)
			If (Records in selection:C76($_Ptr_Table->)=1)
				DB_bo_ShowCurrentSelection:=True:C214
				If (<>ViewLists)  //view lists is an option that opens a list view even if there is one record
					If ($_t_Context="Show Linked Record")
						$_bo_OpenRecord:=True:C214
					End if 
				Else 
					$_bo_OpenRecord:=True:C214
				End if 
			Else 
				If (Records in selection:C76($_Ptr_Table->)>1) & ($_t_Context="") | ($_t_Context="Show Linked Record@")
					
					DB_bo_ShowCurrentSelection:=True:C214
				End if 
			End if 
		End if 
	End if 
	Case of 
		: ($_t_Context="Copy Order Items") | ($_t_Context="Copy Order")
			
			ORD_bo_IsRevision:=True:C214
			
	End case 
	If (Count parameters:C259>=5)
		DB_bo_ShowTabBar:=$5
	Else 
		DB_bo_ShowTabBar:=True:C214
	End if 
	If (Count parameters:C259>=6)
		DB_bo_HideModuleBar:=$6
	Else 
		DB_bo_HideModuleBar:=False:C215
	End if 
	If (Count parameters:C259>=6)
		DB_bo_HideSearchBox:=($7=False:C215)
	Else 
		DB_bo_HideSearchBox:=False:C215
	End if 
	If (Count parameters:C259>=9)
		DB_bo_StatsAvailabe:=$9
	Else 
		DB_bo_StatsAvailabe:=True:C214
	End if 
	If (Count parameters:C259>=10)
		DB_Bo_GraphsAvailabe:=$10
	Else 
		DB_Bo_GraphsAvailabe:=True:C214
	End if 
	If (Count parameters:C259>=11)
		DB_bo_FiltersAvailable:=$11
	Else 
		DB_bo_FiltersAvailable:=True:C214
	End if 
	If (Count parameters:C259>=12)
		DB_bo_SelectionsAvailable:=$12
	Else 
		DB_bo_SelectionsAvailable:=True:C214
	End if 
	If (Count parameters:C259>=13)
		DB_l_WindowCurrentModule:=$13
		
	End if 
	If (Count parameters:C259>=14)
		DB_bo_EditinTransaction:=$14
	End if 
	If (Count parameters:C259>=15)
		DB_bo_ReturnSelection:=$15
	End if 
	If (Count parameters:C259>=16)  //if callied in a process this selection is passed in $2
		DB_bo_ShowCurrentSelection:=$16
	End if 
	$_bo_CustomView:=False:C215
	Case of 
		: ($1=Table:C252(->[LOCATIONS:61]))
			$_bo_CustomView:=True:C214
			$_l_FormTable:=Table:C252(->[USER:15])
			$_t_FormName:="STK_LocationsEditor"
			
		: ($1=Table:C252(->[COMPANIES:2]))
		: ($1=Table:C252(->[CONTACTS:1]))
		: ($1=Table:C252(->[ACCOUNTS:32]))
		: ($1=Table:C252(->[COMPANIES:2]))
		: $1=Table:C252(->[ACTIONS:13])
			CREATE SET:C116([ACTIONS:13]; "$ActionsTemp")
			SD2_LoadTemplateActions
			ARRAY TEXT:C222(SD_at_actionAdd; 0)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0)
			SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; SD_at_actionAdd; [PERSONNEL:11]Personnel_ID:48; SD_al_ActionAddPersonelID)
			SD2_LoadResults
			USE SET:C118("$ActionsTemp")
		: $1=Table:C252(->[DIARY:12])
			
	End case 
	//DB_bo_HideModuleBar:=True `use to test
	//Options for this form are.. No data editing..lisitng only(even if table rights are rw)
	//return selected record. Return selected records
	//Filters are available
	//selections are available
	//can subselect records(button option)
	$_bo_Continue:=False:C215
	$_ptr_Table:=Table:C252($1)
	If ($_bo_OpenRecord) & (Records in table:C83($_ptr_Table->)>1)
		//we have one record and want to open the record-but not if there is only one record in the table else we cant
		
		$_l_TableNumber:=$1
		DBI_DisplayRecord(Current process:C322; $_l_TableNumber; DB_t_CurrentContext)
		
	Else 
		//$_l_WindowID:=Open window(32;60;490+32;350+60;Plain window;"";"DB_WindowCallBack")
		$_l_ScreenNumber:=Menu bar screen:C441
		SCREEN COORDINATES:C438($_l_Windowleft; $_l_WindowTop; $_l_Windowright; $_l_Windowbottom; $_l_ScreenNumber)
		$_l_WindowID:=Open window:C153($_l_Windowleft+32; $_l_WindowTop+60; $_l_Windowleft+32; $_l_WindowTop+60; Plain window:K34:13; ""; "DB_WindowCallBack")
		PROC_SetProcess(Current process:C322; $_l_WindowID)
		If ($_bo_CustomView)
			If ($_l_FormTable>0)
				DIALOG:C40(Table:C252($_l_FormTable)->; $_t_FormName)
				
			Else 
				DIALOG:C40($_t_FormName)
				
			End if 
			
		Else 
			DIALOG:C40("DB_OutputForm")
		End if 
		$_bo_Continue:=(OK=1)
		CLOSE WINDOW:C154
		If (DB_l_CompanionWindow>0)
			SET PROCESS VARIABLE:C370(DB_l_CompanionWindow; PUR_bo_CANCEL; True:C214)
			POST OUTSIDE CALL:C329(DB_l_CompanionWindow)
		End if 
	End if 
	If ($_l_CalledFrom#Current process:C322)
		Process_End
		//and here if the selection has to be returned... do something
		If (DB_bo_ReturnSelection)
			$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
			
			If ($_bo_Continue)
				
				
				If ($_bo_Continue)
					USE NAMED SELECTION:C332("ReturnedSelection")
				Else 
					REDUCE SELECTION:C351($_ptr_Table->; 0)
				End if 
			End if 
			COPY NAMED SELECTION:C331($_ptr_Table->; $2)
		End if 
		//dislay list of records
	Else 
		If (DB_bo_ReturnSelection)
			If ($_bo_Continue)
				USE NAMED SELECTION:C332("ReturnedSelection")
			Else 
				$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
				REDUCE SELECTION:C351($_ptr_Table->; 0)
			End if 
		End if 
		
		
		DB_l_CurrentDisplayedForm:=$_l_CurrentDisplayedForm
		DB_t_CurrentContext:=$_t_CurrentContext
		DB_l_ViewType:=$_l_ViewType
		DB_bo_ShowTabBar:=$_bo_ShowTabBar
		DB_bo_HideModuleBar:=$_bo_HideModuleBar
		DB_bo_HideSearchBox:=$_bo_HideSearchBox
		DB_bo_StatsAvailabe:=$_bo_StatsAvailabe
		DB_Bo_GraphsAvailabe:=$_bo_GraphsAvailabe
		DB_Bo_GraphsAvailabe:=$_bo_GraphsAvailabe
		DB_bo_FiltersAvailable:=$_bo_FiltersAvailable
		DB_bo_SelectionsAvailable:=$_bo_SelectionsAvailable
		DB_l_WindowCurrentModule:=$_l_WindowCurrentModule
		DB_bo_ReturnSelection:=$_bo_ReturnSelection
		DB_bo_ShowCurrentSelection:=$_bo_ShowCurrentSelection
		DB_bo_EditinTransaction:=$_bo_EditinTransaction
	End if 
End if 
//
ERR_MethodTrackerReturn("DBI_DisplayRecords"; $_t_oldMethodName)
