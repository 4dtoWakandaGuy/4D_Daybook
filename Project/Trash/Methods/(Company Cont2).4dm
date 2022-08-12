//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Company Cont2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_TEXT:C284($_t_oldMethodName; vAnalysis; vOmit; vRole; vSource_; vStatus_; vType_)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Company Cont2")
CompCont_Srch
If (vRole#"")
	QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Role:11=vRole)
End if 
If (vStatus_#"")
	QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Status:14=vStatus_)
End if 
If (vType_#"")
	QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Contact_Type:15=vType_)
End if 
If (vSource_#"")
	QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Source:16=vSource_)
End if 
If (vOmit#"")
	QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Omit:20=vOmit)
End if 
If (vAnalysis#"")
	
	If (Records in selection:C76([CONTACTS:1])>0)
		CREATE SET:C116([CONTACTS:1]; "$Set1")
		QUERY:C277([CONTACTS_RECORD_ANALYSIS:144]; [CONTACTS_RECORD_ANALYSIS:144]Analysis_Code:1=vanalysis)
		If (Records in selection:C76([CONTACTS_RECORD_ANALYSIS:144])>0)
			SELECTION TO ARRAY:C260([CONTACTS_RECORD_ANALYSIS:144]Contact_Code:3; $_at_ContactCodes)
			QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
			CREATE SET:C116([CONTACTS:1]; "$Set2")
			INTERSECTION:C121("$Set1"; "$Set2"; "$Set1")
			USE SET:C118("$Set1")
		End if 
		
		
	End if 
End if 
ERR_MethodTrackerReturn("Company Cont2"; $_t_oldMethodName)