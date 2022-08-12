//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockAss CalSe3
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
	//ARRAY TEXT(SRQtyT;0)
	//ARRAY TEXT(SRSerial;0)
	//Array LONGINT(aApptO;0)
	//Array REAL(SRAmount;0)
	//Array REAL(SRPrice;0)
	//Array REAL(SRRate;0)
	//Array TEXT(SRDesc;0)
	C_LONGINT:C283($1; $s)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss CalSe3")
$s:=1
While ($s=1)
	IDLE:C311  // 7/04/03 pb
	If (Size of array:C274(SRSerial)>$1)
		If (SRSerial{$1+1}="@   Qty @")
			DELETE FROM ARRAY:C228(SRSerial; $1+1; 1)
			DELETE FROM ARRAY:C228(SRDesc; $1+1; 1)
			DELETE FROM ARRAY:C228(SRQtyT; $1+1; 1)
			DELETE FROM ARRAY:C228(SRPrice; $1+1; 1)
			DELETE FROM ARRAY:C228(SRRate; $1+1; 1)
			DELETE FROM ARRAY:C228(SRAmount; $1+1; 1)
			DELETE FROM ARRAY:C228(aApptO; $1+1; 1)
		Else 
			$s:=0
		End if 
	Else 
		$s:=0
	End if 
End while 
ERR_MethodTrackerReturn("StockAss CalSe3"; $_t_oldMethodName)