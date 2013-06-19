{# this is the default domain. any requests for other domain names that aren't
  in `domain_names` will be redirected to `default_domain_name`. also any
  requests for subdomains that are not caught by phpmyadmin, piwik, or
  `default_domain_name`, get redirected to `default_domain_name`. #}

{% set default_domain_name = 'example.com' %}

{# this server should respond to all domains in `domain_names` (a whitespace
  delimited list). localhost and a regex to match IP addresses are needed in
  development because `default_domain_name` is probably pointed at the
  production server #}

{% set domain_names = '\"~^(?:example\.com|localhost|\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})$\"' %}

{% set mysql_password = 'Cdgb4JLsZhUTaxRzwRZKN7tYqbYpMn5YuEE7gsLCatAL8ftApW' %}

{# Wordpress Auth Salts: Change these to different unique phrases! You can
  generate these here: https://api.wordpress.org/secret-key/1.1/salt/. You can
  change these at any point in time to invalidate all existing cookies. This
  will force all users to have to log in again. #}

{% set auth_salts = [
  'fI+?<- Yg($O47fA9/~_aKqL.}%Ir-c8m-cLB<liQtr(+.q1zS2@J5KLJJj7Lcf3',
  'Bh=#LDPbL}UR=#ZEn`#9Z!FUtld*oM(q)T|-Gj|I^6TK+X0?;S5JlY8!=qV3=e{B',
  'q_c~_+m^LlEcN%qs|u[gEePU9gKy20(?ek8H&}O7r9v-2Rx-]xN;pU7{vmpZTebQ',
  'x$J(O]@PpD4,d-(|]nm0IV~]+qZ)x|uG|svd+BsS}{//Q(`DV;7G4cg2<BOM-KhM',
  'gn9,y)r+57s^HD7}|_]oNk>-W5Bhd+J+SvG:(:y-LV;9Fl%aMTmMOpI2+bb}!8Vn',
  'dK{%~J:Sx/gQN<G}qjenw%(t&Y4E+rE|}84y)R?/|f#BEDq2S.lFq$F3+vv?<M3o',
  'TueFpg:|k3TNE}p}Mv2@9.TSd[})gxUzy7!,{k~_-@WNQt4cF3^GW_; _&F8`YmK',
  'vYL(Pzo<$CVG_:UiW=&oB&.>!D(|,7Y><2>4$s5@Qbv#&Ca017vO[5+mi@|+%|1T'
] %}

base:
  '*':
    - apt.unattended
    - nginx
    - users
    - ssh
    - php5
    - wordpress
    - piwik
    - salt
    - swap
    - misc
