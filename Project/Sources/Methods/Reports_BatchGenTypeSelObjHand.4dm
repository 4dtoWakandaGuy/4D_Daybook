//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_BatchGenTypeSelObjHand
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_BatchGenTypeSelObjHand
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(RPT_at_GenTypeOptions;0)
	//ARRAY TEXT(RPT_at_GenTypeSelGenType;0)
	C_LONGINT:C283($_l_ReportTypeRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_BatchGenTypeSelObjHand")
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		$_l_ReportTypeRow:=Find in array:C230(RPT_at_GenTypeOptions; RPT_at_GenTypeSelGenType{RPT_at_GenTypeSelGenType})
		
		If ($_l_ReportTypeRow=Size of array:C274(RPT_at_GenTypeOptions))
			RPT_at_GenTypeSelGenType{RPT_at_GenTypeSelGenType}:=RPT_at_GenTypeOptions{1}
		Else 
			RPT_at_GenTypeSelGenType{RPT_at_GenTypeSelGenType}:=RPT_at_GenTypeOptions{($_l_ReportTypeRow+1)}
		End if 
		
	Else 
		
End case 
ERR_MethodTrackerReturn("Reports_BatchGenTypeSelObjHand"; $_t_oldMethodName)
