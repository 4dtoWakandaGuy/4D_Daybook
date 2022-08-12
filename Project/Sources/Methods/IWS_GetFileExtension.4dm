//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetFileExtension
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
	C_BOOLEAN:C305($2; $Strip)
	C_LONGINT:C283($i; $iLength; $iMaxExtensionLength)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $0; $_t_Filename; $tResult; IWS_t_CurrentMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetFileExtension")

//******************************************************************************
//
//Method: IWS_GetFileExtension
//
//Written by  John Moore on 1/11/99
//
//Purpose: gets extension from filename
//
//$1 - pointer to the filename
//$2 - boolean, strip file extension or not

//Modified 1/12/99 by Rollo: changed $1 to a pointer

//6/22/99 - Rollo - impose a Max length and prevent it going beyond = or &
//also make it more efficient into the bargain
//and use a proxy instead of $0

IWS_t_CurrentMethodName:="IWS_GetFileExtension"
//
//******************************************************************************




$_t_Filename:=$1->
$tResult:=""
$iMaxExtensionLength:=9

If (Position:C15("."; $_t_Filename)>0)
	If (Count parameters:C259=2)
		$Strip:=$2
	Else 
		$Strip:=False:C215
	End if 
	$i:=Length:C16($_t_Filename)
	
	$iLength:=1
	
	While (($_t_Filename[[$i]]#".") & ($_t_Filename[[$i]]#"&") & ($_t_Filename[[$i]]#"=") & ($iLength<=$iMaxExtensionLength))
		$i:=$i-1
		$iLength:=$iLength+1
	End while 
	
	If ($_t_Filename[[$i]]=".")
		$tResult:=Substring:C12($_t_Filename; $i+1)
		
		If ($Strip)
			$1->:=Substring:C12($1->; 1; $i-1)
		End if 
	End if 
	
End if 

$0:=$tResult
ERR_MethodTrackerReturn("IWS_GetFileExtension"; $_t_oldMethodName)