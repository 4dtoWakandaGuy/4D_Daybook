//%attributes = {}
If (False:C215)
	//Project Method Name:      DEI_RescueFormMethod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/09/2009 07:41:01If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DEI_at_AllTables;0)
	//ARRAY TEXT(DEI_at_DisplayAllTables;0)
	//ARRAY TEXT(DEI_at_DisplayRescueTables;0)
	//ARRAY TEXT(DEI_at_RescueTables;0)
	C_BOOLEAN:C305($_bo_UpdateObjects; DB_bo_NoLoad)
	C_LONGINT:C283($_l_Menu; $_l_MenuCommand; $_l_NextTableRow; $_l_RescueResult; $_l_TableRow; b_rescue_2004; b_rescue_Add; b_rescue_AddAll; b_rescue_all; b_rescue_now; b_rescue_Remove)
	C_LONGINT:C283(b_rescue_RemoveAll)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DEI_RescueFormMethod")
//bsw 15/12/03
//This form method for Daybook tools Rescue Form

$_bo_UpdateObjects:=False:C215


Case of 
		
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "DEI_Rescue")
		//If (Application type#4D Server )
		DB_SetMenuBar(""; 110)
		//End if
		SET TIMER:C645(30)
		ARRAY TEXT:C222(DEI_at_AllTables; 0)
		ARRAY TEXT:C222(DEI_at_DisplayAllTables; 0)
		
		ARRAY TEXT:C222(DEI_at_RescueTables; 0)
		ARRAY TEXT:C222(DEI_at_DisplayRescueTables; 0)
		
		DEI_Tables2Array(->DEI_at_AllTables; 1; ->DEI_at_DisplayAllTables)
		
		COPY ARRAY:C226(DEI_at_AllTables; DEI_at_RescueTables)
		COPY ARRAY:C226(DEI_at_DisplayAllTables; DEI_at_DisplayRescueTables)
		
		
		
	: (Form event code:C388=On Timer:K2:25)
		
		ARRAY TEXT:C222(DEI_at_AllTables; 0)
		ARRAY TEXT:C222(DEI_at_DisplayAllTables; 0)
		
		ARRAY TEXT:C222(DEI_at_RescueTables; 0)
		ARRAY TEXT:C222(DEI_at_DisplayRescueTables; 0)
		
		DEI_Tables2Array(->DEI_at_AllTables; 1; ->DEI_at_DisplayAllTables)
		
		COPY ARRAY:C226(DEI_at_AllTables; DEI_at_RescueTables)
		COPY ARRAY:C226(DEI_at_DisplayAllTables; DEI_at_DisplayRescueTables)
		
		SET TIMER:C645(0)
		If (Application type:C494#4D Server:K5:6)
			$_l_Menu:=2
			$_l_MenuCommand:=4
			DISABLE MENU ITEM:C150($_l_Menu; $_l_MenuCommand)
		End if 
		
		DEI_Tools
		
		$_bo_UpdateObjects:=True:C214
		
	: (Form event code:C388=On Activate:K2:9)
		OpenHelp(Table:C252(->[USER:15]); "DEI_Rescue")
		If (Application type:C494#4D Server:K5:6)
			$_l_Menu:=2
			$_l_MenuCommand:=4
			DISABLE MENU ITEM:C150($_l_Menu; $_l_MenuCommand)
			DEI_Tools
		End if 
		$_bo_UpdateObjects:=True:C214
		
	: (Form event code:C388=On Clicked:K2:4)
		
		Case of 
			: (b_rescue_all=1)
				
				DB_SetAlltriggers(-1)
				
				TBL_EXPORT
				ALERT:C41("Exit 4D server and start with a clean data file to re-import")
				CANCEL:C270
			: (b_rescue_2004=1)
				TBI_ImportFrom2004
			: (b_rescue_Add=1)
				
				If (DEI_at_DisplayAllTables>0) & (DEI_at_DisplayAllTables<=Size of array:C274(DEI_at_DisplayAllTables)) & (Size of array:C274(DEI_at_DisplayAllTables)>0)
					$_l_TableRow:=Find in array:C230(DEI_at_DisplayRescueTables; DEI_at_DisplayAllTables{DEI_at_DisplayAllTables})
					If ($_l_TableRow=-1)
						$_l_NextTableRow:=Size of array:C274(DEI_at_DisplayRescueTables)+1
						INSERT IN ARRAY:C227(DEI_at_DisplayRescueTables; $_l_NextTableRow; 1)
						DEI_at_DisplayRescueTables{$_l_NextTableRow}:=DEI_at_DisplayAllTables{DEI_at_DisplayAllTables}
						
						$_l_NextTableRow:=Size of array:C274(DEI_at_RescueTables)+1
						INSERT IN ARRAY:C227(DEI_at_RescueTables; $_l_NextTableRow; 1)
						DEI_at_RescueTables{$_l_NextTableRow}:=DEI_at_AllTables{DEI_at_DisplayAllTables}
					End if 
					
					DEI_at_DisplayAllTables:=DEI_at_DisplayAllTables+1  //Cursor to next item
					
				End if 
				
			: (b_rescue_AddAll=1)
				
				COPY ARRAY:C226(DEI_at_AllTables; DEI_at_RescueTables)
				COPY ARRAY:C226(DEI_at_DisplayAllTables; DEI_at_DisplayRescueTables)
				
			: (b_rescue_Remove=1)
				
				If (DEI_at_DisplayRescueTables{DEI_at_DisplayRescueTables}="FILES@")
					ALERT:C41("FILES table is mandatory to be rescued as it contains ID numbers!")
				Else 
					If (DEI_at_DisplayRescueTables>0) & (DEI_at_DisplayRescueTables<=Size of array:C274(DEI_at_DisplayRescueTables)) & (Size of array:C274(DEI_at_DisplayRescueTables)>0)
						If ((DEI_at_DisplayRescueTables<=Size of array:C274(DEI_at_DisplayRescueTables)) & (Size of array:C274(DEI_at_DisplayRescueTables)>0))
							DELETE FROM ARRAY:C228(DEI_at_DisplayRescueTables; DEI_at_DisplayRescueTables; 1)
							DELETE FROM ARRAY:C228(DEI_at_RescueTables; DEI_at_DisplayRescueTables; 1)
							If (DEI_at_DisplayRescueTables>1)
								DEI_at_DisplayRescueTables:=1
							End if 
						End if 
					End if 
				End if 
				
			: (b_rescue_RemoveAll=1)
				
				If (DEI_at_DisplayRescueTables{1}="FILES@")
					ARRAY TEXT:C222(DEI_at_RescueTables; 1)
					ARRAY TEXT:C222(DEI_at_DisplayRescueTables; 1)
				Else 
					ARRAY TEXT:C222(DEI_at_RescueTables; 0)
					ARRAY TEXT:C222(DEI_at_DisplayRescueTables; 0)
				End if 
				
			: (b_rescue_now=1)
				
				If (Size of array:C274(DEI_at_RescueTables)>0)
					$_l_RescueResult:=DEI_RescueData(->DEI_at_RescueTables)
					
					Case of 
						: ($_l_RescueResult=0)
							ALERT:C41("Rescue OK, Daybook rescue will Quit now. Restart "+"Daybook Tools and create new data file by holding down "+"the alt key on startup and recover data.")
							QUIT 4D:C291
					End case 
				End if 
				
		End case 
		
		DEI_Tools
		
	: (Form event code:C388=On Menu Selected:K2:14)
		
		DEI_Tools
		
	: (Form event code:C388=On Unload:K2:2)
		If (Application type:C494#4D Server:K5:6)
			$_l_Menu:=2
			$_l_MenuCommand:=4
			ENABLE MENU ITEM:C149($_l_Menu; $_l_MenuCommand)
		End if 
End case 

If ($_bo_UpdateObjects)
	$_bo_UpdateObjects:=False:C215
	
	If (Size of array:C274(DEI_at_DisplayRescueTables)>0)
		OBJECT SET ENABLED:C1123(b_rescue_Remove; True:C214)
		OBJECT SET ENABLED:C1123(b_rescue_RemoveAll; True:C214)
	Else 
		OBJECT SET ENABLED:C1123(b_rescue_Remove; False:C215)
		OBJECT SET ENABLED:C1123(b_rescue_RemoveAll; False:C215)
	End if 
	
	DEI_Tools
	
	Case of 
		: (Current user:C182="Designer")
			
			//: (Current user="Administrator")
			
			
		Else 
			
			OBJECT SET ENABLED:C1123(b_rescue_Add; False:C215)
			OBJECT SET ENABLED:C1123(b_rescue_AddAll; False:C215)
			OBJECT SET ENABLED:C1123(b_rescue_RemoveAll; False:C215)
			OBJECT SET ENABLED:C1123(b_rescue_Remove; False:C215)
			
	End case 
	
End if 
ERR_MethodTrackerReturn("DEI_RescueFormMethod"; $_t_oldMethodName)