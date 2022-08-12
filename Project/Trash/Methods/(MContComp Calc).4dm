//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      MContComp Calc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    30/03/2011 22:18 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>MultiCo)
	C_LONGINT:C283($i; ch1; r0; r3)
	C_TEXT:C284($_t_oldMethodName; vAnalysis; vOmit; vSource; vSource_; vStatus; vType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MContComp Calc")
If (<>MultiCo)
	If (r3=1)
		
		QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
		QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
		
		If (Records in selection:C76([CONTACTS_COMPANIES:145])>0)
			
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
		Else 
			
			RELATE ONE:C42([CONTACTS:1]Company_Code:1)
		End if 
	Else 
		If (r0=1)
			
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Type:2=vSource_)
			If (Records in selection:C76([CONTACTS_COMPANIES:145])=0)
				QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
				QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			End if 
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
			
			//RELATE ONE([CONTACTS_COMPANIES]Company Code)
		Else 
			
			$i:=0
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0; *)
			While ((Not:C34(End selection:C36([CONTACTS_COMPANIES:145]))) & ($i=0))
				//RELATE ONE([CONTACTS_COMPANIES]Company Code)
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
				
				If (((vType="") | ([COMPANIES:2]Company_Type:13=vType)) & ((vStatus="") | ([COMPANIES:2]Status:12=vStatus)) & ((vSource="") | ([COMPANIES:2]Source:14=vSource)) & ((vOmit="") | ([COMPANIES:2]Omit:17=vOmit)))
					If (vAnalysis#"")
						QUERY:C277([COMPANIES_RECORD_ANALYSIS:146]; [COMPANIES_RECORD_ANALYSIS:146]Company_Code:4=[COMPANIES:2]Company_Code:1; *)
						QUERY:C277([COMPANIES_RECORD_ANALYSIS:146];  & ; [COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1=vAnalysis)
						If (Records in selection:C76([COMPANIES_RECORD_ANALYSIS:146])>0)
							$i:=1
						Else 
							NEXT RECORD:C51([CONTACTS_COMPANIES:145])
							
						End if 
					Else 
						$i:=1
					End if 
				Else 
					NEXT RECORD:C51([CONTACTS_COMPANIES:145])
				End if 
			End while 
			If (($i=0) & (ch1=1))
				QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
				QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
				//RELATE ONE([CONTACTS_COMPANIES]Company Code
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
				
			End if 
		End if 
	End if 
Else 
	
	RELATE ONE:C42([CONTACTS:1]Company_Code:1)
End if 
ERR_MethodTrackerReturn("MContComp Calc"; $_t_oldMethodName)
