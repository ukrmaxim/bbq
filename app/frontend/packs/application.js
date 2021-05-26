import Rails from "@rails/ujs"

import 'bootstrap/dist/js/bootstrap'
import '../scripts/ekko_lightbox'
import '../styles/application.scss'
import 'ekko-lightbox'
import "@fortawesome/fontawesome-free/css/all"
import './yandexmap'

Rails.start()

const images = require.context('../images', true)

