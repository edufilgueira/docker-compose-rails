# frozen_string_literal: true

class ClassesGrupoPatrimonio
  def self.migrar_base
    todos_grupos = [
      { codigo: '35', nome: 'MAQUINAS E EQUIPAMENTOS PARA SERVIÇOS GERAIS' },
      { codigo: '53', nome: 'FERRAGENS E ABRASIVOS' },
      { codigo: '37', nome: 'MAQUINARIA E EQUIPAMENTOS AGRÍCOLAS' },
      { codigo: '39', nome: 'MAQUINAS E EQUIPAMENTOS PARA MANUSEIO DE MATERIAL' },
      { codigo: '41', nome: 'EQUIPAMENTOS PARA REFRIGERAÇAO, CONDICIONAMENTO E PURIFICAÇÃO DE AR' },
      { codigo: '43', nome: 'BOMBAS E COMPRESSORES' },
      { codigo: '45', nome: 'EQUIPAMENTO DE INSTALAÇÕES HIDRAULICAS, SANITARIAS E DE CALEFAÇÃO' },
      { codigo: '51', nome: 'FERRAMENTAS MANUAIS' },
      { codigo: '58', nome: 'EQUIPAMENTOS DE COMUNICAÇÃO, DETECÇÃO E RADIAÇÃO' },
      { codigo: '59', nome: 'COMPONENTES DE EQUIPAMENTOS ELETRICOS E ELETRONICOS' },
      { codigo: '65', nome: 'EQUIPAMENTOS, MEDICAMENTOS, ARTIGOS DE USO MEDICO, ODONTOLOGICO, HOSPITALAR E L' },
      { codigo: '67', nome: 'EQUIPAMENTOS FOTOGRAFICOS, FILMOGRAFICOS E FONOGRAFICOS' },
      { codigo: '70', nome: 'EQUIPAMENTOS DE PROCESSAMENTO DE DADOS, DE SUPORTE SOFTWARE E SUPRIMENTOS' },
      { codigo: '71', nome: 'MOBILIÁRIOS EM GERAL' },
      { codigo: '72', nome: 'ARTIGOS, UTENSILIOS, E UTILIDADES DE USO DOMESTICO E COMERCIAL' },
      { codigo: '79', nome: 'EQUIPAMENTOS E MATERIAIS PARA LIMPEZA' },
      { codigo: '73', nome: 'EQUIPAMENTOS PARA REFEITORIO, COPA E COZINHA' },
      { codigo: '75', nome: 'ARTIGOS E UTENSILIOS DE ESCRITORIO' },
      { codigo: '77', nome: 'INSTRUMENTOS MUSICAIS' },
      { codigo: '78', nome: 'EQUIPAMENTOS E MATERIAIS PARA RECREAÇÃO E DESPORTO' },
      { codigo: '81', nome: 'RECIPIENTES E MATERIAIS PARA ACONDICIONAMENTO E EMBALAGEM' },
      { codigo: '84', nome: 'VESTUARIO, EQUIPAMENTOS INDIVIDUAIS E INSIGNIAS' },
      { codigo: '85', nome: 'ARTIGOS DE HIGIENE' },
      { codigo: '99', nome: 'MATERIAIS DIVERSOS' }
    ]
    todas_classes = {
      35 => [{ codigo: '30', nome: 'EQUIPAMENTOS DE ABASTECIMENTO E LUBRIFICACAO' }, { codigo: '10', nome: 'EQUIPAMENTOS DE LAVANDERIA E LAVAGEM A SECO' }, { codigo: '20', nome: 'EQUIPAMENTOS PARA ACONDICIONAR E EMBALAR' }],
      53 => [{ codigo: '65', nome: 'ANEIS, BUCHAS E ESPACADORES' }, { codigo: '25', nome: 'DISPOSITIVOS PARA FIXACAO' }, { codigo: '40', nome: 'FERRAMENTAS DIVERSAS E MATERIAIS ABRASIVOS' }, { codigo: '50', nome: 'MATERIAIS ABRASIVOS' }, { codigo: '90', nome: 'MATERIAIS E PECAS DE REPOSICAO E MANUTENCAO DE MAQUINAS E' }, { codigo: '5', nome: 'PARAFUSOS, PORCAS, ARRUELAS, PREGOS, PINOS, PRIOSIONEIROS E REBITES' }, { codigo: '20', nome: 'REBITES' }, { codigo: '35', nome: 'TELAS METALICAS' }],
      37 => [{ codigo: '20', nome: 'EQUIPAMENTOS DE COLHEITA' }, { codigo: '40', nome: 'EQUIPAMENTOS PARA CONTROLE DE PRAGAS, DOENCAS E GEADAS' }, { codigo: '10', nome: 'EQUIPAMENTOS PARA PREPARACAO DO SOLO' }, { codigo: '50', nome: 'IMPLEMENTOS E FERRAMENTAS DE JARDINAGEM' }, { codigo: '15', nome: 'MÁQUINAS E EQUIPAMENTOS AGRÍCOLAS' }, { codigo: '45', nome: 'MAQUINAS E EQUIPAMENTOS AGROPECUARIOS' }, { codigo: '55', nome: 'MATERIAIS E PECAS DE REPOSICAO E MANUTENCAO PARAMAQUINAS E' }],
      39 => [{ codigo: '50', nome: 'ELEVADORES E ESCADAS ROLANTES' }, { codigo: '40', nome: 'GUINCHOS, ICADORES E TALHAS' }, { codigo: '90', nome: 'MATERIAIS E PECAS DE REPOSICAO E MANUTENCAO DE MAQUINAS E EQUIPAMENTOS PARA MA' }, { codigo: '30', nome: 'TRANSPORTADORES AUTO-PROPULSIONADOS' }, { codigo: '20', nome: 'TRANSPORTADORES MANUAIS' }],
      41 => [{ codigo: '20', nome: 'EQUIPAMENTOS DE CONDICIONAMENTO DE AR' }, { codigo: '10', nome: 'EQUIPAMENTOS DE REFRIGERACAO' }, { codigo: '30', nome: 'EQUIPAMENTOS DE VENTILACAO E CIRCULACAO DE AR' }, { codigo: '90', nome: 'MATERIAIS, PEÇAS DE REPOSIÇÃO PARA EQUIPAMENTOS DE REFRIGERAÇÃO,' }],
      43 => [{ codigo: '20', nome: 'BOMBAS' }, { codigo: '10', nome: 'COMPRESSORES E ACESSORIOS' }, { codigo: '90', nome: 'MATERIAIS, PEÇAS DE REPOSIÇÃO E MANUTENÇÃO DE BOMBAS E' }],
      45 => [{ codigo: '10', nome: 'APARELHOS E ACESSORIOS PARA INSTALAÇÕES HIDRAULICAS' }, { codigo: '50', nome: 'SUPRIMENTOS PARA INSTALAÇÃO HIDRÁULICA, SANITÁRIA E DE CALEFAÇÃO' }],
      51 => [{ codigo: '70', nome: 'ACONDICIONADORES DE FERRAMENTAS E FERRAGENS' }, { codigo: '40', nome: 'ALICATES' }, { codigo: '60', nome: 'CABOS DE FERRAMENTAS MANUAIS' }, { codigo: '30', nome: 'FERRAMENTAS MANUAIS ACIONADAS POR FORCA MOTRIZ' }, { codigo: '10', nome: 'FERRAMENTAS MANUAIS DE CORTE, NAO ACIONADAS POR FORCA MOTRIZ' }, { codigo: '20', nome: 'FERRAMENTAS MANUAIS SEM CORTE, NAO ACIONADAS POR FORCA MOTRIZ' }, { codigo: '50', nome: 'JOGOS E CONJUNTOS DE FERRAMENTAS MANUAIS' }, { codigo: '90', nome: 'PECAS E MATERIAIS DE REPOSICAO OU MANUTENCAO DE FERRAMENTAS' }],
      58 => [{ codigo: '6', nome: 'EQUIPAMENTOS DE TELEFONIA MOVEL' }, { codigo: '20', nome: 'EQUIPAMENTOS PARA COMUNICAÇÃO POR RADIO E TELEVISÃO, EXCETO OS DE' }, { codigo: '5', nome: 'EQUIPAMENTOS TELEFONICOS E TELEGRAFICOS' }, { codigo: '90', nome: 'PEÇAS, ACESSÓRIOS E MATERIAIS PARA EQUIPAMENTOS DE COMUNICAÇÃO,' }],
      59 => [{ codigo: '36', nome: 'ACESSORIOS DE EQUIPAMENTOS ELETRICOS E ELETRONICOS' }, { codigo: '10', nome: 'CAPACITORES' }, { codigo: '30', nome: 'CHAVES ELETRICAS E INTERRUPTORES' }, { codigo: '35', nome: 'CONECTORES ELETRICOS' }, { codigo: '25', nome: 'DISJUNTORES' }, { codigo: '61', nome: 'DISPOSITIVOS A SEMICONDUTOR E PLACAS ASSOCIADAS (CIRCUITOS)' }, { codigo: '65', nome: 'FONES, MICROFONES E ALTO-FALANTES' }, { codigo: '20', nome: 'FUSIVEIS INTERRUPTORES E PROTETORES' }, { codigo: '70', nome: 'ISOLADORES ELETRICOS E MATERIAIS ISOLANTES' }, { codigo: '63', nome: 'MODULOS ELETRONICOS' }, { codigo: '40', nome: 'PLACAS, TERMINAIS E LAMINAS TERMINAIS' }, { codigo: '45', nome: 'RELES E SELENOIDES' }],
      65 => [{ codigo: '67', nome: 'COMPONENTES DE EQUIPAMENTOS DE USO LABORATORIAL' }, { codigo: '12', nome: 'COMPONENTES PARA EQUIPAMENTOS DE USO ODONTOLOGICO' }, { codigo: '7', nome: 'COMPONENTES PARA EQUIPAMENTOS MEDICO-HOSPITALARES' }, { codigo: '2', nome: 'COMPONENTES PARA MOBILIARIO MEDICO-HOSPITALAR' }, { codigo: '66', nome: 'EQUIPAMENTOS DE USO LABORATORIAL' }, { codigo: '52', nome: 'EQUIPAMENTOS E ACESSORIOS PARA FISIOTERAPIA' }, { codigo: '11', nome: 'EQUIPAMENTOS E MOBILIARIO DE USO ODONTOLOGICO' }, { codigo: '6', nome: 'EQUIPAMENTOS MEDICO-HOSPITALARES' }, { codigo: '21', nome: 'INSTRUMENTAL DE USO MEDICO, CIRURGICO OU HOSPITALAR' }, { codigo: '14', nome: 'INSTRUMENTAL DE USO ODONTOLOGICO' }, { codigo: '65', nome: 'INSTRUMENTOS DE ÓTICA' }, { codigo: '68', nome: 'INSUMOS DE EQUIPAMENTOS DE USO LABORATORIAL' }, { codigo: '13', nome: 'INSUMOS DE USO ODONTOLOGICO' }, { codigo: '86', nome: 'INSUMOS PARA AS AREAS HEMATOLOGICA E HEMOTERAPICA' }, { codigo: '8', nome: 'INSUMOS PARA EQUIPAMENTOS MEDICO-HOSPITALARES' }, { codigo: '77', nome: 'KITS E TIRAS REAGENTES' }, { codigo: '57', nome: 'MATERIAL DE IMPLANTE CIRURGICO' }, { codigo: '26', nome: 'MATERIAL DE USO TECNICO HOSPITALAR' }, { codigo: '32', nome: 'MATERIA-PRIMA PARA INDUSTRIA FARMACEUTICA' }, { codigo: '31', nome: 'MEDICAMENTOS E INSUMOS FARMACEUTICOS' }, { codigo: '1', nome: 'MOBILIARIO MEDICO-HOSPITALAR' }, { codigo: '56', nome: 'ORTESES, PROTESES E MATERIAIS AUXILIARES' }, { codigo: '81', nome: 'PRODUTOS BIOLOGICOS E CORRELATOS' }, { codigo: '76', nome: 'REAGENTES QUIMICOS E BIOLOGICOS' }, { codigo: '23', nome: 'RECIPIENTES DE USO HOSPITALAR,ODONTOLOGICO' }, { codigo: '41', nome: 'SOLUCOES ANTI-SEPTICAS' }, { codigo: '25', nome: 'VESTUARIO DE USO MEDICO HOSPITALAR' }, { codigo: '71', nome: 'VIDRARIA E CORRELATOS PARA USO LABORATORIAL' }],
      67 => [{ codigo: '55', nome: 'ACESSORIOS PARA SOM' }, { codigo: '20', nome: 'EQUIPAMENTOS CINEMATOGRAFICOS E SEUS ACESSORIOS' }, { codigo: '30', nome: 'EQUIPAMENTOS DE PROJECAO' }, { codigo: '50', nome: 'EQUIPAMENTOS DE SOM' }, { codigo: '10', nome: 'EQUIPAMENTOS FOTOGRAFICOS E SEUS ACESSORIOS' }, { codigo: '90', nome: 'PECAS E MATERIAIS DE REPOSICAO OU MANUTENCAO DOS EQUIPAMENTOS' }, { codigo: '85', nome: 'SUPRIMENTOS PARA EQUIPAMENTOS DE REVELACAO E ACABAMENTO' }],
      70 => [{ codigo: '30', nome: 'DISPOSITIVOS PARA CONTROLE DE MICRO E MINI COMPUTADORES' }, { codigo: '10', nome: 'EQUIPAMENTOS DE PROCESSAMENTO DE DADOS' }, { codigo: '40', nome: 'IMPRESSORAS' }, { codigo: '95', nome: 'PECAS E MATERIAIS DE REPOSICAO OU MANUTENCAO DE EQUIPAMENTOSDE' }, { codigo: '50', nome: 'SOFTWARE' }, { codigo: '90', nome: 'SUPRIMENTOS DE EQUIPAMENTOS DE INFORMATICA' }, { codigo: '25', nome: 'UNIDADES DE ARMAZENAMENTO, DE ENTRADA E SAIDA DE DADOS' }],
      71 => [{ codigo: '5', nome: 'MOBILIARIO DE ESCRITORIO' }, { codigo: '10', nome: 'MOBILIARIO DE HOTELARIA E ALOJAMENTOS' }, { codigo: '20', nome: 'MOBILIARIO ESCOLAR E DE AUDITORIO' }, { codigo: '26', nome: 'MOBILIARIOS DIVERSOS' }, { codigo: '30', nome: 'MOBILIARIOS PARA ESTOCAGEM E ARMAZENAMENTO' }, { codigo: '90', nome: 'PECAS E MATERIAIS DE REPOSICAO OU MANUTENCAO DE MOBILIARIOS' }],
      72 => [{ codigo: '40', nome: 'ARTIGOS DE VIDRO DE USO DOMESTICO' }, { codigo: '5', nome: 'ARTIGOS E ACESSORIOS INFANTIS' }, { codigo: '15', nome: 'ARTIGOS ORNAMENTAIS' }, { codigo: '10', nome: 'GUARNICOES DE CAMA, MESA E ARTIGOS DE PANO' }, { codigo: '30', nome: 'RECIPIENTES E UTILIDADES DE USO DOMESTICO E COMERCIAL' }, { codigo: '20', nome: 'TAPECARIAS, CORTINAS,PERSIANAS E QUADROS' }],
      79 => [{ codigo: '10', nome: 'EQUIPAMENTOS MOTORIZADOS DE LIMPEZA' }, { codigo: '12', nome: 'SUPRIMENTOS DE EQUIPAMENTOS DE LIMPEZA' }, { codigo: '20', nome: 'UTENSILIOS DE LIMPEZA' }],
      73 => [{ codigo: '30', nome: 'ARTIGOS PARA SERVIÇOS DE MESA' }, { codigo: '10', nome: 'EQUIPAMENTOS DE COZINHA' }, { codigo: '40', nome: 'JOGOS DE REFEITORIO E COZINHA' }, { codigo: '20', nome: 'RECIPIENTES E UTENSILIOS DE COZINHA' }],
      75 => [{ codigo: '5', nome: 'ARTIGOS PARA ESCRITORIO' }, { codigo: '70', nome: 'FICHAS E CARTOES' }, { codigo: '30', nome: 'FORMULARIOS CONTINUOS' }, { codigo: '50', nome: 'IMPRESSOS OFICIAIS' }, { codigo: '20', nome: 'SUPRIMENTOS DE USO DIDATICO, PEDAGOGICO, E DE PAPELARIA DE' }, { codigo: '15', nome: 'SUPRIMENTOS PARA MAQUINAS E EQUIPAMENTOS DE ESCRITORIO E PARA' }, { codigo: '10', nome: 'UTENSILIOS PARA ESCRITORIO' }],
      77 => [{ codigo: '10', nome: 'INSTRUMENTOS MUSICAIS' }, { codigo: '20', nome: 'PECAS E ACESSORIOS DE INSTRUMENTOS MUSICAIS' }],
      78 => [{ codigo: '30', nome: 'EQUIPAMENTO PARA GINASTICA E RECREAÇÃO' }, { codigo: '10', nome: 'EQUIPAMENTOS ESPORTIVOS' }, { codigo: '20', nome: 'JOGOS, BRINQUEDOS E ARTIGOS CORRELATOS COM RODA' }, { codigo: '40', nome: 'MEDALHAS E TROFEUS' }, { codigo: '15', nome: 'VESTUARIOS ESPORTIVOS' }],
      81 => [{ codigo: '15', nome: 'CAIXAS, CAIXOTES E ENGRADADOS' }, { codigo: '25', nome: 'CILINDROS PARA GASES' }, { codigo: '35', nome: 'MATERIAIS A GRANEL PARA EMBALAGENS E ACONDICIONAMENTO' }, { codigo: '40', nome: 'RECIPIENTES E MATERIAS PARA ACONDICIONAMENTO' }, { codigo: '5', nome: 'SACOS, BOLSAS E SACOLAS' }, { codigo: '16', nome: 'SUPORTES PARA APARELHOS, EQUIPAMENTOS E MAQUINAS' }, { codigo: '10', nome: 'TAMBORES E LATAS' }],
      84 => [{ codigo: '30', nome: 'CALÇADOS' }, { codigo: '40', nome: 'COMPLEMENTOS DE VESTUARIOS' }, { codigo: '50', nome: 'DISTINTIVOS, INSIGNIAS E CONDECORACOES' }, { codigo: '60', nome: 'EQUIPAMENTOS DE PROTECAO INDIVIDUAL' }, { codigo: '10', nome: 'VESTUARIO DE USO GERAL' }, { codigo: '55', nome: 'VESTUARIO E COMPLEMENTO DE PROTECAO E SEGURANCA' }, { codigo: '20', nome: 'VESTUARIO INTIMO E PARA DORMIR' }],
      85 => [{ codigo: '30', nome: 'ARTIGOS DE PAPEL PARA HIGIENE PESSOAL' }, { codigo: '30', nome: 'COMPOSTOS E PREPARADOS PARA LIMPEZA E POLIMENTO' }, { codigo: '40', nome: 'GUARNICOES DE BANHO' }, { codigo: '10', nome: 'PRODUTOS PARA HIGIENE PESSOAL' }, { codigo: '20', nome: 'UTENSILIOS PARA HIGIENE PESSOAL' }],
      99 => [{ codigo: '2', nome: 'MATERIAIS DIVERSOS' }]
    }
    todos_grupos.each do |grupo|
      gru = GrupoPatrimonio.find_or_create_by(codigo: grupo[:codigo], nome: grupo[:nome])
      todas_classes[gru[:codigo].to_i].each do |classe|
        cla = ClassePatrimonio.find_or_create_by(codigo: classe[:codigo], nome: classe[:nome], grupo_patrimonio_id: gru.id)
      end
    end
  end
end
ClassesGrupoPatrimonio.migrar_base
