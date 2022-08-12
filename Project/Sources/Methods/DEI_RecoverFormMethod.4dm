//%attributes = {}
If (False:C215)
	//Project Method Name:      DEI_RecoverFormMethod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DEI_at_DisplayRecoverTables;0)
	//ARRAY TEXT(DEI_at_DisplayRescuedTables;0)
	//ARRAY TEXT(DEI_at_RecoverTables;0)
	//ARRAY TEXT(DEI_at_RescuedTables;0)
	C_BOOLEAN:C305($_bo_UpdateObjects; DB_bo_NoLoad)
	C_LONGINT:C283($_l_Menu; $_l_MenuCommand; $_l_NextTableRow; $_l_TableRow; $l_recover_result; b_recover_Add; b_recover_AddAll; b_recover_now; b_recover_Remove; b_recover_RemoveAll)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DEI_RecoverFormMethod")
//bsw 15/12/03
//This form method for Daybook tools Rescue Form

$_bo_UpdateObjects:=False:C215

Case of 
		
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "DEI_Recover")
		DB_SetMenuBar(""; 110)
		SET TIMER:C645(1)
		
	: (Form event code:C388=On Timer:K2:25)
		
		ARRAY TEXT:C222(DEI_at_RescuedTables; 0)
		ARRAY TEXT:C222(DEI_at_DisplayRescuedTables; 0)
		ARRAY TEXT:C222(DEI_at_RecoverTables; 0)
		ARRAY TEXT:C222(DEI_at_DisplayRecoverTables; 0)
		DEI_RescuedTables2Array(->DEI_at_RescuedTables; 1; ->DEI_at_DisplayRescuedTables)
		COPY ARRAY:C226(DEI_at_RescuedTables; DEI_at_RecoverTables)
		COPY ARRAY:C226(DEI_at_DisplayRescuedTables; DEI_at_DisplayRecoverTables)
		
		SET TIMER:C645(0)
		
		$_l_Menu:=2
		$_l_MenuCommand:=5
		DISABLE MENU ITEM:C150($_l_Menu; $_l_MenuCommand)
		DEI_Tools
		$_bo_UpdateObjects:=True:C214
		
	: (Form event code:C388=On Activate:K2:9)
		OpenHelp(Table:C252(->[USER:15]); "DEI_Recover")
		
		ARRAY TEXT:C222(DEI_at_RescuedTables; 0)
		ARRAY TEXT:C222(DEI_at_DisplayRescuedTables; 0)
		ARRAY TEXT:C222(DEI_at_RecoverTables; 0)
		ARRAY TEXT:C222(DEI_at_DisplayRecoverTables; 0)
		DEI_RescuedTables2Array(->DEI_at_RescuedTables; 1; ->DEI_at_DisplayRescuedTables)
		COPY ARRAY:C226(DEI_at_RescuedTables; DEI_at_RecoverTables)
		COPY ARRAY:C226(DEI_at_DisplayRescuedTables; DEI_at_DisplayRecoverTables)
		
		$_l_Menu:=2
		$_l_MenuCommand:=5
		DISABLE MENU ITEM:C150($_l_Menu; $_l_MenuCommand)
		DEI_Tools
		$_bo_UpdateObjects:=True:C214
		
	: (Form event code:C388=On Clicked:K2:4)
		
		Case of 
				
			: (b_recover_Add=1)
				
				If (DEI_at_DisplayRescuedTables>0) & (DEI_at_DisplayRescuedTables<=Size of array:C274(DEI_at_DisplayRescuedTables)) & (Size of array:C274(DEI_at_DisplayRescuedTables)>0)
					$_l_TableRow:=Find in array:C230(DEI_at_DisplayRecoverTables; DEI_at_DisplayRescuedTables{DEI_at_DisplayRescuedTables})
					If ($_l_TableRow=-1)
						$_l_NextTableRow:=Size of array:C274(DEI_at_DisplayRecoverTables)+1
						INSERT IN ARRAY:C227(DEI_at_DisplayRecoverTables; $_l_NextTableRow; 1)
						DEI_at_DisplayRecoverTables{$_l_NextTableRow}:=DEI_at_DisplayRescuedTables{DEI_at_DisplayRescuedTables}
						
						$_l_NextTableRow:=Size of array:C274(DEI_at_RecoverTables)+1
						INSERT IN ARRAY:C227(DEI_at_RecoverTables; $_l_NextTableRow; 1)
						DEI_at_RecoverTables{$_l_NextTableRow}:=DEI_at_RescuedTables{DEI_at_DisplayRescuedTables}
					End if 
					
					DEI_at_DisplayRescuedTables:=DEI_at_DisplayRescuedTables+1  //Cursor to next item
					
				End if 
				
				$_bo_UpdateObjects:=True:C214
				
			: (b_recover_AddAll=1)
				
				COPY ARRAY:C226(DEI_at_RescuedTables; DEI_at_RecoverTables)
				COPY ARRAY:C226(DEI_at_DisplayRescuedTables; DEI_at_DisplayRecoverTables)
				$_bo_UpdateObjects:=True:C214
				
			: (b_recover_Remove=1)
				If (DEI_at_DisplayRecoverTables{DEI_at_DisplayRecoverTables}="FILES@")
					ALERT:C41("FILES table is mandatory to be recovered as it contains ID numbers!")
				Else 
					If (DEI_at_DisplayRecoverTables>0) & (DEI_at_DisplayRecoverTables<=Size of array:C274(DEI_at_DisplayRecoverTables)) & (Size of array:C274(DEI_at_DisplayRecoverTables)>0)
						If ((DEI_at_DisplayRecoverTables<=Size of array:C274(DEI_at_DisplayRecoverTables)) & (Size of array:C274(DEI_at_DisplayRecoverTables)>0))
							DELETE FROM ARRAY:C228(DEI_at_DisplayRecoverTables; DEI_at_DisplayRecoverTables; 1)
							DELETE FROM ARRAY:C228(DEI_at_RecoverTables; DEI_at_DisplayRecoverTables; 1)
							If (DEI_at_DisplayRecoverTables>1)
								DEI_at_DisplayRecoverTables:=1
							End if 
						End if 
					End if 
				End if 
				$_bo_UpdateObjects:=True:C214
				
			: (b_recover_RemoveAll=1)
				
				If (DEI_at_DisplayRecoverTables{1}="FILES@")
					ARRAY TEXT:C222(DEI_at_RecoverTables; 1)
					ARRAY TEXT:C222(DEI_at_DisplayRecoverTables; 1)
				Else 
					ARRAY TEXT:C222(DEI_at_RecoverTables; 0)
					ARRAY TEXT:C222(DEI_at_DisplayRecoverTables; 0)
				End if 
				
				$_bo_UpdateObjects:=True:C214
				
			: (b_recover_now=1)
				
				If (Size of array:C274(DEI_at_RecoverTables)>0)
					
					$l_recover_result:=DEI_RecoverData(->DEI_at_RecoverTables; ->DEI_at_DisplayRecoverTables)
					
					If ($l_recover_result=0)
						
						ARRAY TEXT:C222(DEI_at_RescuedTables; 0)
						ARRAY TEXT:C222(DEI_at_DisplayRescuedTables; 0)
						ARRAY TEXT:C222(DEI_at_RecoverTables; 0)
						ARRAY TEXT:C222(DEI_at_DisplayRecoverTables; 0)
						DEI_RescuedTables2Array(->DEI_at_RescuedTables; 1; ->DEI_at_DisplayRescuedTables)
						COPY ARRAY:C226(DEI_at_RescuedTables; DEI_at_RecoverTables)
						COPY ARRAY:C226(DEI_at_DisplayRescuedTables; DEI_at_DisplayRecoverTables)
						
						CONFIRM:C162("Data recovered OK, You can restart "+"Daybook in Normal mode. Do you want to Quit Daybook recover now?")
						$_bo_UpdateObjects:=True:C214
						
						If (OK=1)
							QUIT 4D:C291
						End if 
					End if 
				End if 
				
			Else 
				
				ARRAY TEXT:C222(DEI_at_RescuedTables; 0)
				ARRAY TEXT:C222(DEI_at_DisplayRescuedTables; 0)
				ARRAY TEXT:C222(DEI_at_RecoverTables; 0)
				ARRAY TEXT:C222(DEI_at_DisplayRecoverTables; 0)
				DEI_RescuedTables2Array(->DEI_at_RescuedTables; 1; ->DEI_at_DisplayRescuedTables)
				COPY ARRAY:C226(DEI_at_RescuedTables; DEI_at_RecoverTables)
				COPY ARRAY:C226(DEI_at_DisplayRescuedTables; DEI_at_DisplayRecoverTables)
				
				$_bo_UpdateObjects:=True:C214
				
		End case 
		
	: (Form event code:C388=On Menu Selected:K2:14)
		
		DEI_Tools
		
	: (Form event code:C388=On Unload:K2:2)
		
		$_l_Menu:=2
		$_l_MenuCommand:=5
		ENABLE MENU ITEM:C149($_l_Menu; $_l_MenuCommand)
		
End case 

If ($_bo_UpdateObjects)
	$_bo_UpdateObjects:=False:C215
	
	If (Size of array:C274(DEI_at_DisplayRecoverTables)>0)
		OBJECT SET ENABLED:C1123(b_recover_Remove; True:C214)
		OBJECT SET ENABLED:C1123(b_recover_RemoveAll; True:C214)
	Else 
		OBJECT SET ENABLED:C1123(b_recover_Remove; False:C215)
		OBJECT SET ENABLED:C1123(b_recover_RemoveAll; False:C215)
	End if 
	
	DEI_Tools
	
	Case of 
		: (Current user:C182="Designer")
			
			//: (Current user="Administrator")
			
			
		Else 
			
			OBJECT SET ENABLED:C1123(b_recover_Add; False:C215)
			OBJECT SET ENABLED:C1123(b_recover_AddAll; False:C215)
			OBJECT SET ENABLED:C1123(b_recover_RemoveAll; False:C215)
			OBJECT SET ENABLED:C1123(b_recover_Remove; False:C215)
			
	End case 
End if 
ERR_MethodTrackerReturn("DEI_RecoverFormMethod"; $_t_oldMethodName)