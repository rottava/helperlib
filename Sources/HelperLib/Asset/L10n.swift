//
//  L10n.swift
//  HelperLib
//
//  Created by Edson Rottava on 09/06/21.
//  Copyright © 2021 Rattova's Dev. All rights reserved.
//

import Foundation

internal enum L10n {
    // SYSTEM
    internal enum System {
        
        // MARK: BUTTON
        internal enum Button {
            // ADICIONAR
            internal static let add = L10n.tr("Localizable", "system.button.add")
            ///
            internal static let addHint = L10n.tr("Localizable", "system.button.addHint")
            /// VOLTAR
            internal static let back = L10n.tr("Localizable", "system.button.back")
            ///
            internal static let backHint = L10n.tr("Localizable", "system.button.backHint")
            /// TROCAR
            internal static let change = L10n.tr("Localizable", "system.button.change")
            ///
            internal static let changeHint = L10n.tr("Localizable", "system.button.changeHint")
            /// CANCELAR
            internal static let cancel = L10n.tr("Localizable", "system.button.cancel")
            ///
            internal static let cancelHint = L10n.tr("Localizable", "system.button.cancelHint")
            /// FECHAR
            internal static let close = L10n.tr("Localizable", "system.button.close")
            ///
            internal static let closeHint = L10n.tr("Localizable", "system.button.closeHint")
            /// CONTINUAR
            internal static let cont = L10n.tr("Localizable", "system.button.cont")
            ///
            internal static let contHint = L10n.tr("Localizable", "system.button.contHint")
            /// PRONTO
            internal static let done = L10n.tr("Localizable", "system.button.done")
            ///
            internal static let doneHint = L10n.tr("Localizable", "system.button.doneHint")
            /// EDITAR
            internal static let edit = L10n.tr("Localizable", "system.button.edit")
            ///
            internal static let editHint = L10n.tr("Localizable", "system.button.editHint")
            /// CONCLUIR
            internal static let finish = L10n.tr("Localizable", "system.button.finish")
            ///
            internal static let finishHint = L10n.tr("Localizable", "system.button.finishHint")
            /// SAIR
            internal static let logout = L10n.tr("Localizable", "system.button.logout")
            /// VER MENOS
            internal static let less = L10n.tr("Localizable", "system.button.less")
            ///
            internal static let lessHint = L10n.tr("Localizable", "system.button.lessHint")
            /// VER MAIS
            internal static let more = L10n.tr("Localizable", "system.button.more")
            ///
            internal static let moreHint = L10n.tr("Localizable", "system.button.moreHint")
            /// PRÓXIMO
            internal static let next = L10n.tr("Localizable", "system.button.next")
            ///
            internal static let nextHint = L10n.tr("Localizable", "system.button.nextHint")
            /// OK
            internal static let ok = L10n.tr("Localizable", "system.button.ok")
            ///
            internal static let okHint = L10n.tr("Localizable", "system.button.okHint")
            /// SALVAR
            internal static let save = L10n.tr("Localizable", "system.button.save")
            ///
            internal static let saveHint = L10n.tr("Localizable", "system.button.saveHint")
            /// SELECIOANR
            internal static let select = L10n.tr("Localizable", "system.button.select")
            ///
            internal static let selectHint = L10n.tr("Localizable", "system.button.selectHint")
            /// PREFERÊNCIAS
            internal static let settings = L10n.tr("Localizable", "system.button.settings")
            ///
            internal static let settingsHint = L10n.tr("Localizable", "system.button.settingsHint")
        }

        // MARK: ERROR
        internal enum Error {
            /// ERROR
            internal static let connection = L10n.tr("Localizable", "system.error.connection")

            // MARK: INVALID
            internal enum Invalid {
                /// MAIOR 18
                internal static let age = L10n.tr("Localizable", "system.error.invalid.age")
                /// NUMERO INVALIDO
                internal static let card = L10n.tr("Localizable", "system.error.invalid.card")
                /// CEP INVALIDO
                internal static let cep = L10n.tr("Localizable", "system.error.invalid.cep")
                /// CNPJ INVÀLIDO
                internal static let cnpj = L10n.tr("Localizable", "system.error.invalid.cnpj")
                /// CPF INVÀLIDO
                internal static let cpf = L10n.tr("Localizable", "system.error.invalid.cpf")
                /// CPF / CNPJ  INVÀLIDO
                internal static let cpfj = L10n.tr("Localizable", "system.error.invalid.cpfj")
                /// CNH  INVÀLIDO
                internal static let cnh = L10n.tr("Localizable", "system.error.invalid.cnh")
                /// CATEGORIA CNH  INVÀLIDO
                internal static let cnhCat = L10n.tr("Localizable", "system.error.invalid.cnhCat")
                /// CVV INVALIDO
                internal static let cvv = L10n.tr("Localizable", "system.error.invalid.cvv")
                /// DATA INVÀLIDA
                internal static let date = L10n.tr("Localizable", "system.error.invalid.date")
                /// E-MAIL INVÀLIDO
                internal static let email = L10n.tr("Localizable", "system.error.invalid.email")
                /// CAMPO VAZIO
                internal static let empty = L10n.tr("Localizable", "system.error.invalid.empty")
                /// NOME INVÀLIDO
                internal static let name = L10n.tr("Localizable", "system.error.invalid.name")
                /// SENHA INVÀLIDA
                internal static let password = L10n.tr("Localizable", "system.error.invalid.password")
                /// TELEFONE INVÀLIDO
                internal static let phone = L10n.tr("Localizable", "system.error.invalid.phone")
                /// REPETIR SENHA INVÀLIDA
                internal static let repassword = L10n.tr("Localizable", "system.error.invalid.repassword")
                /// RG INVALIDO
                internal static let rg = L10n.tr("Localizable", "system.error.invalid.rg")
                /// HORARIO INVÀLIDO
                internal static let time = L10n.tr("Localizable", "system.error.invalid.time")
            }
            
            // MARK: PERMISSION
            internal enum Permission {
                /// GALLERY
                internal static let gallery = L10n.tr("Localizable", "system.error.permission.gallery")
            }
        }
        
        // MARK: HYPERLINK
        internal enum Hyperlink {
            /// POLITICAS DE PRIVACIDADE
            internal static let privacy = L10n.tr("Localizable", "system.hyperlink.privacy")
            ///
            internal static let privacyLink = L10n.tr("Localizable", "system.hyperlink.privacyLink")
            /// TERMOS DE USO
            internal static let terms = L10n.tr("Localizable", "system.hyperlink.terms")
            ///
            internal static let termsLink = L10n.tr("Localizable", "system.hyperlink.termsLink")
            /// TERMOS E CONDICOES
            internal static let termsAlways = L10n.tr("Localizable", "system.hyperlink.termsAlways")
            ///
            internal static let termsAlwaysLink = L10n.tr("Localizable", "system.hyperlink.termsAlwaysLink")
        }
    }
    
    // AUTHENTICATION
    internal enum Authentication {
        // MARK: AUTHENTICATION LOGIN
        internal enum Login {
            /// CPF
            internal static let cpfj = L10n.tr("Localizable", "authentication.login.cpfj")
            ///
            internal static let cpfjHint = L10n.tr("Localizable", "authentication.login.cpfjHint")
            /// ESQUECI
            internal static let forgot = L10n.tr("Localizable", "authentication.login.forgot")
            ///
            internal static let forgotHint = L10n.tr("Localizable", "authentication.login.forgotHint")
            /// CRIAR
            internal static let login = L10n.tr("Localizable", "authentication.login.login")
            ///
            internal static let loginHint = L10n.tr("Localizable", "authentication.login.loginHint")
            /// SENHA
            internal static let password = L10n.tr("Localizable", "authentication.login.password")
            ///
            internal static let passwordHint = L10n.tr("Localizable", "authentication.login.passwordHint")
            /// REGISTRAR
            internal static let preregister = L10n.tr("Localizable", "authentication.login.preregister")
            ///
            internal static let preregisterHint = L10n.tr("Localizable", "authentication.login.preregisterHint")
            /// CRIAR CONTA
            internal static let register = L10n.tr("Localizable", "authentication.login.register")
            ///
            internal static let registerHint = L10n.tr("Localizable", "authentication.login.registerHint")
        }
        
        // MARK: AUTHENTICATION REGISTER
        internal enum Register {
            /// DATA DE NASCIMENTO
            internal static let birthday = L10n.tr("Localizable", "authentication.register.birthday")
            ///
            internal static let birthdayHint = L10n.tr("Localizable", "authentication.register.birthdayHint")
            /// MENOR DE IDADE
            internal static let birthdayOld = L10n.tr("Localizable", "authentication.register.birthdayOld")
            /// CNPJ
            internal static let cnpj = L10n.tr("Localizable", "authentication.register.cnpj")
            ///
            internal static let cnpjHint = L10n.tr("Localizable", "authentication.register.cnpjHint")
            /// CPF
            internal static let cpf = L10n.tr("Localizable", "authentication.register.cpf")
            ///
            internal static let cpfHint = L10n.tr("Localizable", "authentication.register.cpfHint")
            /// NÙMERO
            internal static let cpfj = L10n.tr("Localizable", "authentication.register.cpfj")
            /// DD/MM/AAAA
            internal static let dateType = L10n.tr("Localizable", "authentication.register.dateType")
            /// E-MAIL
            internal static let email = L10n.tr("Localizable", "authentication.register.email")
            ///
            internal static let emailHint = L10n.tr("Localizable", "authentication.register.emailHint")
            /// ENVIAMOS
            internal static let endDesc = L10n.tr("Localizable", "authentication.register.endDesc")
            /// QUASE LÁ
            internal static let endHeader = L10n.tr("Localizable", "authentication.register.endHeader")
            /// CRIE SUA CONTA
            internal static let header = L10n.tr("Localizable", "authentication.register.header")
            /// NOME
            internal static let name = L10n.tr("Localizable", "authentication.register.name")
            ///
            internal static let nameHint = L10n.tr("Localizable", "authentication.register.nameHint")
            /// SENHA
            internal static let password = L10n.tr("Localizable", "authentication.register.password")
            ///
            internal static let passwordHint = L10n.tr("Localizable", "authentication.register.passwordHint")
            /// TELEFONE
            internal static let phone = L10n.tr("Localizable", "authentication.register.phone")
            ///
            internal static let phoneHint = L10n.tr("Localizable", "authentication.register.phoneHint")
            ///
            internal static let popupTitle = L10n.tr("Localizable", "authentication.register.popupTitle")
            ///
            internal static let popupDesc = L10n.tr("Localizable", "authentication.register.popupDesc")
            ///
            internal static let popupDone = L10n.tr("Localizable", "authentication.register.popupDone")
            /// CRIAR
            internal static let register = L10n.tr("Localizable", "authentication.register.register")
            ///
            internal static let registerHint = L10n.tr("Localizable", "authentication.register.registerHint")
            /// REPETIR SENHA
            internal static let repassword = L10n.tr("Localizable", "authentication.register.repassword")
            ///
            internal static let repasswordHint = L10n.tr("Localizable", "authentication.register.repasswordHint")
            /// TERMOS
            internal static let terms = L10n.tr("Localizable", "authentication.register.terms")
            ///
            internal static let termsHint = L10n.tr("Localizable", "authentication.register.termsHint")
            ///
            internal static let title = L10n.tr("Localizable", "authentication.register.title")
        }
    }

    // CAOA
    internal enum Caoa {
        // MARK: WE ARE
        internal enum Weare {
            /// COLABORADORES
            internal static let colabs = L10n.tr("Localizable", "caoa.weare.colabs")
            /// GRUPO CAOA
            internal static let desc = L10n.tr("Localizable", "caoa.weare.desc")
            /// DESDE 1979
            internal static let header = L10n.tr("Localizable", "caoa.weare.header")
            /// FÁBRICAS NO BRASIL
            internal static let industry = L10n.tr("Localizable", "caoa.weare.industry")
            /// MAIS DE
            internal static let more = L10n.tr("Localizable", "caoa.weare.more")
            /// APROXIMADAMENTE
            internal static let nearly = L10n.tr("Localizable", "caoa.weare.nearly")
            /// A CAOA
            internal static let numbers = L10n.tr("Localizable", "caoa.weare.numbers")
            /// FUNCIONÁRIOS
            internal static let postsell = L10n.tr("Localizable", "caoa.weare.postsell")
            /// OFICINAS
            internal static let repairs = L10n.tr("Localizable", "caoa.weare.repairs")
            /// CONSULTORES
            internal static let reselers = L10n.tr("Localizable", "caoa.weare.reselers")
            /// INVESTIMENTOS
            internal static let sellers = L10n.tr("Localizable", "caoa.weare.sellers")
            /// LOJAS
            internal static let stores = L10n.tr("Localizable", "caoa.weare.stores")
            /// LINHA DO TEMPO
            internal static let timeline = L10n.tr("Localizable", "caoa.weare.timeline")
            /// SOMOS CAOA
            internal static let title = L10n.tr("Localizable", "caoa.weare.title")
            /// VEICULOS
            internal static let vehicles = L10n.tr("Localizable", "caoa.weare.vehicles")
            /// ANOS
            internal static let years = L10n.tr("Localizable", "caoa.weare.years")
        }
    }
    
    // MARK: FORM
    internal enum Form {
        /// DATA NASCIMENTO
        internal static let birthday = L10n.tr("Localizable", "form.birthday")
        ///
        internal static let birthdayHint = L10n.tr("Localizable", "form.birthdayHint")
        /// CEP
        internal static let cep = L10n.tr("Localizable", "form.cep")
        ///
        internal static let cepHint = L10n.tr("Localizable", "form.cepHint")
        /// HEADER
        internal static let chatheader = L10n.tr("Localizable", "form.chatheader")
        /// CIDADE
        internal static let city = L10n.tr("Localizable", "form.city")
        ///
        internal static let cityHint = L10n.tr("Localizable", "form.cityHint")
        /// CNH
        internal static let cnh = L10n.tr("Localizable", "form.cnh")
        ///
        internal static let cnhHint = L10n.tr("Localizable", "form.cnhHint")
        /// CNH CATEGORIA
        internal static let cnhCat = L10n.tr("Localizable", "form.cnhCat")
        ///
        internal static let cnhCatHint = L10n.tr("Localizable", "form.cnhCatHint")
        /// CNH EMISSAO
        internal static let cnhEmi = L10n.tr("Localizable", "form.cnhEmi")
        ///
        internal static let cnhEmiHint = L10n.tr("Localizable", "form.cnhEmiHint")
        /// CNH VALIDADE
        internal static let cnhVal = L10n.tr("Localizable", "form.cnhVal")
        ///
        internal static let cnhValHint = L10n.tr("Localizable", "form.cnhValHint")
        /// COMENTARIOS
        internal static let cnpj = L10n.tr("Localizable", "form.cnpj")
        ///
        internal static let cnpjHint = L10n.tr("Localizable", "form.cnpjHint")
        /// COMENTARIOS
        internal static let comment = L10n.tr("Localizable", "form.comment")
        ///
        internal static let commentHint = L10n.tr("Localizable", "form.commentHint")
        /// COMPLEMENTO
        internal static let comp = L10n.tr("Localizable", "form.comp")
        ///
        internal static let compHint = L10n.tr("Localizable", "form.compHint")
        /// COMPLEMENTO
        internal static let cpf = L10n.tr("Localizable", "form.cpf")
        ///
        internal static let cpfHint = L10n.tr("Localizable", "form.cpfHint")
        /// CPF/CNPJ
        internal static let cpfj = L10n.tr("Localizable", "form.cpfj")
        ///
        internal static let cpfjHint = L10n.tr("Localizable", "form.cpfjHint")
        /// EMAIL
        internal static let email = L10n.tr("Localizable", "form.email")
        ///
        internal static let emailHint = L10n.tr("Localizable", "form.emailHint")
        /// CONTATO FLEET
        internal static let fleetheader = L10n.tr("Localizable", "form.fleetheader")
        /// NOME COMPLETO
        internal static let fullName = L10n.tr("Localizable", "form.fullName")
        ///
        internal static let fullNameHint = L10n.tr("Localizable", "form.fullNameHint")
        /// INFORMACOES DE ENDERECO
        internal static let infoAddr = L10n.tr("Localizable", "form.infoAddr")
        /// INFORMACOES PESSOAIS
        internal static let infoClient = L10n.tr("Localizable", "form.infoClient")
        /// INFORMACOES DA CNH
        internal static let infoCnh = L10n.tr("Localizable", "form.infoCnh")
        /// INFORMACOES DE CONTATO
        internal static let infoContact = L10n.tr("Localizable", "form.infoContact")
        /// PROFISSAO
        internal static let job = L10n.tr("Localizable", "form.job")
        ///
        internal static let jobHint = L10n.tr("Localizable", "form.jobHint")
        /// KMS
        internal static let kms = L10n.tr("Localizable", "form.kms")
        ///
        internal static let kmsHint = L10n.tr("Localizable", "form.kmsHint")
        /// MODELO
        internal static let mName = L10n.tr("Localizable", "form.mName")
        ///
        internal static let mNameHint = L10n.tr("Localizable", "form.mNameHint")
        /// MODELO
        internal static let model = L10n.tr("Localizable", "form.model")
        ///
        internal static let modelHint = L10n.tr("Localizable", "form.modelHint")
        /// NOME
        internal static let name = L10n.tr("Localizable", "form.name")
        ///
        internal static let nameHint = L10n.tr("Localizable", "form.nameHint")
        /// NOME
        internal static let neighbor = L10n.tr("Localizable", "form.neighbor")
        ///
        internal static let neighborHint = L10n.tr("Localizable", "form.neighborHint")
        /// TELEFONE
        internal static let phone = L10n.tr("Localizable", "form.phone")
        /// TELEFONE (DDD)
        internal static let phoneDDD = L10n.tr("Localizable", "form.phoneDDD")
        ///
        internal static let phoneHint = L10n.tr("Localizable", "form.phoneHint")
        /// QUANTIDADE
        internal static let qtd = L10n.tr("Localizable", "form.qtd")
        ///
        internal static let qtdHint = L10n.tr("Localizable", "form.qtdHint")
        /// DUVIDAS
        internal static let question = L10n.tr("Localizable", "form.question")
        /// 
        internal static let questionHint = L10n.tr("Localizable", "form.questionHint")
        /// RG
        internal static let rg = L10n.tr("Localizable", "form.rg")
        ///
        internal static let rgHint = L10n.tr("Localizable", "form.rgHint")
        /// ENVIAR
        internal static let send = L10n.tr("Localizable", "form.send")
        ///
        internal static let sendHint = L10n.tr("Localizable", "form.sendHint")
        /// ESTADO
        internal static let state = L10n.tr("Localizable", "form.state")
        ///
        internal static let stateHint = L10n.tr("Localizable", "form.stateHint")
        /// ENDERECO
        internal static let street = L10n.tr("Localizable", "form.street")
        ///
        internal static let streetHint = L10n.tr("Localizable", "form.streetHint")
        /// NUMERO
        internal static let streetNumber = L10n.tr("Localizable", "form.streetNumber")
        ///
        internal static let streetNumberHint = L10n.tr("Localizable", "form.streetNumberHint")
        /// TERMOS
        internal static let terms = L10n.tr("Localizable", "form.terms")
        ///
        internal static let termsHint = L10n.tr("Localizable", "form.termsHint")
        // MARK: CHECKBOX
        internal enum Check {
            /// ACEITO EMAIL
            internal static let email = L10n.tr("Localizable", "form.check.email")
            ///
            internal static let emailHint = L10n.tr("Localizable", "form.check.emailHint")
            /// ACEITO TERMOS
            internal static let privacy = L10n.tr("Localizable", "form.check.privacy")
            ///
            internal static let privacyHint = L10n.tr("Localizable", "form.check.privacyHint")
            /// ACEITO SMS
            internal static let sms = L10n.tr("Localizable", "form.check.sms")
            ///
            internal static let smsHint = L10n.tr("Localizable", "form.check.smsHint")
            /// ACEITO WHATSAPP
            internal static let whatsapp = L10n.tr("Localizable", "form.check.whatsapp")
            ///
            internal static let whatsappHint = L10n.tr("Localizable", "form.check.whatsappHint")
        }
        // MARK: POPUP
        internal enum Popup {
            /// ENTRAR EM CONTATO
            internal static let desc = L10n.tr("Localizable", "form.popup.desc")
            /// FORMULÁRIO ENVIADO
            internal static let header = L10n.tr("Localizable", "form.popup.header")
        }
    }
    
    // USER
    internal enum User {
        // MARK: USER CARD
        internal enum Card {
            /// CVV
            internal static let cvv = L10n.tr("Localizable", "user.card.cvv")
            ///
            internal static let cvvHint = L10n.tr("Localizable", "user.card.cvvHint")
            /// DATA EXPIRACAO
            internal static let date = L10n.tr("Localizable", "user.card.date")
            ///
            internal static let dateHint = L10n.tr("Localizable", "user.card.dateHint")
            /// EXCLUIR CARTÂO
            internal static let delete = L10n.tr("Localizable", "user.card.delete")
            /// SEM CARTOES
            internal static let empty = L10n.tr("Localizable", "user.card.empty")
            /// NOME NO CARTAO
            internal static let name = L10n.tr("Localizable", "user.card.name")
            ///
            internal static let nameHint = L10n.tr("Localizable", "user.card.nameHint")
            /// NUMERO CARTAO
            internal static let number = L10n.tr("Localizable", "user.card.number")
            ///
            internal static let numberHint = L10n.tr("Localizable", "user.card.numberHint")
            /// CARTÕES
            internal static let title = L10n.tr("Localizable", "user.card.title")
        }
        
        // MARK: USER CHANGE PASSWORD
        internal enum ChangePassword {
            /// SENHA ALTERADA COM SUCESSO
            internal static let alert = L10n.tr("Localizable", "user.changePassword.alert")
            /// ALTERAR
            internal static let button = L10n.tr("Localizable", "user.changePassword.button")
            ///
            internal static let buttonHint = L10n.tr("Localizable", "user.changePassword.buttonHint")
            /// SENHA NOVA
            internal static let newPassword = L10n.tr("Localizable", "user.changePassword.newPassword")
            ///
            internal static let newPasswordHint = L10n.tr("Localizable", "user.changePassword.newPasswordHint")
            /// SENHA ANTIGA
            internal static let oldPassword = L10n.tr("Localizable", "user.changePassword.oldPassword")
            ///
            internal static let oldPasswordHint = L10n.tr("Localizable", "user.changePassword.oldPasswordHint")
            /// REPETIR SENHA NOVA
            internal static let rePassword = L10n.tr("Localizable", "user.changePassword.rePassword")
            ///
            internal static let rePasswordHint = L10n.tr("Localizable", "user.changePassword.rePasswordHint")
            /// ALTERAR SENHA
            internal static let title = L10n.tr("Localizable", "user.changePassword.title")
        }

        // MARK: USER CHAT
        internal enum Chat {
            /// FALE COM UM
            internal static let button = L10n.tr("Localizable", "user.chat.button")
            /// 
            internal static let buttonHint = L10n.tr("Localizable", "user.chat.buttonHint")
            /// FALE CONOSCO
            internal static let title = L10n.tr("Localizable", "user.chat.title")
            /// CONVERSA
            internal static let caoa = L10n.tr("Localizable", "user.chat.caoa")
            /// FINALIZADO
            internal static let end = L10n.tr("Localizable", "user.chat.end")
            /// DIGITE
            internal static let placeholder = L10n.tr("Localizable", "user.chat.placeholder")
            ///
            internal static let hint = L10n.tr("Localizable", "user.chat.hint")
        }
        
        // MARK: USER DOC
        internal enum Doc {
            /// COMPROVANTE DE ENDEREÇO
            internal static let addrHeader = L10n.tr("Localizable", "user.doc.addrHeader")
            /// POPUP
            internal static let alert = L10n.tr("Localizable", "user.doc.alert")
            /// CATEGORIA
            internal static let catLabel = L10n.tr("Localizable", "user.doc.catLabel")
            /// CNH
            internal static let cnhHeader = L10n.tr("Localizable", "user.doc.cnhHeader")
            /// NÚMERO DA CNH
            internal static let cnhLabel = L10n.tr("Localizable", "user.doc.cnhLabel")
            /// ATUALIZADO EM
            internal static let date = L10n.tr("Localizable", "user.doc.date")
            /// DATA DE EMISSÃO
            internal static let emiLabel = L10n.tr("Localizable", "user.doc.emiLabel")
            /// DOCUMENTO EXPIRADO
            internal static let expired = L10n.tr("Localizable", "user.doc.expired")
            /// COMPROVANTE DE RENDA
            internal static let incomeHeader = L10n.tr("Localizable", "user.doc.incomeHeader")
            /// DOCUMENTO INVÁLIDO
            internal static let invalid = L10n.tr("Localizable", "user.doc.invalid")
            /// ENVIAR DOCUMENTO
            internal static let send = L10n.tr("Localizable", "user.doc.send")
            /// MEUS DOCUMENTOS
            internal static let title = L10n.tr("Localizable", "user.doc.title")
            /// DOCUMENTO VÁLIDO
            internal static let valid = L10n.tr("Localizable", "user.doc.valid")
            /// VALIDADE
            internal static let valLabel = L10n.tr("Localizable", "user.doc.valLabel")
            /// EM VALIDAÇÃO
            internal static let waiting = L10n.tr("Localizable", "user.doc.waiting")
        }
        
        // MARK: USER FAQ
        internal enum FAQ {
            /// TODOS
            internal static let all = L10n.tr("Localizable", "user.faq.all")
            /// SEMPRE
            internal static let always = L10n.tr("Localizable", "user.faq.always")
            /// FLEET
            internal static let fleet = L10n.tr("Localizable", "user.faq.fleet")
            ///
            internal static let hint = L10n.tr("Localizable", "user.faq.hint")
            /// RENT A CAR
            internal static let rent = L10n.tr("Localizable", "user.faq.rent")
            /// BUSCAR
            internal static let search = L10n.tr("Localizable", "user.faq.search")
            ///
            internal static let searchHint = L10n.tr("Localizable", "user.faq.searchHint")
            /// AJUDA
            internal static let title = L10n.tr("Localizable", "user.faq.title")
        }
        
        // MARK: USER INFO
        internal enum Info {
            /// ENDEREÇO
            internal static let address = L10n.tr("Localizable", "user.info.address")
            /// CIDADE
            internal static let city = L10n.tr("Localizable", "user.info.city")
            /// CEP
            internal static let cep = L10n.tr("Localizable", "user.info.cep")
            /// CNPJ
            internal static let cnpj = L10n.tr("Localizable", "user.info.cnpj")
            /// COMPLEMENTO
            internal static let comp = L10n.tr("Localizable", "user.info.comp")
            /// CPF
            internal static let cpf = L10n.tr("Localizable", "user.info.cpf")
            /// EMAIL
            internal static let email = L10n.tr("Localizable", "user.info.email")
            /// NOME
            internal static let name = L10n.tr("Localizable", "user.info.name")
            /// BAIRRO
            internal static let nbhood = L10n.tr("Localizable", "user.info.nbhood")
            /// NUMERO
            internal static let number = L10n.tr("Localizable", "user.info.number")
            /// TELEFONE
            internal static let phone = L10n.tr("Localizable", "user.info.phone")
            /// ESTADO
            internal static let state = L10n.tr("Localizable", "user.info.state")
            /// MEU PERFIL
            internal static let title = L10n.tr("Localizable", "user.info.title")
        }
        
        // MARK: USER PROFILE
        internal enum Profile {
            /// CAOA
            internal static let caoa = L10n.tr("Localizable", "user.profile.caoa")
            ///
            internal static let descHolder = L10n.tr("Localizable", "user.profile.descHolder")
            /// VISITANTE
            internal static let nameHolder = L10n.tr("Localizable", "user.profile.nameHolder")
            /// PERFIL
            internal static let title = L10n.tr("Localizable", "user.profile.title")
        }
        
        // MARK: USER REPLACE PASSWORD
        internal enum ReplacePassword {
            /// ALTERAR
            internal static let button = L10n.tr("Localizable", "user.replacePassword.button")
            ///
            internal static let buttonHint = L10n.tr("Localizable", "user.replacePassword.buttonHint")
            /// SENHA NOVA
            internal static let newPassword = L10n.tr("Localizable", "user.replacePassword.newPassword")
            /// SENHA INVÀLIDA
            internal static let newPasswordError = L10n.tr("Localizable", "user.replacePassword.newPasswordError")
            ///
            internal static let newPasswordHint = L10n.tr("Localizable", "user.replacePassword.newPasswordHint")
        }
    }
    
    // MARK: HOME
    internal enum Home {
        /// NOSSA FROTA
        internal static let car = L10n.tr("Localizable", "home.car")
        /// DETALHES
        internal static let details = L10n.tr("Localizable", "home.details")
        /// AJUDAR
        internal static let faq = L10n.tr("Localizable", "home.faq")
        /// VISITANTE
        internal static let guest = L10n.tr("Localizable", "home.guest")
        /// AJUDA
        internal static let help = L10n.tr("Localizable", "home.help")
        /// BEM-VINDO
        internal static let long = L10n.tr("Localizable", "home.long")
        /// SERVIÇOS
        internal static let service = L10n.tr("Localizable", "home.service")
        /// HOME
        internal static let title = L10n.tr("Localizable", "home.title")
        /// OLA
        internal static let welcome = L10n.tr("Localizable", "home.welcome")
        // MARK: INFO
        internal enum Info {
            /// ALWAYS
            internal static let always = L10n.tr("Localizable", "home.info.always")
            /// FLEET
            internal static let fleet = L10n.tr("Localizable", "home.info.fleet")
            /// SOMOS
            internal static let header = L10n.tr("Localizable", "home.info.header")
            /// HISTORIA COMPLETA
            internal static let history = L10n.tr("Localizable", "home.info.history")
            /// A CAOA
            internal static let intro = L10n.tr("Localizable", "home.info.intro")
            /// RENT
            internal static let rent = L10n.tr("Localizable", "home.info.rent")
        }
    }
    
    // MARK: PROMOTION
    internal enum Promotion {
        /// TEM CUPOM
        internal static let header = L10n.tr("Localizable", "promotion.header")
        /// DETALHES
        internal static let text = L10n.tr("Localizable", "promotion.text")
        /// PEGAR
        internal static let button = L10n.tr("Localizable", "promotion.button")
        ///
        internal static let buttonHint = L10n.tr("Localizable", "promotion.buttonHint")
    }
    
    // RENT
    internal enum Rent {
        /// ALUGUEL
        internal static let title = L10n.tr("Localizable", "rent.title")
        
        // MARK: RENT ALL
        internal enum All {
            /// SEMPRE
            internal static let always = L10n.tr("Localizable", "rent.all.always")
            /// ALUGUEIS
            internal static let alwaysButton = L10n.tr("Localizable", "rent.all.alwaysButton")
            /// SEMPRE
            internal static let alwaysEmpty = L10n.tr("Localizable", "rent.all.alwaysEmpty")
            /// FLEET
            internal static let fleet = L10n.tr("Localizable", "rent.all.fleet")
            /// FLEET
            internal static let fleetEmpty = L10n.tr("Localizable", "rent.all.fleetEmpty")
            /// RENT A CAR
            internal static let rent = L10n.tr("Localizable", "rent.all.rent")
            /// RENT A CAR
            internal static let rentEmpty = L10n.tr("Localizable", "rent.all.rentEmpty")
            /// SOLICITE
            internal static let request = L10n.tr("Localizable", "rent.all.request")
            /// ACESSE O SITE
            internal static let site = L10n.tr("Localizable", "rent.all.site")
            /// ESGOTADO
            internal static let soldout = L10n.tr("Localizable", "rent.all.soldout")
            /// LOCACAO
            internal static let title = L10n.tr("Localizable", "rent.all.title")
        }
        
        // MARK: RENT ALWAYS
        internal enum Always {
            /// ALERTA
            internal static let alert = L10n.tr("Localizable", "rent.always.alert")
            /// COR
            internal static let color = L10n.tr("Localizable", "rent.always.color")
            /// DOCUMENTACAO
            internal static let doc = L10n.tr("Localizable", "rent.always.doc")
            /// SERVICOS EXTRAS
            internal static let extraServices = L10n.tr("Localizable", "rent.always.extraServices")
            /// CAOA SEMPRE
            internal static let header = L10n.tr("Localizable", "rent.always.header")
            /// ITEM 0
            internal static let item0 = L10n.tr("Localizable", "rent.always.item0")
            /// ITEM 1
            internal static let item1 = L10n.tr("Localizable", "rent.always.item1")
            /// ITEM 2
            internal static let item2 = L10n.tr("Localizable", "rent.always.item2")
            /// ITEM 3
            internal static let item3 = L10n.tr("Localizable", "rent.always.item3")
            /// ITEM 4
            internal static let item4 = L10n.tr("Localizable", "rent.always.item4")
            /// ITEM 5
            internal static let item5 = L10n.tr("Localizable", "rent.always.item5")
            /// KM
            internal static let km = L10n.tr("Localizable", "rent.always.km")
            ///
            internal static let kmHint = L10n.tr("Localizable", "rent.always.kmHint")
            /// OBRIGATÓRIO
            internal static let must = L10n.tr("Localizable", "rent.always.must")
            /// CONCESSIONARIA
            internal static let place = L10n.tr("Localizable", "rent.always.place")
            /// KM
            internal static let placeHeader = L10n.tr("Localizable", "rent.always.placeHeader")
            ///
            internal static let placeHint = L10n.tr("Localizable", "rent.always.placeHint")
            /// FINAL DA PLACA
            internal static let plate = L10n.tr("Localizable", "rent.always.plate")
            ///
            internal static let plateHint = L10n.tr("Localizable", "rent.always.plateHint")
            /// ACOMPANHE EM
            internal static let popupDesc = L10n.tr("Localizable", "rent.always.popupDesc")
            /// SOLICITAÇÃO ENVIADA
            internal static let popupTitle = L10n.tr("Localizable", "rent.always.popupTitle")
            /// PELICULA PROTETORA
            internal static let protection = L10n.tr("Localizable", "rent.always.protection")
            /// PELICULA ANTIVANDALISMO
            internal static let protectionFull = L10n.tr("Localizable", "rent.always.protectionFull")
            /// SELELECIONAR VEICULO
            internal static let select = L10n.tr("Localizable", "rent.always.select")
            ///
            internal static let selectHint = L10n.tr("Localizable", "rent.always.selectHint")
            /// SERVICOS
            internal static let service = L10n.tr("Localizable", "rent.always.service")
            /// SERVICOS INCLUSOS
            internal static let services = L10n.tr("Localizable", "rent.always.services")
            /// ALERTA
            internal static let servicesAlert = L10n.tr("Localizable", "rent.always.servicesAlert")
            /// TEXTO
            internal static let text = L10n.tr("Localizable", "rent.always.text")
            /// PERIODO
            internal static let time = L10n.tr("Localizable", "rent.always.time")
            /// KM/MES
            internal static let timeHeader = L10n.tr("Localizable", "rent.always.timeHeader")
            ///
            internal static let timeHint = L10n.tr("Localizable", "rent.always.timeHint")
            /// CAOA SEMPRE
            internal static let title = L10n.tr("Localizable", "rent.always.title")
            /// DEFINIR VEICULO
            internal static let vehicleHeader = L10n.tr("Localizable", "rent.always.timeHeader")
        }
        
        // MARK: RENT CAR
        internal enum Car {
            /// RENT A CAR
            internal static let header = L10n.tr("Localizable", "rent.car.header")
            /// ITEM 0
            internal static let item0 = L10n.tr("Localizable", "rent.car.item0")
            /// ITEM 1
            internal static let item1 = L10n.tr("Localizable", "rent.car.item1")
            /// ITEM 2
            internal static let item2 = L10n.tr("Localizable", "rent.car.item2")
            /// TEXTO
            internal static let text = L10n.tr("Localizable", "rent.car.text")
        }
        
        // MARK: RENT DETAILS
        internal enum Details {
            /// FINALIZAR
            internal static let checkout = L10n.tr("Localizable", "rent.details.checkout")
            /// TEM CERTEZA
            internal static let delete = L10n.tr("Localizable", "rent.details.delete")
            /// DOCUMENTACAO
            internal static let doc = L10n.tr("Localizable", "rent.details.doc")
            /// REVISAR DOCUMENTOS
            internal static let docDenied = L10n.tr("Localizable", "rent.details.docDenied")
            /// DOCUMENTOS OK
            internal static let docOk = L10n.tr("Localizable", "rent.details.docOk")
            /// DOCUMENTOS EM AVALIAÇÃO
            internal static let docWait = L10n.tr("Localizable", "rent.details.docWait")
            /// ENCERRAMENTO
            internal static let ending = L10n.tr("Localizable", "rent.details.ending")
            /// FINALIZAR SOLICITACAO
            internal static let finish = L10n.tr("Localizable", "rent.details.finish")
            /// PREENCHER FORMULARIO
            internal static let form = L10n.tr("Localizable", "rent.details.form")
            /// DETALHES
            internal static let header = L10n.tr("Localizable", "rent.details.header")
            /// SEM CARTÃO
            internal static let noPayment = L10n.tr("Localizable", "rent.details.noPayment")
            /// PAGAMENTO
            internal static let payment = L10n.tr("Localizable", "rent.details.payment")
            /// CONCESSIONARIA
            internal static let store = L10n.tr("Localizable", "rent.details.store")
            /// TIPO LOCACAO
            internal static let type = L10n.tr("Localizable", "rent.details.type")
            /// DETALHES
            internal static let title = L10n.tr("Localizable", "rent.details.title")
        }
        
        // MARK: RENT FLEET
        internal enum Fleet {
            /// RENT A CAR
            internal static let header = L10n.tr("Localizable", "rent.fleet.header")
            /// POR FIM
            internal static let infoHeader = L10n.tr("Localizable", "rent.fleet.infoHeader")
            /// ITEM 0
            internal static let item0 = L10n.tr("Localizable", "rent.fleet.item0")
            /// ITEM 1
            internal static let item1 = L10n.tr("Localizable", "rent.fleet.item1")
            /// ITEM 2
            internal static let item2 = L10n.tr("Localizable", "rent.fleet.item2")
            /// TAMANHO DA FROTA
            internal static let kmHeader = L10n.tr("Localizable", "rent.fleet.kmHeader")
            /// SELECIONAR MODELO
            internal static let modelHeader = L10n.tr("Localizable", "rent.fleet.modelHeader")
            /// TEXTO
            internal static let text = L10n.tr("Localizable", "rent.fleet.text")
            /// CAOA FLEET
            internal static let title = L10n.tr("Localizable", "rent.fleet.title")
        }
    }
    
    // SERVICES
    internal enum Services {
        
        // MARK: SERVICES CHECKOUT
        internal enum Checkout {
            /// CANCELAR
            internal static let cancel = L10n.tr("Localizable", "services.checkout.cancel")
            ///
            internal static let cancelHint = L10n.tr("Localizable", "services.checkout.cancelHint")
            /// TEM CERTEZA
            internal static let delete = L10n.tr("Localizable", "services.checkout.delete")
            /// DATA
            internal static let date = L10n.tr("Localizable", "services.checkout.date")
            /// DETALHES
            internal static let details = L10n.tr("Localizable", "services.checkout.details")
            /// AGENDAMENTO
            internal static let desc = L10n.tr("Localizable", "services.checkout.desc")
            /// REVISAO
            internal static let info = L10n.tr("Localizable", "services.checkout.info")
            /// LOCAL
            internal static let place = L10n.tr("Localizable", "services.checkout.place")
            /// SERVICOS
            internal static let service = L10n.tr("Localizable", "services.checkout.service")
            /// ESTADO
            internal static let status = L10n.tr("Localizable", "services.checkout.status")
            /// HORA
            internal static let time = L10n.tr("Localizable", "services.checkout.time")
            /// FINALIZAR
            internal static let title = L10n.tr("Localizable", "services.checkout.title")
            /// VEICULO
            internal static let vehicle = L10n.tr("Localizable", "services.checkout.vehicle")
        }
        
        // MARK: SERVICES RECENT
        internal enum Recent {
            /// VAZIO
            internal static let empty = L10n.tr("Localizable", "services.recent.empty")
            /// HISTÓRICO
            internal static let history = L10n.tr("Localizable", "services.recent.history")
            /// MULTIPLOS
            internal static let multi = L10n.tr("Localizable", "services.recent.multi")
            /// SERVIÇOS
            internal static let title = L10n.tr("Localizable", "services.recent.title")
        }
        
        // MARK: SERVICES SCHEDULE
        internal enum Schedule {
            /// EMBELEZAMENTO
            internal static let beauty = L10n.tr("Localizable", "services.schedule.beauty")
            /// AGENDAMENTO
            internal static let button = L10n.tr("Localizable", "services.schedule.button")
            /// DATA
            internal static let date = L10n.tr("Localizable", "services.schedule.date")
            ///
            internal static let dateHint = L10n.tr("Localizable", "services.schedule.dateHint")
            /// REPAROS
            internal static let fix = L10n.tr("Localizable", "services.schedule.fix")
            /// SERVIÇO
            internal static let header1 = L10n.tr("Localizable", "services.schedule.header1")
            /// VEICULO
            internal static let header2 = L10n.tr("Localizable", "services.schedule.header2")
            /// LOCAL
            internal static let header3 = L10n.tr("Localizable", "services.schedule.header3")
            /// OBSERVACAO
            internal static let header4 = L10n.tr("Localizable", "services.schedule.header4")
            /// KM
            internal static let km = L10n.tr("Localizable", "services.schedule.km")
            ///
            internal static let kmHint = L10n.tr("Localizable", "services.schedule.kmHint")
            /// MODELO
            internal static let model = L10n.tr("Localizable", "services.schedule.model")
            ///
            internal static let modelHint = L10n.tr("Localizable", "services.schedule.modelHint")
            ///
            internal static let obsHint = L10n.tr("Localizable", "services.schedule.obsHint")
            /// PLACA
            internal static let plate = L10n.tr("Localizable", "services.schedule.plate")
            ///
            internal static let plateHint = L10n.tr("Localizable", "services.schedule.plateHint")
            /// CONCESSIONARIA
            internal static let provider = L10n.tr("Localizable", "services.schedule.provider")
            /// DIRIJA-SE
            internal static let popupDesc = L10n.tr("Localizable", "services.schedule.popupDesc")
            /// SOLICITACAO
            internal static let popupTitle = L10n.tr("Localizable", "services.schedule.popupTitle")
            ///
            internal static let providerHint = L10n.tr("Localizable", "services.schedule.providerHint")
            /// CIDADE
            internal static let providerSearch = L10n.tr("Localizable", "services.schedule.providerSearch")
            ///
            internal static let providerSearchHint = L10n.tr("Localizable", "services.schedule.providerSearchHint")
            /// CONCESSIONARIA
            internal static let providerTitle = L10n.tr("Localizable", "services.schedule.providerTitle")
            /// REVISÃO
            internal static let revision = L10n.tr("Localizable", "services.schedule.revision")
            /// SELECIONAR
            internal static let select = L10n.tr("Localizable", "services.schedule.select")
            ///
            internal static let selectHint = L10n.tr("Localizable", "services.schedule.selectHint")
            /// SELECIONE UM HORÁRIO
            internal static let time = L10n.tr("Localizable", "services.schedule.time")
            ///
            internal static let timeHint = L10n.tr("Localizable", "services.schedule.timeHint")
            /// PNEUS
            internal static let tires = L10n.tr("Localizable", "services.schedule.tires")
            /// AGENDAR
            internal static let title = L10n.tr("Localizable", "services.schedule.title")
            /// ANO
            internal static let year = L10n.tr("Localizable", "services.schedule.year")
            ///
            internal static let yearHint = L10n.tr("Localizable", "services.schedule.yearHint")
        }
    }
}

// MARK: - Implementation Details
extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
