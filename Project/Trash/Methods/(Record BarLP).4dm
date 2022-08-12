//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Record_BarLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/01/2012 14:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts; DB_bo_NoLoad)
	C_LONGINT:C283(<>RecBarUp; <>SCPT_l_RecordEdit; <>SCPT_l_PlayerActive; $_l_Event; xSearch; xSelect; xSort)
	C_TEXT:C284($_t_oldMethodName; vStatus)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_BarLP")
//Record_BarLP
//the way this is called now(from the set manager it only calls
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//If (◊RecPlayUp#0)
		//xSearch:=1
		//vStatus:="Play"
		//DISABLE BUTTON(xPlus)
		//DISABLE BUTTON(xSelect)
		//End if
	: ($_l_Event=On Outside Call:K2:11)
		If (<>RecBarUp=0)
			CANCEL:C270
		Else 
			If (<>SCPT_l_PlayerActive=9999)
				<>SCPT_l_PlayerActive:=0
				If (xSearch=1)
					Record_BarStop
				End if 
			Else 
				If (<>SCPT_l_PlayerActive=8888)
					If ((vStatus#"Play@") & (vStatus#"Rec@"))
						Record_BarPlay
					Else 
						<>SCPT_l_PlayerActive:=0
					End if 
				Else 
					If (<>SCPT_l_RecordEdit=7777)
						<>SCPT_l_RecordEdit:=0
						xSearch:=1
						vStatus:="Play"
						Record_BarPause
					Else 
						If ((<>SCPT_l_RecordEdit=0) & (xSort=1))
							xSort:=0
							xSelect:=0
							If (<>SCPT_bo_NoAutoScripts=False:C215)
								PLAY:C290("Mer Off"; 0)
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("Record_BarLP"; $_t_oldMethodName)