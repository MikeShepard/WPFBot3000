<#
.SYNOPSIS
Find a control in a WPF window

.DESCRIPTION
Unlike FindName(), FindChild actually works with dynamically created controls.  It walks the
visual control tree to find all of the controls in the window, returning the first one that
has the right name.

.PARAMETER parent
A wpf control that contains other controls (generally a window or page)

.PARAMETER childName
The name of the control to find

.EXAMPLE
$w=Window {
    StackPanel {
        TextBox Fred
        CheckBox Barney
    }
}

FindChild -Parent $w -childName Barney

Output
<The "Barney checkbox control>

#>
Function FindChild {
    [CmdletBinding()]
    Param($parent, $childName)


    if ($parent -eq $null) {
        return $null
    }

    $foundChild = $null;

    $childrenCount = [System.Windows.Media.VisualTreeHelper]::GetChildrenCount($parent)
    if ($childrenCount -eq 0) {
        break
    }
    foreach ($i in 0..($childrenCount - 1)) {
        $child = [System.Windows.Media.VisualTreeHelper]::GetChild($parent, $i)
        if ($child.Name -ne $childName) {
            $foundChild = FindChild $child  $childName

            if ($foundChild -ne $null) {
                break
            }
        }
        else {
            $foundChild = $child
            break
        }

    }
    return $foundChild

}
