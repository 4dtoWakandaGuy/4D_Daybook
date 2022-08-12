If (False:C215)
	//Table Form Method Name: [PERSONNEL]Ask_Person
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ABC_lb_LCS;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; PW_Bo_shake)
	C_LONGINT:C283($_l_event; $_l_FindPerson; $_l_NewWindowHeight; $_l_Ref; $_l_Select; $_l_WindowBottom; $_l_WindowHeight; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; ASK_l_BUT1)
	C_LONGINT:C283(ASK_l_BUT10; ASK_l_BUT11; ASK_l_BUT12; ASK_l_BUT13; ASK_l_BUT14; ASK_l_BUT15; ASK_l_BUT16; ASK_l_BUT17; ASK_l_BUT18; ASK_l_BUT19; ASK_l_BUT2)
	C_LONGINT:C283(ASK_l_BUT20; ASK_l_BUT21; ASK_l_BUT22; ASK_l_BUT23; ASK_l_BUT24; ASK_l_BUT25; ASK_l_BUT26; ASK_l_BUT27; ASK_l_BUT3; ASK_l_BUT4; ASK_l_BUT5)
	C_LONGINT:C283(ASK_l_BUT6; ASK_l_BUT7; ASK_l_BUT8; ASK_l_BUT9; PW_l_SHakeCount; PW_l_WinBottom; PW_l_WinBottom2; PW_l_winLeft; PW_l_winLeft2; PW_l_WinRIght; PW_l_WinRIght2)
	C_LONGINT:C283(PW_l_Wintop; PW_l_Wintop2; xCancel)
	C_PICTURE:C286(<>PictLogoMed)
	C_TEXT:C284(<>DB_t_PassLock; <>DB_t_Password; $_t_CurrentMachineOwner; $_t_GroupCode; $_t_oldMethodName; oASK_COL1; oASK_COL10; oASK_COL11; oASK_COL12; oASK_COL13; oASK_COL14)
	C_TEXT:C284(oASK_COL15; oASK_COL16; oASK_COL17; oASK_COL18; oASK_COL19; oASK_COL2; oASK_COL20; oASK_COL21; oASK_COL22; oASK_COL23; oASK_COL24)
	C_TEXT:C284(oASK_COL25; oASK_COL26; oASK_COL27; oASK_COL3; oASK_COL4; oASK_COL5; oASK_COL6; oASK_COL7; oASK_COL8; oASK_COL9; oASK_HED1)
	C_TEXT:C284(oASK_HED10; oASK_HED11; oASK_HED12; oASK_HED13; oASK_HED14; oASK_HED15; oASK_HED16; oASK_HED17; oASK_HED18; oASK_HED19; oASK_HED2)
	C_TEXT:C284(oASK_HED20; oASK_HED21; oASK_HED22; oASK_HED23; oASK_HED24; oASK_HED25; oASK_HED26; oASK_HED27; oASK_HED3; oASK_HED4; oASK_HED5)
	C_TEXT:C284(oASK_HED6; oASK_HED7; oASK_HED8; oASK_HED9; WS_t_Password)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [PERSONNEL].Ask_Person"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//GET PICTURE FROM LIBRARY(20240; <>PictLogoMed)
		<>PictLogoMed:=Get_Picture(20240)
		SPLASH_HIDE
		
		If (Current user:C182="Designer") & (Not:C34(Is compiled mode:C492))
			OBJECT SET VISIBLE:C603(WS_t_Password; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(WS_t_Password; False:C215)
		End if 
		GEN_at_Name:=1
		
		If (Is Windows:C1573)
			OBJECT SET TITLE:C194(xCancel; "Exit")
			// Else
			
		End if 
		OBJECT SET FONT:C164(*; "oACCLoginPasswordEnter"; "%Password")
		OBJECT SET FONT:C164(<>DB_t_Password; "%Password")
		OBJECT SET FONT SIZE:C165(<>DB_t_Password; 12)
		<>DB_t_PassLock:=""
		ON EVENT CALL:C190("")
		//ON EVENT CALL("On_EventID";"$Events")//NG May 2017 changing this-its not working correctly in V16
		
		$_l_WindowHeight:=((Size of array:C274(GEN_at_Name))*12)
		If ($_l_WindowHeight>600)
			$_l_WindowHeight:=600
		Else 
			If ($_l_WindowHeight<335)
				$_l_WindowHeight:=335
			End if 
		End if 
		$_l_NewWindowHeight:=$_l_WindowHeight+(504-(335))
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		
		WS_AutoscreenSize(2; $_l_NewWindowHeight; $_l_WindowRight-$_l_WindowLeft)
		
		INT_SetDialog
		
		//TRACE
		LB_SetupListbox(->ABC_lb_LCS; "oASK"; "ASK_L"; 1; ->GEN_at_Name; ->GEN_at_Identity; ->GEN_at_RecordCode)
		LB_SetColumnHeaders(->ABC_lb_LCS; "ASK_L"; 1; "ID"; "Name"; "ident"; "Inits")
		LB_SetColumnWidths(->ABC_lb_LCS; "oASK"; 1; 327; 327; 327)
		LB_SetEnterable(->ABC_lb_LCS; False:C215; 0)
		LB_SetScroll(->ABC_lb_LCS; -3; -2)
		//TRACE
		$_t_CurrentMachineOwner:=Current system user:C484
		//$_t_CurrentMachineOwner:="Lance Beecheno"
		$_l_Select:=Find in array:C230(GEN_at_Name; $_t_CurrentMachineOwner)
		If ($_l_Select>0)
			GEN_at_Name:=$_l_Select
			LISTBOX SELECT ROW:C912(*; "oLCS"; $_l_Select)
			GOTO OBJECT:C206(*; "oACCLoginPasswordEnter")
			
		Else 
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$_t_CurrentMachineOwner)
			
			If (Records in selection:C76([PERSONNEL:11])>0)
				$_t_GroupCode:=[PERSONNEL:11]Group_Code:28
				$_l_Ref:=Find in array:C230(GEN_at_RecordCode; $_t_GroupCode)
				If ($_l_Ref>0)
					GEN_at_Name:=$_l_Ref
					Ask_PersonIns
					For ($_l_FindPerson; $_l_Ref; Size of array:C274(GEN_at_RecordCode))
						If (Position:C15($_t_CurrentMachineOwner; GEN_at_Name{$_l_FindPerson})>0)
							$_l_Select:=$_l_FindPerson
							$_l_FindPerson:=Size of array:C274(GEN_at_RecordCode)
						End if 
					End for 
					If ($_l_Select>0)
						GEN_at_Name:=$_l_Select
						LISTBOX SELECT ROW:C912(*; "oLCS"; $_l_Select)
						GOTO OBJECT:C206(*; "oACCLoginPasswordEnter")
					End if 
					
				End if 
				
			End if 
			UNLOAD RECORD:C212([PERSONNEL:11])
		End if 
		//LB_StyleSettings (->ABC_lb_LCS;"Black";9;"STK_t";->[ACCOUNTS])
		
		
	: ($_l_event=On Outside Call:K2:11)
		If (PW_Bo_shake)
			//TRACE
			If (PW_l_SHakeCount=0)
				GET WINDOW RECT:C443(PW_l_winLeft; PW_l_Wintop; PW_l_WinRIght; PW_l_WinBottom)
				
			End if 
			Repeat 
				If (PW_l_SHakeCount<10)
					GET WINDOW RECT:C443(PW_l_winLeft2; PW_l_Wintop2; PW_l_WinRIght2; PW_l_WinBottom2)
					If (PW_l_winLeft2<PW_l_winLeft)
						SET WINDOW RECT:C444(PW_l_winLeft+10; PW_l_Wintop; PW_l_WinRIght+10; PW_l_WinBottom)
					Else 
						SET WINDOW RECT:C444(PW_l_winLeft-10; PW_l_Wintop; PW_l_WinRIght-10; PW_l_WinBottom)
					End if 
					PW_l_SHakeCount:=PW_l_SHakeCount+1
					DELAY PROCESS:C323(Current process:C322; 1)
					//CALL PROCESS(Current process)
				Else 
					PW_l_SHakeCount:=0
					PW_Bo_shake:=False:C215
					SET WINDOW RECT:C444(PW_l_winLeft; PW_l_Wintop; PW_l_WinRIght; PW_l_WinBottom)
				End if 
			Until (PW_l_SHakeCount>=10)
			PW_l_SHakeCount:=0
		End if 
		
	: ($_l_event=On Clicked:K2:4)
		If (False:C215)
			$_l_WindowHeight:=((Size of array:C274(GEN_at_Name))*12)
			If ($_l_WindowHeight>600)
				$_l_WindowHeight:=600
			Else 
				If ($_l_WindowHeight<335)
					$_l_WindowHeight:=335
				End if 
			End if 
			$_l_NewWindowHeight:=$_l_WindowHeight+(504-(335))
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			
			WS_AutoscreenSize(2; $_l_NewWindowHeight; $_l_WindowRight-$_l_WindowLeft)
		End if 
		
End case 
ERR_MethodTrackerReturn("FM:Ask_Person"; $_t_oldMethodName)
