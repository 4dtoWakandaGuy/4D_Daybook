If (False:C215)
	//Table Form Method Name: [USER]General_ChoiceFORM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_index; Gen_ChoicePage; GEN_OK)
	C_POINTER:C301($_ptr_Variable; $_ptr_Variable2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].General_ChoiceFORM"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "General_ChoiceFORM")
		
		WS_AutoscreenSize(3; 312; 412)
		INT_SetDialog
		
		GEN_OK:=0  //exit result
		Case of 
			: (Gen_ChoicePage=1)
				//remeber that with a radio button the first item should be the default
				
				For ($_l_index; 1; 10)
					
					$_ptr_Variable:=Get pointer:C304("Gen_Rad"+String:C10($_l_index))
					$_ptr_Variable2:=Get pointer:C304("Gen_ChoiceText"+String:C10($_l_index))
					OBJECT SET TITLE:C194($_ptr_Variable->; $_ptr_Variable2->)
					If ($_l_index=1)
						$_ptr_Variable->:=Num:C11($_l_index=1)
					End if 
					If (($_ptr_Variable2->)="")
						OBJECT SET VISIBLE:C603($_ptr_Variable->; False:C215)
					End if 
					
					
				End for 
				FORM GOTO PAGE:C247(1)
			: (Gen_ChoicePage=2)
				For ($_l_index; 1; 10)
					$_ptr_Variable:=Get pointer:C304("Gen_CB"+String:C10($_l_index))
					$_ptr_Variable2:=Get pointer:C304("Gen_ChoiceText"+String:C10($_l_index))
					OBJECT SET TITLE:C194($_ptr_Variable->; $_ptr_Variable2->)
					$_ptr_Variable->:=0
					If ($_ptr_Variable2->="")
						OBJECT SET VISIBLE:C603($_ptr_Variable->; False:C215)
					End if 
				End for 
				FORM GOTO PAGE:C247(2)
				
			Else 
				CANCEL:C270
		End case 
		
End case 
ERR_MethodTrackerReturn("FM [USER].General_ChoiceFORM"; $_t_oldMethodName)
