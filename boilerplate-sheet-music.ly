% Boilerplate Sheet Music for Small Acoustic Pop Ensembles
%
% Copyright (c) 2023 Jenna Chen. Licensed under MIT
%
% You own all the pieces generated by the boierplate
%  in any license you prefer.


% Set compatible LilyPond version.
\version "2.22.1"

% Adjust the size of a sheet music.
#(set-global-staff-size 28)

% Crop extra spaces in a sheet music.
% Useful when generating PNG images.
#(ly:set-option 'crop #t)

% Set the tuning of guitaleles,
%  which is not prebuilt in LilyPond.
guitalele-tuning = #'(a, d g c' e' a')

% Set the tuning of baritone ukuleles,
%  which is not prebuilt in LilyPond.
baritone-ukulele-tuning = #'(d, g, b, e)

% The parameters used by a piece.
piece-key = c
piece-time = 4/4
piece-tempo = 88

% Record the chords of a piece.
% \chords is a builtin command in LilyPond.
% Don't use chords as a variable name.
chord = \chordmode {
    % Don't show any text when no chord set.
    % Replace the default "N.C." to save space.
    \set noChordSymbol = ""

    % Write your chord names here.
    s1
}

% Record the melody of a piece.
melody = {
    % Write your melody here.
    s1
}

% Record the lyrics of a piece.
lyric = \lyricmode {
    % Write your lyrics here.
    Lorem4 ipsum4 dolor4 sit8 amet8
}

% Record the chords of a piece.
harmony = {
    % Write your chords here.
    s1
}

% Record the bassline of a piece.
bassline = {
    % Write your bassline here.
    s1
}

% Record the beats of a piece.
beat = \drummode {
    % Write your beats here.
    s1
}

% Create a sheet music.
\book {
    % Set the title and the composer of a piece.
    \header {
        title = "The Title"
        composer = "The Composer"
        % Remove the default footer.
        tagline = ##f
    }

    % Full score.
    \score {
        \new StaffGroup <<
            % Create the chord name part.
            \new ChordNames {
                % Recall the chord names we wrote.
                \chord
            }

            % Create the melody part.
            \new Staff \with {
                instrumentName = "Melody"
                midiInstrument = "voice oohs"
            } {
                % Use treble clef.
                \clef treble
                % Set the key signature of a piece.
                \key \piece-key \major
                % Set the time signature of a piece.
                \time \piece-time
                % Set the tempo of a piece.
                \tempo 4 = \piece-tempo
                % Recall the melody we wrote.
                \melody
            }
            \new Lyrics \lyricmode {
                % Recall the lyrics we wrote.
                \lyric
            }

            % Create the chordal part.
            \new Staff \with {
                instrumentName = "Chord"
                midiInstrument = "acoustic guitar (nylon)"
            } {
                % Use treble clef.
                % Record the notes higher in an octave.
                \clef "treble_8"
                % Recall the harmony we wrote.
                \harmony
            }

            % Create the bass part.
            \new Staff \with {
                instrumentName = "Bass"
                midiInstrument = "acoustic bass"
            } {
                % Use bass clef.
                \clef bass
                % Recall the bassline we wrote.
                \bassline
            }

            % Create the beat part.
            \new DrumStaff \with {
                instrumentName = "Beat"
                \override MidiInstrument #'midiInstrument = #"drum kit"

                % Assume a cajon here.
                % Record the sheet music as if a drum kit.
                %
                % Change the style table if you
                %  use other percussion instrument.
                drumStyleTable = #drums-style
            } \drummode {
                % Recall the beats we wrote.
                \beat
            }
        >>

        % Set the layout of a sheet music.
        \layout {}

        % Create the MIDI for a piece.
        % We can explore a piece freely before your ensemble play it.
        \midi {}
    }

    \pageBreak

    % Create a melody part.
    \score {
        \header {
            piece = "The Title (Melody Part)"
        }

        <<
        % Create the chord name part.
        \new ChordNames {
            % Recall the chord names we wrote.
            \chord
        }

        \new Staff {
            \clef treble
            \key \piece-key \major
            \time \piece-time
            \tempo 4 = \piece-tempo
            \melody
        }
        \new Lyrics \lyricmode {
            \lyric
        }
        \new TabStaff \with {
            % Set the tuning as a guitalele.
            stringTunings = #guitalele-tuning
        } {
            \melody
        }
        >>

        \layout {}
    }

    \pageBreak

    % Create the harmony part.
    \score {    
        \header {
            piece = "The Title (Chord Part)"
        }

        <<
        % Create the chord name part.
        \new ChordNames {
            % Recall the chord names we wrote.
            \chord
        }

        \new Staff {
            \clef "treble_8"
            \key \piece-key \major
            \time \piece-time
            \tempo 4 = \piece-tempo
            \harmony
        }
        \new TabStaff \with {
            % Set the tuning as a baritone ukulele.
            stringTunings = #baritone-ukulele-tuning
        } {
            \harmony
        }
        >>

        \layout {}
    }

    \pageBreak

    % Create the bass part
    \score {
        \header {
            piece = "The Title (Bass Part)"
        }

        <<
        % Create the chord name part.
        \new ChordNames {
            % Recall the chord names we wrote.
            \chord
        }

        \new Staff {
            \clef bass
            \key \piece-key \major
            \time \piece-time
            \tempo 4 = \piece-tempo
            \bassline
        }
        \new TabStaff \with {
            % Set the tuning as a bass guitar, either electric or acoustic.
            stringTunings = #bass-tuning
        } {
            \bassline
        }
        >>

        \layout {}
    }

    \pageBreak

    % Create the beat part.
    \score {
        \header {
            piece = "The Title (Beat Part)"
        }

        <<
        \new DrumStaff \with {
            % Use a cajon as if it is a drum kit.
            drumStyleTable = #drums-style
        } \drummode {
            \beat
        }
        >>

        \layout {}
    }
}
