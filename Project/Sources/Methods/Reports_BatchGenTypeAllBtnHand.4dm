//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_BatchGenTypeAllBtnHand
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_BatchGenTypeAllBtnHand
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(RPT_at_GenTypeOptions;0)
	//ARRAY TEXT(RPT_at_GenTypeSelGenType;0)
	C_LONGINT:C283($_l_Index; $_l_ReportTypeRow; $_l_SizeofArray)
	C_TEXT:C284($_t_FirstType; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_BatchGenTypeAllBtnHand")
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		
		//toggle first row one further through the selection of options
		$_t_FirstType:=RPT_at_GenTypeSelGenType{1}
		$_l_ReportTypeRow:=Find in array:C230(RPT_at_GenTypeOptions; $_t_FirstType)
		If ($_l_ReportTypeRow=Size of array:C274(RPT_at_GenTypeOptions))
			RPT_at_GenTypeSelGenType{1}:=RPT_at_GenTypeOptions{1}
		Else 
			RPT_at_GenTypeSelGenType{1}:=RPT_at_GenTypeOptions{($_l_ReportTypeRow+1)}
		End if 
		
		$_l_SizeofArray:=Size of array:C274(RPT_at_GenTypeSelGenType)
		If ($_l_SizeofArray>=2)
			//make all the other rows the same as the first row
			For ($_l_Index; 2; $_l_SizeofArray)
				RPT_at_GenTypeSelGenType{$_l_Index}:=RPT_at_GenTypeSelGenType{1}
			End for 
		End if 
		
	Else 
		
End case 
ERR_MethodTrackerReturn("Reports_BatchGenTypeAllBtnHand"; $_t_oldMethodName)
