//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Vers37111
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY REAL:C219($_ar_QuotedAmounts; 0)
	ARRAY REAL:C219($_ar_QuotedQuantities; 0)
	C_LONGINT:C283($_l_Index; $_l_SIzeofArray)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_Vers37111")
READ WRITE:C146([JOB_STAGES:47])
QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1#"")
SELECTION TO ARRAY:C260([JOB_STAGES:47]AS_Quoted_Amount:7; $_ar_QuotedAmounts)
$_l_SIzeofArray:=Size of array:C274($_ar_QuotedAmounts)
User_Message(Char:C90(13)+"    Updating "+String:C10($_l_SIzeofArray)+" Job Stages")
ARRAY REAL:C219($_ar_QuotedQuantities; $_l_SIzeofArray)
For ($_l_Index; 1; $_l_SIzeofArray)
	$_ar_QuotedQuantities{$_l_Index}:=1
End for 
ARRAY TO SELECTION:C261($_ar_QuotedAmounts; [JOB_STAGES:47]JS_Quoted_Price:47; $_ar_QuotedQuantities; [JOB_STAGES:47]JS_Quoted_Qty:46)
READ ONLY:C145([JOB_STAGES:47])
UNLOAD RECORD:C212([JOB_STAGES:47])
ERR_MethodTrackerReturn("User_Vers37111"; $_t_oldMethodName)
