\int_compare:nNnTF
  { \seq_count:N \g_istqb_third_parties_seq }
  =
  { 1 }
  {
    % A single third-party organization
    \istqbprovidedbysingularname{}~
    \seq_get_left:NN
      \g_istqb_third_parties_seq
      \l_tmpa_tl
    \tl_use:N
      \l_tmpa_tl
  }
  {
    % Several third-party organizations
    \istqbprovidedbypluralname \par \vfill
    \exp_last_unbraced:NNo
      \seq_use:Nnnn
      \g_istqb_third_parties_seq
      {
        { \g_istqb_list_delimiter_two }
        { \g_istqb_list_delimiter_many }
        { \g_istqb_list_delimiter_last }
      }
  }
\par \vspace { 0.3in } \vfill \vfill
% Display logos of third-party organizations
\seq_clear:N \l_tmpa_seq
\seq_map_inline:Nn
  \g_istqb_third_parties_seq
  {
    \prop_get:NnNT
      \g_istqb_third_party_logos_prop
      { #1 }
      \l_tmpa_tl
      {
        \tl_set:Nn
          \l_tmpb_tl
          {
            \includegraphics
              [ align = c, width = 2in,
                height = 0.4in ]
          }
        \tl_put_right:Nx
          \l_tmpb_tl
          { { \l_tmpa_tl } }
        \seq_put_right:NV
          \l_tmpa_seq
          \l_tmpb_tl
      }
  }
\seq_use:Nn
  \l_tmpa_seq
  { \qquad }
\par