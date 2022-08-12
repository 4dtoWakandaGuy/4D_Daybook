If (False:C215)
	//object Name: [COMPANIES]dAsk_CompanyOLD.Popup Drop down List1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(COM_lb_Companies;0)
	//ARRAY TEXT(COM_at_DisplayDetail;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_LONGINT:C283($i)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_CompanyOLD.Popup Drop down List1"; Form event code:C388)
If (COM_at_DisplayDetail=0)
	COM_at_DisplayDetail:=1
End if 
If (DB_t_CurrentFormUsage="MC")
	QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
	QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
	
	While (Not:C34(End selection:C36([CONTACTS_COMPANIES:145])))
		$i:=Find in array:C230(GEN_at_RecordCode; [CONTACTS_COMPANIES:145]Company_Code:1)
		If ($i>0)
			//RELATE ONE([CONTACTS_COMPANIES]Company Code)
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
			
			Companies_Arr2($i; "MC"; COM_at_DisplayDetail)
		End if 
		NEXT RECORD:C51([CONTACTS_COMPANIES:145])
	End while 
	LB_SetColumnHeaders(->COM_lb_Companies; "COM_L"; 1; "Code"; "Name"; COM_at_DisplayDetail{COM_at_DisplayDetail})
	LISTBOX SELECT ROW:C912(COM_lb_Companies; 1; 0)
	LB_SetScroll(->COM_lb_Companies; 1)
Else 
	Companies_Arr(COM_at_DisplayDetail)
	SORT ARRAY:C229(GEN_at_RecordCode; GEN_at_Identity; GEN_at_Name; >)
	Array_LCStart
	LB_SetColumnHeaders(->COM_lb_Companies; "COM_L"; 1; "Code"; "Name"; COM_at_DisplayDetail{COM_at_DisplayDetail})
	LISTBOX SELECT ROW:C912(COM_lb_Companies; 1; 0)
	LB_SetScroll(->COM_lb_Companies; 1)
End if 
ERR_MethodTrackerReturn("OBJ:dAsk_Company,CON_at_DisplayDetail"; $_t_oldMethodName)
