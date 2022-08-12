//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_GetFileName
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_GetFileName (path) --> Text
	
	// Returns the file name from a full path name.
	// Also works for URL paths.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text : A full path name or URL
	
	// Returns:
	//   $0 : Text : The file name
	
	// Created by Dave Batton on May 19, 2004
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:32`Method: Cal4D_iCal_GetFileName
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_length)
	C_TEXT:C284($_t_DocumentName; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_GetFileName")


$_t_DocumentName:=$1

If ($_t_DocumentName="@://@")  // Not perfect, but close enough.
	//Folder separator:="/"
	
Else 
	
	//Folder separator:=DB_DirSymbol 
End if 


$_l_length:=Length:C16($_t_DocumentName)
Repeat 
	If ($_t_DocumentName[[$_l_length]]=Folder separator:K24:12)
		$_t_DocumentName:=Substring:C12($_t_DocumentName; $_l_length+1; Length:C16($_t_DocumentName)-$_l_length)
		$_l_length:=0
	Else 
		$_l_length:=$_l_length-1
	End if 
Until ($_l_length<=0)

$0:=$_t_DocumentName
ERR_MethodTrackerReturn("Cal4D_iCal_GetFileName"; $_t_oldMethodName)