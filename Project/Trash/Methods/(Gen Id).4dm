//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen Id
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2012 16:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_SequenceLength; $_l_StartNumber)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $_t_SequenceNumber; $_t_TableNumSTR; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen Id")
//Gen Id


$_t_TableNumSTR:=String:C10(Table:C252($1))
$_l_StartNumber:=0

$_t_SequenceNumber:=String:C10(AA_GetNextIDinMethod(->$_l_StartNumber; Sequence number:C244($1->)-1))

$_l_SequenceLength:=Length:C16($_t_SequenceNumber)
If ($_l_SequenceLength>8)  //for dealing with 100 million to 132 million!
	Case of 
		: ($_l_SequenceLength=9)
			$_l_SequenceLength:=Num:C11(Substring:C12($_t_SequenceNumber; 1; 2))-10
			$0:=("0"*(3-Length:C16($_t_TableNumSTR)))+$_t_TableNumSTR+DB_GetOrganisationOfficeCode+("0"*(8-$_l_SequenceLength))+$_t_SequenceNumber
			If ($_l_SequenceLength<33)
				$_t_SequenceNumber:=Char:C90(65+$_l_SequenceLength)+Substring:C12($_t_SequenceNumber; 3; 7)
				$_l_SequenceLength:=8
				$0:=("0"*(3-Length:C16($_t_TableNumSTR)))+$_t_TableNumSTR+DB_GetOrganisationOfficeCode+("0"*(8-$_l_SequenceLength))+$_t_SequenceNumber
			Else 
				Gen_Alert("You have exceeded the maximum number of records in this file")
				$0:="0"
			End if 
		: ($_l_SequenceLength=10)
			Gen_Alert("You have exceeded the maximum number of records in this file")
			$0:="0"
	End case 
End if 
ERR_MethodTrackerReturn("Gen Id"; $_t_oldMethodName)