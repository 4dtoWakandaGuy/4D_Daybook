//%attributes = {}
If (False:C215)
	//Project Method Name:      Time_ProdTot
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
	//Array REAL(GEN_ar_Value;0)
	//Array REAL(SRAmount;0)
	//Array REAL(SRRate;0)
	C_LONGINT:C283($i; i)
	C_TEXT:C284($_t_oldMethodName; vFld; vRec)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Time_ProdTot")
//Time_ProdTot
//Week
$i:=1
While ($i<i)
	If ($i=(i-2))
		SEND PACKET:C103(vFld)
	End if 
	SEND PACKET:C103(String:C10(SRRate{$i})+vFld)
	$i:=$i+1
End while 
SEND PACKET:C103(vRec+vFld+"TOTAL TO DATE"+vFld)
//YTD
$i:=1
While ($i<i)
	If ($i=(i-2))
		SEND PACKET:C103(vFld)
	End if 
	SEND PACKET:C103(String:C10(SRAmount{$i})+vFld)
	$i:=$i+1
End while 
SEND PACKET:C103(vRec+vFld+"BUDGET TO DATE"+vFld)
//Budget
$i:=1
While ($i<i)
	If ($i=(i-2))
		SEND PACKET:C103(vFld)
	End if 
	SEND PACKET:C103(String:C10(GEN_ar_Value{$i})+vFld)
	$i:=$i+1
End while 
SEND PACKET:C103(vRec+vFld+"% VARIATION"+vFld)
//Variation
$i:=1
While ($i<i)
	If ($i=(i-2))
		SEND PACKET:C103(vFld)
	End if 
	SEND PACKET:C103(String:C10(Round:C94(((SRAmount{$i}/GEN_ar_Value{$i}*100)-100); 2))+vFld)
	$i:=$i+1
End while 
SEND PACKET:C103(vRec+vRec+vRec)
ERR_MethodTrackerReturn("Time_ProdTot"; $_t_oldMethodName)