//%attributes = {}
If (False:C215)
	//Project Method Name:      WS_SETPALLETTEBUTTONS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/12 9:25 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ButtonDisable; 0)
	//ARRAY LONGINT(DB_al_ButtonsAssigned;0)
	ARRAY TEXT:C222($_at_HelpTexts; 0)
	//ARRAY TEXT(DB_at_ToolPalletteTIPS;0)
	//ARRAY TEXT(SYS_at_HelpTexts;0)
	C_BOOLEAN:C305($_bo_Update; $1; BUT_bo_Floating; PAL_bo_BUtton3disabled; PAL_bo_BUtton5disabled)
	C_LONGINT:C283(<>ToolpalletteSets; $_l_Button3Status; $_l_Button5Status; $_l_ButtonCount; $_l_CurrentButton; $_l_Height; $_l_Index; $_l_Space; DB_l_Buttons; PAL_but_FirstRecord; PAL_but_FirstRecord9)
	C_LONGINT:C283(PAL_but_LastRecord; PAL_but_NextRecord; PAL_but_PreviousRecord; PAL_BUTTON_1; PAL_BUTTON_11; PAL_BUTTON_12; PAL_BUTTON_13; PAL_BUTTON_14; PAL_BUTTON_15; PAL_BUTTON_16; PAL_BUTTON_17)
	C_LONGINT:C283(PAL_BUTTON_18; PAL_BUTTON_19; PAL_BUTTON_2; PAL_BUTTON_20; PAL_BUTTON_21; PAL_BUTTON_22; PAL_BUTTON_23; PAL_BUTTON_24; PAL_BUTTON_25; PAL_BUTTON_26; PAL_BUTTON_27)
	C_LONGINT:C283(PAL_BUTTON_28; PAL_BUTTON_29; PAL_BUTTON_3; PAL_BUTTON_30; PAL_BUTTON_31; PAL_BUTTON_32; PAL_BUTTON_33; PAL_BUTTON_4; PAL_BUTTON_5; PAL_BUTTON_6; SIZ_l_PALBOTTOM)
	C_LONGINT:C283(SIZ_l_PALLEFT; SIZ_l_PALRIGHT; SIZ_l_PALTOP; TRACETHIS)
	C_PICTURE:C286($NULLPIC; PAL_pi_GRAPHIC_1; PAL_pi_GRAPHIC_10; PAL_pi_GRAPHIC_11; PAL_pi_GRAPHIC_12; PAL_pi_GRAPHIC_13; PAL_pi_GRAPHIC_14; PAL_pi_GRAPHIC_15; PAL_pi_GRAPHIC_16; PAL_pi_GRAPHIC_17; PAL_pi_GRAPHIC_18)
	C_PICTURE:C286(PAL_pi_GRAPHIC_19; PAL_pi_GRAPHIC_2; PAL_pi_GRAPHIC_20; PAL_pi_GRAPHIC_21; PAL_pi_GRAPHIC_22; PAL_pi_GRAPHIC_23; PAL_pi_GRAPHIC_24; PAL_pi_GRAPHIC_25; PAL_pi_GRAPHIC_26; PAL_pi_GRAPHIC_27; PAL_pi_GRAPHIC_28)
	C_PICTURE:C286(PAL_pi_GRAPHIC_29; PAL_pi_GRAPHIC_3; PAL_pi_GRAPHIC_30; PAL_pi_GRAPHIC_31; PAL_pi_GRAPHIC_32; PAL_pi_GRAPHIC_33; PAL_pi_GRAPHIC_4; PAL_pi_GRAPHIC_5; PAL_pi_GRAPHIC_6; PAL_pi_GRAPHIC_7; PAL_pi_GRAPHIC_8)
	C_PICTURE:C286(PAL_pi_GRAPHIC_9)
	C_POINTER:C301($_ptr_Button2; $_ptr_Button3; $_ptr_Button4; $_ptr_ButtonPicture)
	C_REAL:C285($_l_Half; $10; $11; $12; $13; $14; $15; $16; $17; $18; $19)
	C_REAL:C285($2; $20; $21; $22; $23; $24; $25; $26; $27; $28; $29)
	C_REAL:C285($3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_oldMethodName; FB_S255_Help1; FB_S255_Help10; FB_S255_Help11; FB_S255_Help12; FB_S255_Help13; FB_S255_Help14; FB_S255_Help15; FB_S255_Help16; FB_S255_Help17; FB_S255_Help18)
	C_TEXT:C284(FB_S255_Help19; FB_S255_Help2; FB_S255_Help20; FB_S255_Help21; FB_S255_Help22; FB_S255_Help23; FB_S255_Help24; FB_S255_Help25; FB_S255_Help26; FB_S255_Help27; FB_S255_Help28)
	C_TEXT:C284(FB_S255_Help29; FB_S255_Help3; FB_S255_Help30; FB_S255_Help31; FB_S255_Help32; FB_S255_Help33; FB_S255_Help34; FB_S255_Help35; FB_S255_Help36; FB_S255_Help37; FB_S255_Help38)
	C_TEXT:C284(FB_S255_Help39; FB_S255_Help4; FB_S255_Help40; FB_S255_Help5; FB_S255_Help6; FB_S255_Help7; FB_S255_Help8; FB_S255_Help9; PAL_t_ToolTip_1; PAL_t_ToolTip_10; PAL_t_ToolTip_11)
	C_TEXT:C284(PAL_t_ToolTip_12; PAL_t_ToolTip_13; PAL_t_ToolTip_14; PAL_t_ToolTip_15; PAL_t_ToolTip_16; PAL_t_ToolTip_17; PAL_t_ToolTip_18; PAL_t_ToolTip_19; PAL_t_ToolTip_2; PAL_t_ToolTip_20; PAL_t_ToolTip_21)
	C_TEXT:C284(PAL_t_ToolTip_22; PAL_t_ToolTip_23; PAL_t_ToolTip_24; PAL_t_ToolTip_25; PAL_t_ToolTip_26; PAL_t_ToolTip_27; PAL_t_ToolTip_28; PAL_t_ToolTip_29; PAL_t_ToolTip_3; PAL_t_ToolTip_30; PAL_t_ToolTip_31)
	C_TEXT:C284(PAL_t_ToolTip_32; PAL_t_ToolTip_33; PAL_t_ToolTip_4; PAL_t_ToolTip_5; PAL_t_ToolTip_6; PAL_t_ToolTip_7; PAL_t_ToolTip_8; PAL_t_ToolTip_9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WS_SETPALLETTEBUTTONS")
//<>PER_bo_CurrentNoButtHIDE:=True
//TRACE
C_LONGINT:C283(TRACETHIS)
If (TRACETHIS=0)
	TRACETHIS:=1
End if 
If (Count parameters:C259>=1)
	STRING LIST TO ARRAY:C511(17000; $_at_HelpTexts)
	If (False:C215)
		//_o_ARRAY TO STRING LIST(SYS_at_HelpTexts;17000)
	End if 
	ARRAY TEXT:C222(SYS_at_HelpTexts; 33)
	ARRAY LONGINT:C221($_al_ButtonDisable; Size of array:C274(DB_al_ButtonsAssigned))
	For ($_l_Index; 1; 33)
		Case of 
			: ($1)  //going to set some as enabled
				//so set all disabled first
				DB_al_ButtonsAssigned{$_l_Index}:=0
			Else   //going to set some as disabled
				//so set all f first
				DB_al_ButtonsAssigned{$_l_Index}:=1
		End case 
		
	End for 
	For ($_l_Index; 2; Count parameters:C259)
		DB_al_ButtonsAssigned{${$_l_Index}}:=Num:C11($1)
	End for 
	$_l_CurrentButton:=1
	For ($_l_Index; 1; 33)
		If (DB_al_ButtonsAssigned{$_l_Index}=1) | (True:C214)
			If (DB_al_ButtonsAssigned{$_l_Index}=0)
				$_al_ButtonDisable{$_l_Index}:=1
				//so we can 'grey it out'
			Else 
				$_al_ButtonDisable{$_l_Index}:=0
			End if 
			
			DB_al_ButtonsAssigned{$_l_Index}:=$_l_CurrentButton
			$_l_CurrentButton:=$_l_CurrentButton+1
		End if 
	End for 
	//NOW ASSIGN THE GRAPHICS TO THE BUTTONS
	//<>PER_bo_CurrentNoButtGrey:=False
	//TRACE
	$_l_CurrentButton:=1
	$_l_Button3Status:=0
	$_l_Button5Status:=0
	For ($_l_Index; 1; 33)
		
		$_ptr_ButtonPicture:=Get pointer:C304("PAL_pi_GRAPHIC_"+String:C10($_l_CurrentButton))
		$_ptr_Button2:=Get pointer:C304("PAL_t_ToolTip_"+String:C10($_l_CurrentButton))
		//$_ptr_Button2->:=DB_at_ToolPalletteTIPS{$_l_Index}
		If (DB_al_ButtonsAssigned{$_l_Index}>0)
			SYS_at_HelpTexts{$_l_CurrentButton}:=DB_at_ToolPalletteTIPS{$_l_Index}
			$_l_ButtonCount:=$_l_ButtonCount+1
			$_ptr_ButtonPicture->:=DB_apic_ToolPalleteICONS{<>ToolpalletteSets}{$_l_Index}
			$_ptr_Button2->:=DB_at_ToolPalletteTIPS{$_l_Index}
			$_ptr_Button3:=Get pointer:C304("PAL_BUTTON_"+String:C10($_l_CurrentButton))
			//$other:=0
			If (TRACETHIS=1)
				//TRACE
				TRACETHIS:=-1
			End if 
			//we set button 30 to same
			If ($_al_ButtonDisable{$_l_Index}=1)  //& (Not(◊NoButtGrey))
				
				OBJECT SET ENABLED:C1123($_ptr_Button3->; False:C215)
				If ($_l_CurrentButton=3)
					PAL_bo_BUtton3disabled:=True:C214
				End if 
				If ($_l_CurrentButton=5)
					PAL_bo_BUtton5disabled:=True:C214
				End if 
				If ($_l_CurrentButton=3)  //& (False)
					OBJECT SET VISIBLE:C603($_ptr_Button3->; True:C214)
					//this is the delete button..
					$_l_Button3Status:=-1
					$_ptr_Button4:=Get pointer:C304("PAL_BUTTON_"+String:C10(5))
					OBJECT SET VISIBLE:C603($_ptr_Button4->; False:C215)
				End if 
				If ($_l_CurrentButton=5)  //& (False)
					If ($_l_Button3Status<=-1)
						$_l_Button5Status:=2
						OBJECT SET VISIBLE:C603($_ptr_Button3->; True:C214)  //Set button 5 to show..hide button 3
						//this is the delete button..
						$_l_Button3Status:=-2
						$_ptr_Button4:=Get pointer:C304("PAL_BUTTON_"+String:C10(3))
						OBJECT SET VISIBLE:C603($_ptr_Button4->; False:C215)
					Else 
						$_l_Button5Status:=2
						OBJECT SET VISIBLE:C603($_ptr_Button3->; True:C214)  //Set button 5 to hide..show button 3
						$_ptr_Button4:=Get pointer:C304("PAL_BUTTON_"+String:C10(3))
						OBJECT SET VISIBLE:C603($_ptr_Button4->; True:C214)
					End if 
				End if 
				
				//SET VISIBLE($_ptr_Button3->;False)
				If (($_l_Index<=33) & ($_l_Index>0))
					$_ptr_ButtonPicture:=Get pointer:C304("PAL_pi_GRAPHIC_"+String:C10($_l_Index))
					//$_ptr_ButtonPicture->:=DB_apic_ToolPalleteICONS{2}{$_l_Index}
				End if 
				
			Else 
				If (TRACETHIS=1)
					TRACE:C157
					TRACETHIS:=-1
				End if 
				OBJECT SET VISIBLE:C603($_ptr_Button3->; True:C214)
				OBJECT SET ENABLED:C1123($_ptr_Button3->; True:C214)
				If ($_l_CurrentButton=3)
					PAL_bo_BUtton3disabled:=False:C215
				End if 
				If ($_l_CurrentButton=5)
					PAL_bo_BUtton5disabled:=False:C215
				End if 
				
				If ($_l_CurrentButton=3)  // & (False)
					$_l_Button3Status:=2
					$_l_Button5Status:=-1
					//this is the delete button..
					//$_ptr_Button4:=Get pointer("PAL_BUTTON_"+String(5))
					OBJECT SET VISIBLE:C603(*; "oMinusOptionButton"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oMinusButton"; True:C214)
				End if 
				If ($_l_CurrentButton=5) & (False:C215)
					If ($_l_Button3Status>=0)
						//this is the delete button..
						$_l_Button5Status:=2
						//$_ptr_Button4:=Get pointer("PAL_BUTTON_"+String(3))
						OBJECT SET VISIBLE:C603(*; "oMinusButton"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oMinusOptionButton"; True:C214)
					Else 
						OBJECT SET VISIBLE:C603(*; "oMinusButton"; True:C214)
						OBJECT SET VISIBLE:C603(*; "oMinusOptionButton"; False:C215)
						$_l_Button5Status:=-2
					End if 
				End if 
				If (($_l_Index<=33) & ($_l_Index>0))
					$_ptr_ButtonPicture:=Get pointer:C304("PAL_pi_GRAPHIC_"+String:C10($_l_Index))
					//$_ptr_ButtonPicture->:=DB_apic_ToolPalleteICONS{1}{$_l_Index}
				End if 
				
			End if 
			If ($_l_Index=12)
				$_al_ButtonDisable{30}:=$_al_ButtonDisable{$_l_Index}
			End if 
			If ($_l_Index=20)
				$_al_ButtonDisable{29}:=$_al_ButtonDisable{$_l_Index}
			End if 
			If ($_l_Index=25)
				$_al_ButtonDisable{31}:=$_al_ButtonDisable{$_l_Index}
			End if 
			If ($_l_Index=26)
				$_al_ButtonDisable{32}:=$_al_ButtonDisable{$_l_Index}
			End if 
			$_l_CurrentButton:=$_l_CurrentButton+1
		End if 
	End for 
	If ($_l_Button3Status=-2) & ($_l_Button5Status=-2) & (False:C215)
		//Both buttons hidden
		$_ptr_Button3:=Get pointer:C304("PAL_BUTTON_"+String:C10(3))
		OBJECT SET VISIBLE:C603($_ptr_Button3->; True:C214)
	End if 
	While ($_l_CurrentButton<=32)
		//IDLE  ` 7/04/03 pb
		$_ptr_ButtonPicture:=Get pointer:C304("PAL_pi_GRAPHIC_"+String:C10($_l_CurrentButton))
		$_ptr_Button2:=Get pointer:C304("PAL_t_ToolTip_"+String:C10($_l_CurrentButton))
		$_l_CurrentButton:=$_l_CurrentButton+1
		//$_ptr_ButtonPicture->:=$NULLPIC
		$_ptr_Button2->:=""
	End while 
	
	$_l_Half:=$_l_ButtonCount/2
	If (Int:C8($_l_Half)#$_l_Half)
		//odd number
		$_l_ButtonCount:=$_l_ButtonCount+1
	End if 
	$_l_Space:=0
	Case of 
		: ($_l_ButtonCount>32)
			$_l_Space:=20
			$_l_ButtonCount:=32
			
		: ($_l_ButtonCount>20)
			$_l_Space:=20
			
		: ($_l_ButtonCount>10)
			$_l_Space:=10
		: ($_l_ButtonCount>2)
			$_l_Space:=5
			
			
	End case 
	If (False:C215)
		If (Size of array:C274(SYS_at_HelpTexts)#Size of array:C274($_at_HelpTexts))
			//_O_ARRAY TO STRING LIST(SYS_at_HelpTexts;17000)
			
		Else 
			$_bo_Update:=False:C215
			For ($_l_Index; 1; Size of array:C274($_at_HelpTexts))
				If ($_at_HelpTexts{$_l_Index}#SYS_at_HelpTexts{$_l_Index})
					$_bo_Update:=True:C214
					$_l_Index:=99999
				End if 
			End for 
			If ($_bo_Update)
				
				
				_O_ARRAY TO STRING LIST:C512(SYS_at_HelpTexts; 17000)
				
				
			End if 
			
		End if 
	Else 
		For ($_l_Index; 1; Size of array:C274(DB_at_ToolPalletteTIPS))
			If ($_l_Index<34)
				$_ptr_ButtonPicture:=Get pointer:C304("FB_S255_Help"+String:C10($_l_Index))
				$_ptr_ButtonPicture->:=$_at_HelpTexts{$_l_Index}
			End if 
			
		End for 
	End if 
	If (False:C215)
		GET WINDOW RECT:C443(SIZ_l_PALLEFT; SIZ_l_PALTop; SIZ_l_PALRight; SIZ_l_PALBottom)
		If (BUT_bo_Floating)
			$_l_Height:=28*($_l_ButtonCount/2)+$_l_Space+12
		Else 
			$_l_Height:=28*($_l_ButtonCount/2)+$_l_Space+12
		End if 
		
		SET WINDOW RECT:C444(SIZ_l_PALLEFT; SIZ_l_PALTop; SIZ_l_PALRight; SIZ_l_PALTop+$_l_Height-12)
	End if 
	
End if 
ERR_MethodTrackerReturn("WS_SETPALLETTEBUTTONS"; $_t_oldMethodName)
