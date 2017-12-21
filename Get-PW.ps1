[cmdletbinding()]

param
(
[int]
$Length = 8,

[switch]$lower,
[switch]$upper,
[switch]$numbers,
[switch]$punc,
[switch]$all
)

Add-Type -AssemblyName System;
$sb = New-Object -TypeName System.Text.StringBuilder;
$alphabet = "abcdefghijklmnopqrstuvwxyz";
$digits = "1234567890";
$special = "!@#$%^&*()";
$caps = $alphabet.ToUpper();

$lowup = $alphabet + $caps;
$alphanum = $lowup + $digits;
$lownum = $alphabet + $digits;
$upnum = $caps + $digits;
$lowspc = $alphabet + $special;
$upspc = $caps + $special;
$numspc = $digits + $special;
$alphaspc = $lowup + $special;
$upnumspc = $caps + $numspc;
$lownumspc = $lownum + $special;

$allchars = $alphanum + $special;


Switch ($PSBoundParameters.Keys)
{
    {($PSBoundParameters.Keys -contains 'all') -or (($PSBoundParameters.Keys -contains 'lower') -and ($PSBoundParameters.Keys -contains 'upper') -and ($PSBoundParameters.Keys -contains 'numbers') -and ($PSBoundParameters.Keys -contains 'punc'))}
    {
        for($i=1; $i -le $Length; $i++)
            {
                $index = Get-Random -Maximum $allchars.Length;
                $sb.Append($allchars[$index]) > $null;
            }
        break
    }

    {($PSBoundParameters.Keys -contains 'lower') -and ($PSBoundParameters.Keys -contains 'upper') -and ($PSBoundParameters.Keys -contains 'numbers')}
    {
        for($i=1; $i -le $Length; $i++)
            {
                $index = Get-Random -Maximum $alphanum.Length;
                $sb.Append($alphanum[$index]) > $null;
            }
        break
    }

    {($PSBoundParameters.Keys -contains 'lower') -and ($PSBoundParameters.Keys -contains 'upper') -and ($PSBoundParameters.Keys -contains 'punc')}
    {
        for($i=1; $i -le $Length; $i++)
            {
                $index = Get-Random -Maximum $alphaspc.Length;
                $sb.Append($alphaspc[$index]) > $null;
            }
        break
    }

    {($PSBoundParameters.Keys -contains 'lower') -and ($PSBoundParameters.Keys -contains 'numbers') -and ($PSBoundParameters.Keys -contains 'punc')}
    {
        for($i=1; $i -le $Length; $i++)
            {
                $index = Get-Random -Maximum $lownumspc.Length;
                $sb.Append($lownumspc[$index]) > $null;
            }
        break
    }

    {($PSBoundParameters.Keys -contains 'upper') -and ($PSBoundParameters.Keys -contains 'numbers') -and ($PSBoundParameters.Keys -contains 'punc')}
    {
        for($i=1; $i -le $Length; $i++)
            {
                $index = Get-Random -Maximum $upnumspc.Length;
                $sb.Append($upnumspc[$index]) > $null;
            }
        break
    }

    {($PSBoundParameters.Keys -contains 'lower') -and ($PSBoundParameters.Keys -contains 'upper')}
    {
        for($i=1; $i -le $Length; $i++)
            {
                $index = Get-Random -Maximum $lowup.Length;
                $sb.Append($lowup[$index]) > $null;
            }
        break
    }

    {($PSBoundParameters.Keys -contains 'lower') -and ($PSBoundParameters.Keys -contains 'numbers')}
    {
        for($i=1; $i -le $Length; $i++)
            {
                $index = Get-Random -Maximum $lownum.Length;
                $sb.Append($lownum[$index]) > $null;
            }
        break
    }

    {($PSBoundParameters.Keys -contains 'lower') -and ($PSBoundParameters.Keys -contains 'punc')}
    {
        for($i=1; $i -le $Length; $i++)
            {
                $index = Get-Random -Maximum $lowspc.Length;
                $sb.Append($lowspc[$index]) > $null;
            }
        break
    }

    {($PSBoundParameters.Keys -contains 'upper') -and ($PSBoundParameters.Keys -contains 'numbers')}
    {
        for($i=1; $i -le $Length; $i++)
            {
                $index = Get-Random -Maximum $upnum.Length;
                $sb.Append($upnum[$index]) > $null;
            }
        break
    }

    {($PSBoundParameters.Keys -contains 'upper') -and ($PSBoundParameters.Keys -contains 'punc')}
    {
        for($i=1; $i -le $Length; $i++)
            {
                $index = Get-Random -Maximum $upspc.Length;
                $sb.Append($upspc[$index]) > $null;
            }
        break
    }

    {($PSBoundParameters.Keys -contains 'numbers') -and ($PSBoundParameters.Keys -contains 'punc')}
    {
        for($i=1; $i -le $Length; $i++)
            {
                $index = Get-Random -Maximum $numspc.Length;
                $sb.Append($numspc[$index]) > $null;
            }
        break
    }

    'lower'
    {
        for($i=1; $i -le $Length; $i++)
            {
                $index = Get-Random -Maximum 26;
                $sb.Append($alphabet[$index]) > $null;
            }
        break
    }
    'upper'
    {
        for($i=1; $i -le $Length; $i++)
            {
                $index = Get-Random -Maximum 26;
                $sb.Append($caps[$index]) > $null;
            }
        break
    }
    'numbers'
    {
        for($i=1; $i -le $Length; $i++)
            {
                $index = Get-Random -Maximum 10;
                $sb.Append($digits[$index]) > $null;
            }
        break
    }
    'punc'
    {
        for($i=1; $i -le $Length; $i++)
            {
                $index = Get-Random -Maximum $special.Length;
                $sb.Append($special[$index]) > $null;
            }
        break
    }
}

if ($PSBoundParameters.Keys.Count -eq 0)
{
    for($i=1; $i -le $Length; $i++)
    {
        $index = Get-Random -Maximum 26;
        $sb.Append($alphabet[$index]) > $null;
    }
}

$sb.ToString();