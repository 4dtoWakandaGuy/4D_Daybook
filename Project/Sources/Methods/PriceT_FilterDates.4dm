//%attributes = {}
If (False:C215)
	//Project Method Name:      PriceT_FilterDates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/07/2010 16:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT_FilterDates")
If (Records in selection:C76([PRICE_TABLE:28])>0)
	If (Count parameters:C259>=1)
		If ($1#!00-00-00!)
			$_d_Date:=$1
		Else 
			$_d_Date:=Current date:C33(*)
		End if 
	Else 
		$_d_Date:=Current date:C33(*)
	End if 
	CREATE SET:C116([PRICE_TABLE:28]; "$currentSelection")
	QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Date_From:18<=$_d_Date; *)
	QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Date_From:18#!00-00-00!; *)
	QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Date_To:19>=$_d_Date)
	If (Records in selection:C76([PRICE_TABLE:28])=0)
		USE SET:C118("$currentSelection")
		QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Date_From:18<=$_d_Date; *)
		QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Date_From:18#!00-00-00!; *)
		QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Date_To:19=!00-00-00!)
		If (Records in selection:C76([PRICE_TABLE:28])=0)
			USE SET:C118("$currentSelection")
			QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Date_From:18=!00-00-00!; *)
			QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Date_To:19>=$_d_Date)
			If (Records in selection:C76([PRICE_TABLE:28])=0)
				USE SET:C118("$currentSelection")
				QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Date_From:18=!00-00-00!; *)
				QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Date_To:19=!00-00-00!)
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("PriceT_FilterDates"; $_t_oldMethodName)
