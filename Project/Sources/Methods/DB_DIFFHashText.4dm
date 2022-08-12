//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_DIFFHashText
	//------------------ Method Notes ------------------
	//_HASH_HashTextSDBM
	
	// Below is the original code in C from
	// http://www.partow.net/programming/hashfunctions/
	
	// unsigned int SDBMHash(char* str, unsigned int len)
	// {
	//
	//    unsigned int hash = 0;
	//    unsigned int i    = 0;
	//
	//    for(i = 0; i < len; str++, i++)
	//    {
	//       hash = (*str) + (hash << 6) + (hash << 16) - hash;
	//    }
	//
	//    return (hash & 0x7FFFFFFF);
	//
	// }
	// /* End Of SDBM Hash Function */
	
	
	//------------------ Revision Control ----------------
	//Date Created:  06/12/2010 11:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Hash; $_l_HashBeforeMods; $_l_HashLength; $_l_Index; $0)
	C_TEXT:C284($_t_oldMethodName; $_t_String; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DIFFHashText")
If (False:C215)
End if 


$_t_String:=$1

$_l_Hash:=0  //    unsigned int hash = 0;

$_l_HashLength:=Length:C16($_t_String)

// Note: 4D numbers strings from 1, not 0.
For ($_l_Index; 1; $_l_HashLength)  //    for(i = 0; i < len; str++, i++)
	
	//       hash = (*str) + (hash << 6) + (hash << 16) - hash;
	
	// The 4D interpreter and the 4D compiler do not always evaluate expressions
	// identically. In particular, precedence/order of evaluation can differ. With
	// correctly placed parenthesis, inconsistencies can be eliminated. As an example,
	// the following line of code works correctly compiled but not interpreted:
	
	//$_l_Hash:=(Ascii($_t_String$i))+($_l_Hash<<6)+($_l_Hash<<16)-$_l_HashBeforeMods
	
	//The code below works correctly and consistently interpreted and compiled:
	$_l_HashBeforeMods:=$_l_Hash
	
	$_l_Hash:=(Character code:C91($_t_String[[$_l_Index]]))
	$_l_Hash:=$_l_Hash+($_l_HashBeforeMods << 6)
	$_l_Hash:=$_l_Hash+($_l_HashBeforeMods << 16)
	$_l_Hash:=$_l_Hash-$_l_HashBeforeMods
	
End for 

$0:=$_l_Hash & 0x7FFFFFFF  //    return (hash & 0x7FFFFFFF);


// End of method.
ERR_MethodTrackerReturn("DB_DIFFHashText"; $_t_oldMethodName)