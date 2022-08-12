If (False:C215)
	//Table Form Method Name: [COMPANIES]dSV_Graph13
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
	//ARRAY TEXT(SV_at_FieldName3;0)
	//ARRAY TEXT(SV_at_FieldName4;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; ch2; ch3; ch4; DB_l_ButtonClickedFunction; iCancel; iOK; r0; r1; r2; r3)
	C_LONGINT:C283(r4; r5; r6; vSNo)
	C_TEXT:C284($_t_oldMethodName; vButtDisTxt; vTitle5; vTitle7; vTitle9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dSV_Graph13"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dSV_Graph13")
		If ((vSNo<1) | (vSNo>8))
			vSNo:=1
		End if 
		Case of 
			: (vSNo=1)
				r0:=1
			: (vSNo=2)
				r1:=1
			: (vSNo=3)
				r2:=1
			: (vSNo=4)
				r3:=1
			: (vSNo=5)
				r4:=1
			: (vSNo=6)
				r5:=1
			: (vSNo=7)
				r6:=1
		End case 
		If (SV_at_FieldName3=1)
			ch2:=1
			ch3:=0
			ch4:=0
			OBJECT SET ENABLED:C1123(ch3; False:C215)
			OBJECT SET ENABLED:C1123(ch4; False:C215)
		Else 
			ch2:=0
			ch3:=1
			If (SV_at_FieldName4=1)
				ch4:=0
				OBJECT SET ENABLED:C1123(ch4; False:C215)
			Else 
				ch4:=0
			End if 
		End if 
		OBJECT SET TITLE:C194(ch2; vTitle5)
		OBJECT SET TITLE:C194(ch3; vTitle7)
		OBJECT SET TITLE:C194(ch4; vTitle9)
		StatsView_GrCal
		
		vButtDisTxt:="IMDPMOSSFSSSRCADT"
		Input_Buttons(->[COMPANIES:2]; ->vButtDisTxt)
	: ($_l_event=On Activate:K2:9)
		OpenHelp(Table:C252(->[COMPANIES:2]); "dSV_Graph13")
		In_ButtChkDis(->vButtDisTxt)
	: ((($_l_event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		In_ButtCall(""; ""; ""; ->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; ""; ""; ""; ""; "")
End case 
ERR_MethodTrackerReturn("FM:dSV_Graph13"; $_t_oldMethodName)
