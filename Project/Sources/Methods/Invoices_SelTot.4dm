//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_SelTot
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 14:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	ARRAY TEXT:C222($_at_CompanyCodes2; 0)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_ArrayIndex; $_l_Max; $_l_Process; $_l_Progress; $_l_Units; $i; $j; $sets; ch7; vNo)
	C_REAL:C285($_r_Sum)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_SelTot")

Master_UseSS(->[INVOICES:39])
$_l_Progress:=Progress2_Start("Searching ...")
If ($_l_Progress>0)
	$_l_Process:=$_l_Progress
Else 
	$_l_Process:=Current process:C322
End if 
ARRAY TEXT:C222($_at_CompanyCodes; 0)
DISTINCT VALUES:C339([INVOICES:39]Company_Code:2; $_at_CompanyCodes)
QUERY WITH ARRAY:C644([INVOICES:39]Company_Code:2; $_at_CompanyCodes)
QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
CREATE SET:C116([COMPANIES:2]; "ToReport")
ARRAY TEXT:C222($_at_CompanyCodes2; 0)
$_l_Max:=Size of array:C274($_at_CompanyCodes)
For ($_l_ArrayIndex; 1; $_l_Max)
	If (<>SYS_l_CancelProcess#$_l_Process)
		QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=$_at_CompanyCodes{$_l_ArrayIndex})
		If (Records in selection:C76([INVOICES:39])>0)
			$_r_Sum:=Sum:C1([INVOICES:39]Total_Due:7)
			If (ch7=1)
				If ($_r_Sum#0)
					
				End if 
			End if 
			APPEND TO ARRAY:C911($_at_CompanyCodes2; $_at_CompanyCodes{$i})
		End if 
	Else 
		$_l_ArrayIndex:=$_l_Max
	End if 
End for 
ARRAY TEXT:C222($_at_CompanyCodes; 0)
If (Size of array:C274($_at_CompanyCodes2)>0)
	QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_CompanyCodes2)
Else 
	REDUCE SELECTION:C351([COMPANIES:2]; 0)
End if 

Master2(->[INVOICES:39])
ERR_MethodTrackerReturn("Invoices_SelTot"; $_t_oldMethodName)