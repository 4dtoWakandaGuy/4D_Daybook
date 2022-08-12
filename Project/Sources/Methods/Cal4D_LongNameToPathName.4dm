//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_LongNameToPathName
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_LongNameToPathName (path to a document) --> Text
	
	// Returns just the folder name from a full path name.
	// From the 4D Documentation.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text : A full path name with the file name
	
	// Returns:
	//   $0 : Text : The same path without the file name
	
	// Created by Dave Batton on May 1, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:26`Method: Cal4D_LongNameToPathName
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Index; $_l_StringLength; $_t_DirectorySeperator)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_LongNameToPathName")



If (Is Windows:C1573)
	$_t_DirectorySeperator:=Character code:C91("\\")
Else 
	$_t_DirectorySeperator:=Character code:C91(":")
End if 

$_l_StringLength:=Length:C16($1)
$_l_CharacterPosition:=0

For ($_l_Index; $_l_StringLength; 1; -1)
	If (Character code:C91($1[[$_l_Index]])=$_t_DirectorySeperator)
		$_l_CharacterPosition:=$_l_Index
		$_l_Index:=0
	End if 
End for 

If ($_l_CharacterPosition>0)
	$0:=Substring:C12($1; 1; $_l_CharacterPosition)
Else 
	$0:=$1
End if 
ERR_MethodTrackerReturn("Cal4D_LongNameToPathName"; $_t_oldMethodName)