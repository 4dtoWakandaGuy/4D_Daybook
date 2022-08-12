//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_ModBarLPBT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(<>MOD_al_ModuleBarNum;0)
	//ARRAY TEXT(<>Mod_at_ModuleName;0)
	//ARRAY TEXT(MOD_at_ModuleName;0)
	C_BOOLEAN:C305(<>ModuleIcons; <>SCPT_bo_NoAutoScripts)
	C_LONGINT:C283(<>MENU_l_BarModule; <>Mod_l_MaxModules; $_l_ModuleBarSize; $_l_ModuleRow; $_l_Result; vSNo)
	C_PICTURE:C286(<>PictIconPal; <>PictLogoPal; $_pic_ModuleIcon)
	C_TEXT:C284($_t_oldMethodName; vSolution)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_ModBarLPBT")
//Menu_ModBarLPBT - see also Menu_ModBarLPB



OBJECT SET FONT SIZE:C165(vSolution; 9)
If ((DB_GetModuleSettingByNUM(1))=5)
	//GET PICTURE FROM LIBRARY(20220; <>PictLogoPal)
	<>PictLogoPal:=Get_Picture(20220)
Else 
	//GET PICTURE FROM LIBRARY(20210; <>PictLogoPal)
	<>PictLogoPal:=Get_Picture(20210)
End if 

If ((DB_GetModuleSettingByNUM(1))=5)  //Silver or Gold ? button
	//GET PICTURE FROM LIBRARY(19798; <>PictIconPal)
	<>PictIconPal:=Get_Picture(19798)
Else 
	//GET PICTURE FROM LIBRARY(19799; <>PictIconPal)
	<>PictIconPal:=Get_Picture(19799)
End if 
While (Semaphore:C143("$BarMod"))
	DelayTicks
End while 
$_l_ModuleBarSize:=Size of array:C274(<>MOD_al_ModuleBarNum)
ARRAY TEXT:C222(MOD_at_ModuleName; $_l_ModuleBarSize)
//Gen_Alert ("4_"+String(Size of array(MOD_at_ModuleName)))
If (<>ModuleIcons)
	$_l_Result:=19800
Else 
	$_l_Result:=19700
End if 

For ($_l_ModuleRow; 1; $_l_ModuleBarSize)
	If (<>MOD_al_ModuleBarNum{$_l_ModuleRow}#30)
		If ((DB_GetModuleSettingByNUM(1))=5)  //Silver
			Case of 
				: (<>MOD_al_ModuleBarNum{$_l_ModuleRow}=1)  //Silver
					//GET PICTURE FROM LIBRARY(Menu_ModChkIcon(19702); $_pic_ModuleIcon)
					$_pic_ModuleIcon:=Get_Picture(Menu_ModChkIcon(19702))
					<>PictIconPal:=<>PictIconPal+$_pic_ModuleIcon
				: (<>MOD_al_ModuleBarNum{$_l_ModuleRow}=30)  //Silver Plus
					//GET PICTURE FROM LIBRARY(Menu_ModChkIcon(19730); $_pic_ModuleIcon)
					$_pic_ModuleIcon:=Get_Picture(Menu_ModChkIcon(19730))
					<>PictIconPal:=<>PictIconPal+$_pic_ModuleIcon
				: (<>MOD_al_ModuleBarNum{$_l_ModuleRow}=3)  //SilverWP - use the icon style
					//GET PICTURE FROM LIBRARY(Menu_ModChkIcon(19803); $_pic_ModuleIcon)
					$_pic_ModuleIcon:=Get_Picture(Menu_ModChkIcon(19803))
					<>PictIconPal:=<>PictIconPal+$_pic_ModuleIcon
				: (<>MOD_al_ModuleBarNum{$_l_ModuleRow}=9)  //Silver JC
					//GET PICTURE FROM LIBRARY(Menu_ModChkIcon(19809); $_pic_ModuleIcon)
					$_pic_ModuleIcon:=Get_Picture(Menu_ModChkIcon(19809))
					<>PictIconPal:=<>PictIconPal+$_pic_ModuleIcon
				: (<>MOD_al_ModuleBarNum{$_l_ModuleRow}=<>Mod_l_MaxModules)  //DM
					//GET PICTURE FROM LIBRARY(Menu_ModChkIcon(19837); $_pic_ModuleIcon)
					$_pic_ModuleIcon:=Get_Picture(Menu_ModChkIcon(19837))
					<>PictIconPal:=<>PictIconPal+$_pic_ModuleIcon
			End case 
		Else 
			Case of 
				: ((<>MOD_al_ModuleBarNum{$_l_ModuleRow}=12))  //Agency
					If (<>ModuleIcons)
						//GET PICTURE FROM LIBRARY($_l_Result+10; $_pic_ModuleIcon)
						$_pic_ModuleIcon:=Get_Picture(Menu_ModChkIcon($_l_Result+10))
						<>PictIconPal:=<>PictIconPal+$_pic_ModuleIcon
					Else 
						//GET PICTURE FROM LIBRARY($_l_Result+9; $_pic_ModuleIcon)
						$_pic_ModuleIcon:=Get_Picture(Menu_ModChkIcon($_l_Result+9))
						<>PictIconPal:=<>PictIconPal+$_pic_ModuleIcon
					End if 
				: ((<>MOD_al_ModuleBarNum{$_l_ModuleRow}=32) | (<>MOD_al_ModuleBarNum{$_l_ModuleRow}=43))  //Telephony & Internet = Remote Access
					//GET PICTURE FROM LIBRARY(Menu_ModChkIcon($_l_Result+21); $_pic_ModuleIcon)
					$_pic_ModuleIcon:=Get_Picture(Menu_ModChkIcon($_l_Result+21))
					<>PictIconPal:=<>PictIconPal+$_pic_ModuleIcon
				Else 
					//GET PICTURE FROM LIBRARY(Menu_ModChkIcon($_l_Result+<>MOD_al_ModuleBarNum{$_l_ModuleRow}); $_pic_ModuleIcon)
					$_pic_ModuleIcon:=Get_Picture(Menu_ModChkIcon($_l_Result+<>MOD_al_ModuleBarNum{$_l_ModuleRow}))
					<>PictIconPal:=<>PictIconPal+$_pic_ModuleIcon
			End case 
		End if 
		
		Case of 
			: ((<>MOD_al_ModuleBarNum{$_l_ModuleRow}=32) | (<>MOD_al_ModuleBarNum{$_l_ModuleRow}=21) | (<>MOD_al_ModuleBarNum{$_l_ModuleRow}=43))  //An exception
				MOD_at_ModuleName{$_l_ModuleRow}:="COMMUNICATIONS"
			: (<>MOD_al_ModuleBarNum{$_l_ModuleRow}=1)
				MOD_at_ModuleName{$_l_ModuleRow}:="DIARY & ACCOUNTS"
			: (<>MOD_al_ModuleBarNum{$_l_ModuleRow}=30)
				MOD_at_ModuleName{$_l_ModuleRow}:=Term_StoWT("SOP & STOCK CONTROL")
			Else 
				MOD_at_ModuleName{$_l_ModuleRow}:=Uppercase:C13(Term_AllWT(<>Mod_at_ModuleName{<>MOD_al_ModuleBarNum{$_l_ModuleRow}}))  //Module Name as def in Modules Array
		End case 
	End if 
End for 

//Set the State of the current Module
$_l_ModuleRow:=Find in array:C230(<>MOD_al_ModuleBarNum; <>MENU_l_BarModule)
If ($_l_ModuleRow>0)
	
	vSolution:=MOD_at_ModuleName{$_l_ModuleRow}
	vSNo:=<>MENU_l_BarModule
	If (<>SCPT_bo_NoAutoScripts=False:C215)
		PLAY:C290("Chord "+String:C10($_l_ModuleRow); 0)
	End if 
Else 
	vSNo:=0
	vSolution:=Uppercase:C13(<>Mod_at_ModuleName{<>MENU_l_BarModule})  //Set it to the basic Module name
	// - only used by Silver users with Gold Modules
End if 
CLEAR SEMAPHORE:C144("$BarMod")
Gen_SetModCol

If (Is Windows:C1573)
	OBJECT SET FONT SIZE:C165(vSolution; 12)
End if 
ERR_MethodTrackerReturn("Menu_ModBarLPBT"; $_t_oldMethodName)
