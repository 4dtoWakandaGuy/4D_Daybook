If (False:C215)
	//Table Form Method Name: [COMPANIES]dScreenSaver
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(<>MOD_al_ModuleBarNum;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>SYS_l_CancelProcess; <>SYS_l_WindowTop; $_l_event; $_l_ModuleBar; $_l_WindowTop; bd1; bd10; bd11; bd12; bd2; bd3)
	C_LONGINT:C283(bd4; bd5; bd7; bd8; bd9; i)
	C_PICTURE:C286(<>PictScrnSav)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dScreenSaver"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dScreenSaver")
		If (Size of array:C274(<>MOD_al_ModuleBarNum)>=i)
			$_l_ModuleBar:=<>MOD_al_ModuleBarNum{i}
			$_l_ModuleBar:=$_l_ModuleBar+20300-(11*(Num:C11($_l_ModuleBar=32)))
			If ((DB_GetModuleSettingByNUM(1)=5) & (($_l_ModuleBar=20303) | ($_l_ModuleBar=20309) | ($_l_ModuleBar=20337)))
				$_l_ModuleBar:=$_l_ModuleBar+50
			End if 
			
		Else 
			CANCEL:C270
		End if 
		//GET PICTURE FROM LIBRARY($_l_ModuleBar; <>PictScrnSav)
		<>PictScrnSav:=Get_Picture($_l_ModuleBar)
	: ($_l_event=On Outside Call:K2:11)
		If (<>SYS_l_CancelProcess=Current process:C322)
			ACCEPT:C269
		Else 
			
			If (Is Windows:C1573)
				
				$_l_WindowTop:=24
				ON EVENT CALL:C190("")
				While (Process_No("$Events")>0)
					IDLE:C311  // 03/04/03 pb
					ON EVENT CALL:C190("")
				End while 
			Else 
				$_l_WindowTop:=0
			End if 
			
			If (bd1=0)
				i:=i+1
				If (i>Size of array:C274(<>MOD_al_ModuleBarNum))
					i:=1
				End if 
				$_l_ModuleBar:=<>MOD_al_ModuleBarNum{i}
				$_l_ModuleBar:=$_l_ModuleBar+20300-(11*(Num:C11($_l_ModuleBar=32)))
				If ((DB_GetModuleSettingByNUM(1)=5) & (($_l_ModuleBar=20303) | ($_l_ModuleBar=20309) | ($_l_ModuleBar=20337)))
					$_l_ModuleBar:=$_l_ModuleBar+50
				End if 
				//GET PICTURE FROM LIBRARY($_l_ModuleBar; <>PictScrnSav)
				<>PictScrnSav:=Get_Picture($_l_ModuleBar)
				bd10:=Random:C100%(((53+$_l_WindowTop+(bd8-(486+$_l_WindowTop)))-(53+$_l_WindowTop))+1)+53+$_l_WindowTop
				bd9:=Random:C100%((((<>SYS_l_WindowTop+50+$_l_WindowTop)+(bd7-(322+<>SYS_l_WindowTop)))-(<>SYS_l_WindowTop+50+$_l_WindowTop))+1)+(<>SYS_l_WindowTop+50+$_l_WindowTop)
				//wt_SET RECT (bd11;bd10;bd9;bd10+433;bd9+272)
				SET WINDOW RECT:C444(bd10; bd9; bd10+433; bd9+272; bd11)
				If (Is Windows:C1573)
					ON EVENT CALL:C190("On_EventSS"; "$Events")
				End if 
				
			Else 
				bd12:=bd12+1
				If (bd12>5)  //15
					bd12:=1
					i:=i+1
					If (i>Size of array:C274(<>MOD_al_ModuleBarNum))
						i:=1
					End if 
					$_l_ModuleBar:=<>MOD_al_ModuleBarNum{i}
					$_l_ModuleBar:=$_l_ModuleBar+20300-(11*(Num:C11($_l_ModuleBar=32)))
					If ((DB_GetModuleSettingByNUM(1)=5) & (($_l_ModuleBar=20303) | ($_l_ModuleBar=20309) | ($_l_ModuleBar=20337)))
						$_l_ModuleBar:=$_l_ModuleBar+50
					End if 
					//GET PICTURE FROM LIBRARY($_l_ModuleBar; <>PictScrnSav)
					<>PictScrnSav:=Get_Picture($_l_ModuleBar)
				End if 
				
				If (bd2=1)
					If ((bd9+290)>bd7)
						bd2:=-1
					End if 
				Else 
					If (bd4=0)
						bd2:=1
					End if 
				End if 
				If (bd3=1)
					If ((bd10+449)>bd8)
						bd3:=-1
					End if 
				Else 
					If (bd5=0)
						bd3:=1
					End if 
				End if 
				bd4:=bd4+(bd2*16)
				bd5:=bd5+(bd3*16)
				If (bd7>342)
					bd9:=(<>SYS_l_WindowTop+50+$_l_WindowTop)+(bd4)  //18*
					bd10:=53+(bd5)  //16*
				End if 
				SET WINDOW RECT:C444(bd10; bd9; bd10+433; bd9+272; bd11)
				//  wt_SET RECT(bd11;bd10;bd9;bd10+433;bd9+272)
				If (Is Windows:C1573)
					ON EVENT CALL:C190("On_EventSS"; "$Events")
				End if 
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("FM:dScreenSaver"; $_t_oldMethodName)
