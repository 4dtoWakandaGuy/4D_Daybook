//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Menu ModBarButt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/03/2010 13:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>SCPT_EXECUTE)
	//ARRAY INTEGER(<>MOD_al_ModuleBarNum;0)
	//ARRAY TEXT(<>Mod_at_ProcessFunction;0)
	//ARRAY TEXT(MOD_at_ModuleName;0)
	C_BOOLEAN:C305(<>MenuFront; MENU_bo_Overwrite)
	C_LONGINT:C283(<>BUTTPROC; <>MENU_l_BarModule; <>MenuProc; $_l_MenuProc; $_l_ModuleNumber; $1; $2; $4; vSNo)
	C_PICTURE:C286(BAR_Pic_Logo)
	C_POINTER:C301($_ptr_BarModule; $_ptr_BarNumberArray; $3; $5)
	C_TEXT:C284(<>EXECUTE; $_t_oldMethodName; vSolution)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Menu ModBarButt")
//Menu ModBarButt - used by dModulesTrad

//TRACE
If (<>MenuProc=0)
	<>MenuProc:=1
End if 

While (Semaphore:C143("$BarMod"))
	DelayTicks
End while 
If (Count parameters:C259>=3)
	$_ptr_BarNumberArray:=$3
Else 
	$_ptr_BarNumberArray:=-><>MOD_al_ModuleBarNum
	
End if 
If (Count parameters:C259>=4)
	$_l_ModuleNumber:=$4
Else 
	$_l_ModuleNumber:=vSNo
End if 
If (Count parameters:C259>=5)
	$_ptr_BarModule:=$5
Else 
	$_ptr_BarModule:=-><>MENU_l_BarModule
End if 
If (Count parameters:C259>=2)
	$_l_MenuProc:=$2
Else 
	$_l_MenuProc:=<>MenuProc
End if 
//C_POINTER($p)
Case of 
	: ($1=1)
		<>SCPT_EXECUTE:="About_Daybook"
		Gen_PostKey(1; 61; 256)
		//$p:=Get pointer("bd"+String($1))
		// $p»:=0
		$1:=Find in array:C230($_ptr_BarNumberArray->; $_l_ModuleNumber)
		If ($1>0)
			//  $p:=Get pointer("bd"+String($1+1))
			//  $p»:=1
		End if 
	: ($1>1)
		$1:=$1-1
		
		If (Size of array:C274($_ptr_BarNumberArray->)>=$1)
			If ($_ptr_BarNumberArray->{$1}<=Size of array:C274(<>Mod_at_ProcessFunction))
				If (<>Mod_at_ProcessFunction{$_ptr_BarNumberArray->{$1}}#"")
					If (Picture size:C356(BAR_Pic_Logo)>0)
						vSolution:=Uppers2(Uppers3(Lowercase:C14(MOD_at_ModuleName{$1}); 2); 2)
					Else 
						vSolution:=Uppers2(Uppers3(Lowercase:C14(MOD_at_ModuleName{$1}); 2); 2)+Char:C90(13)+DB_GetOrganisationScreenName
					End if 
					
					Modules_MenuExe(<>Mod_at_ProcessFunction{$_ptr_BarNumberArray->{$1}}; $_l_MenuProc)
					
					
					
					<>MenuFront:=True:C214
					//  SET COLOR(vSolution;-57331)  `-(243+(256*223)))
					Gen_SetModCol
					$_l_ModuleNumber:=$_ptr_BarModule->
					
				End if 
			Else 
				//BEEP
			End if 
		Else 
			BRING TO FRONT:C326(<>MenuProc)
			// SET COLOR(vSolution;-57331)  `-(243+(256*223)))
			<>MenuFront:=True:C214
			Gen_SetModCol
			
			
		End if 
		
End case 
CLEAR SEMAPHORE:C144("$BarMod")

//$VolumesMenu:=Get localized string("Menu_Volumes")
//If (Process number("$Processes")>0)  //bsw 17/08/04
//DB_MenuAction ($VolumesMenu;Get localized string("MenuItem_WindowsPalette");4;"18";<>menuProc;False)

//Else
//DB_MenuAction ($VolumesMenu;Get localized string("MenuItem_WindowsPalette");4;"";<>menuProc;False)

//End if
ERR_MethodTrackerReturn("Menu ModBarButt"; $_t_oldMethodName)
